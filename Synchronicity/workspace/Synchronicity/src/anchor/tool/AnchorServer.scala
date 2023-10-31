  package anchor.tool

  import java.io.{ByteArrayOutputStream, File, PrintWriter}
  import java.nio.file.{Files, Paths}
  import java.util.Base64

  import anchor.sink.PrettyPrint.pp
  import anchor.sink._
  import anchor.tool._

  class ServerReporter(val output: PrintWriter) extends Reporter {

    def encodePNG(fileName: String) = {
      if (fileName == "") {
        ""
      } else {
        val byteArray = Files.readAllBytes(Paths.get(fileName))
        "data:image/png;base64," + Base64.getEncoder().encodeToString(byteArray);
      }
    }

    def specPath(x: Spec, path: Int): List[String] = {
      def pph(x: Expr, path: Int): List[String] = {
        x match {
          case Cond(p, t, f) => {
            if (path % 2 == 1) {
              s"${PrettyPrint.pp(p)}" :: pph(t, path / 2)
            } else {
              s"${PrettyPrint.pp(AST.not(p))}" :: pph(f, path / 2)
            }
          }
          case x             => assert(path == 0); Nil // List(PrettyPrint.pp(x))
        }
      }

      pph(x.conditionalMover, path)
    }


    def specMover(x: Spec, path: Int): String = {
      def pph(x: Expr, path: Int): String = {
        x match {
          case Cond(p, t, f) => {
            if (path % 2 == 1) {
              pph(t, path / 2)
            } else {
              pph(f, path / 2)
            }
          }
          case x             => PrettyPrint.pp(x)
        }
      }

      pph(x.conditionalMover, path)
    }

    case class TraceItem(line: Int, mover: String, stmt: String, heapFile: String, justification: String, extra: String = "") {
      override def toString: String = {
        s""" {
           |   "line": "${line}",
           |   "stmt": "${stmt}",
           |   "mover": "${mover}",
           |   "heap": "${heapFile}",
           |   "justification": { ${justification} },
           |   "extra" : "${extra}"
           | }""".stripMargin
      }
    }

    //    ${if (mover == "E") """{ "color": "warning", """ else ""}

    def toTraceItems(errorInContext: SinkErrorInContext): List[TraceItem] = {
      val ctxt = errorInContext.ctxt
      if (ctxt.trace == None) {
        return Nil
      }
      val trace = ctxt.trace.get
      val error = errorInContext.sinkError
      val fullModel: Option[SinkModel] = ctxt.model
      val models = fullModel match {
        case Some(value) => SinkModel.extract(value)
        case None        => Nil
      }

      // should really only extract models once...
      def fileForNodeModel(suffix: String): Option[String] = {
        if (models.find(_.suffix == suffix) != None) {
          if (models.find(_.suffix == suffix + "_post") != None) {
            Some(encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}.${suffix}_delta.png"))
          } else {
            Some(encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}.${suffix}.png"))
          }
        } else {
          None
        }
      }

      def stmtTextAndHeap(stmt: Stmt, indexInTrace: Int): (String, String) = {
        val str = PrettyPrint.pp(stmt).split("\n")(0)
        val firstOccurrence = trace.indexWhere(_.id == stmt.id) == indexInTrace
        val suffix = if (firstOccurrence) {
          s"${stmt.id}"
        } else {
          s"${stmt.id}_bottom"
        }

        (str, fileForNodeModel(suffix).getOrElse(""))
      }

      case class TraceContext(inlinedDepth : Int, traceOn : Boolean)

      def stmtToTraceItem(ctxt: SinkErrorContext, error: SinkError, traceContext : TraceContext, p: Stmt, index: Int) : (TraceContext, Option[TraceItem]) = {
        val TraceContext(inlineDepth, traceOn) = traceContext
        val (text, heapFile) = stmtTextAndHeap(p, index)
        val str = ("&nbsp;" * inlineDepth) + text
        val line = p.pos.line
        p match {
          case x@Yield(_)                    => {
            (traceContext, Some(TraceItem(line, "=", str, heapFile, "")))
          }
          case While(_, _, _, _) | Assert(_) => {
            (traceContext, Some(TraceItem(line, "", str, heapFile, "")))
          }
          case Commit()                      => {
            (traceContext, Some(TraceItem(line, "N", str, heapFile, "")))
          }
          case x: Acquire                    => {
            val justification =
              s"""
                 |     "preds" : [ "Always a right mover" ],
                 |     "access" : "acquire"
                 """.stripMargin
            (traceContext, Some(TraceItem(line, "R", str, heapFile, justification)))
          }
          case x: Release                    => {
            val justification =
              s"""
                 |     "preds" : [ "Always a left mover" ],
                 |     "access" : "release"
                 """.stripMargin
            (traceContext, Some(TraceItem(line, "L", str, heapFile, justification)))
          }
          case p: Moveable                   => {
            val pathStr = error.path(ctxt, p)
            if (pathStr == "") {
              (traceContext, Some(TraceItem(line, error.mover(ctxt, p), str, heapFile, "?")))
            } else {
              val path = Integer.parseInt(pathStr)
              val m = p match {
                case x: Read if x.movesAs != None  => {
                  pp(x.movesAs.get)
                }
                case x: Write if x.movesAs != None => {
                  pp(x.movesAs.get)
                }
                case _                             => {
                  error.mover(ctxt, p)
                }
              }
              val access = p match {
                case x: Read    => {
                  s"${pp(x.ref)}.${x.field}"
                }
                case x: Write   => {
                  s"${pp(x.ref)}.${x.field}"
                }
                case x: ARead   => {
                  s"${pp(x.ref)}[${pp(x.index)}]"
                }
                case x: AWrite  => {
                  s"${pp(x.ref)}[${pp(x.index)}]"
                }
                case x: CAS     => {
                  s"${x.ref}.${x.field}"
                }
                case x: Acquire => {
                  s"acq(${pp(x.lock)})"
                }
                case x: Release => {
                  s"rel(${pp(x.lock)})"
                }
              }
              val justification =
                s"""
                   |     "preds" : [ ${specPath(p.spec, path).map(x => "\"" + x + "\"").mkString(",")} ],
                   |     "access" : "${access}"
                 """.stripMargin

              (traceContext, Some(TraceItem(line, s"$m", str, heapFile, justification)))
            }
          }
          case InlineInvoke(invoke)          => {
            val result = TraceItem(line, "", ("&nbsp;" * inlineDepth) + pp(invoke), "", "", "PUSH")
            (TraceContext(inlineDepth + 1, traceOn), Some(result))
          }
          case InlineReturn()                => {
            val result = TraceItem(line, "", ("&nbsp;" * inlineDepth) + "return", "", "", "POP")
            (TraceContext(inlineDepth - 1, traceOn), Some(result))
          }
          case x@Return(_, _)                => {
            (traceContext, Some(TraceItem(line, "=", str, heapFile, "")))
          }
          case NoOp("TraceOff") => (TraceContext(inlineDepth, false), None)
          case NoOp("TraceOn") => (TraceContext(inlineDepth, true), None)
          case _                             => {
            (traceContext, Some(TraceItem(line, "", str, heapFile, "")))
          }
        }
      }

      var context = TraceContext(0, true)
      var list : List[TraceItem] = List.empty;
      for ((p,index) <- trace.zipWithIndex if !p.isInstanceOf[VarDeclStmt]) {
        val (newContext, item) = stmtToTraceItem(ctxt, error, context, p, index)
        if (newContext.traceOn)
        item match {
          case Some(value) => list = list :+ value
          case None        =>
        }
        context = newContext
      }
      list
    }

    private def traceItems(error: SinkErrorInContext) = {
      val items = toTraceItems(error)
      items.map(i => i.toString)
    }


    private def printTraceError(x: SinkErrorInContext, additionalMessage: String = "") = {
      val traces = traceItems(x).map(_.toString())

      val traceWithMessage = if (additionalMessage != "") {
        s""" { "text" : "${additionalMessage}" } \n""" :: traces
      } else {
        traces
      }



      s"""{
         |  "line" : "${x.sinkError.pos.line}",
         |  "column" : "${x.sinkError.pos.column}",
         |  "message" : "${errorMessage(x)}",
         |  "trace": [ ${traceWithMessage.mkString("", ",\n", "")} ]
         |}""".stripMargin

    }


    private def printValdityError(error: SinkErrorInContext): String = {
      val x = error.sinkError.asInstanceOf[ValidityError].x
      val y = error.sinkError.asInstanceOf[ValidityError].y
      val id = error.sinkError.asInstanceOf[ValidityError].id

      if (error.ctxt.model == None) {
        return ""
      }
      val model = error.ctxt.model.get


      def eval(acc: Access, model: SinkModel) = {
        PrettyPrint.pp(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get)
      }

      def path(acc: Access, ctxt: SinkErrorContext): Int = {
        ctxt.model.get.localInt(s"${acc.evalPrefix}_Path@0").get
      }


      def accessToString(acc: Access): String = {
        acc match {
          case ReadAccess(a, tid, evalPath)         =>
            f"""_ := ${a.sinkAccess};"""
          case WriteAccess(a, tid, value, evalPath) =>
            f"""${a.sinkAccess} := ${model.local(value).getOrElse("_")};"""
        }
      }

      def simpleToString(acc: Access): String = {
        acc match {
          case ReadAccess(a, tid, evalPath)         =>
            s"${a.sinkAccess}"
          case WriteAccess(a, tid, value, evalPath) =>
            s"${a.sinkAccess}"
        }
      }

      def mover(acc: Access) = {
        specMover(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get)
      }

      def preds(acc: Access) = {
        specPath(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get).map(x => "\"" + x + "\"").mkString(",")
      }

      val trace = error.sinkError.asInstanceOf[ValidityError].check match {
        case "Right-Mover Check" =>
          s"""
             |     {
             |      "line": "t:",
             |      "stmt": "${accessToString(x)}",
             |      "mover":"${mover(x)}",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}._pre.png")}",
             |      "justification" :
             |         {
             |            "preds": [ ${preds(x)} ],
             |            "access": "${simpleToString(x)}"
             |         }
             |     },
             |    {
             |      "line": "u:",
             |      "stmt": "${accessToString(y)}",
             |      "mover":"${mover(y)}",
             |      "color": "danger",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}._post.png")}",
             |      "justification" :
             |        {
             |          "preds": [ ${preds(y)} ],
             |          "access": "${simpleToString(y)}"
             |        }
             |    }
           """.stripMargin
        case "Left-Mover Check"  =>
          s"""
             |    {
             |      "line": "u:",
             |      "stmt": "${accessToString(y)}",
             |      "mover":"${mover(y)}",
             |      "color": "danger",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}._post.png")}",
             |      "justification" :
             |        {
             |          "preds": [ ${preds(y)} ],
             |          "access": "${simpleToString(y)}"
             |        }
             |    },
             |    {
             |      "line": "t:",
             |      "stmt": "${accessToString(x)}",
             |      "mover":"${mover(x)}",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}._pre.png")}",
             |      "justification" :
             |         {
             |            "preds": [ ${preds(x)} ],
             |            "access": "${simpleToString(x)}"
             |         }
             |     }
           """.stripMargin
        case _                   => ""
      }

      s"""{
         |  "line" : ${error.sinkError.pos.line},
         |  "column" : ${error.sinkError.pos.column},
         |  "message" : "${errorMessage(error)}",
         |  "trace": [
         |    {
         |      "text": "The following two steps by Threads <code>t</code> and <code>u</code> can be reordered in a trace, but that changes program behavior."
         |    },
         |    ${trace} ]
         |}""".stripMargin

    }

    private def printYieldingError(context: SinkErrorInContext) = {
      val error = context.sinkError.asInstanceOf[YieldingError]
      error match {
        case YieldingReflexivityError(node, message, access)  => {
          s"""{
             |  "line" : ${error.pos.line},
             |  "column" : ${error.pos.column},
             |  "message" : "Yielding Error",
             |  "trace": [
             |    {
             |      "text": "<code>yields_as</code> clause is not Reflexive.  It does not permit <code>${access}</code> to remain unchanged at a <code>yield</code>."
             |    },
             |    {
             |      "line": "",
             |      "stmt": "yield;",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._yield.png")}"
             |    }
             |  ]
             |}""".stripMargin
        }
        case YieldingValidityError(node, message, access)     => {
          s"""{
             |  "line" : ${error.pos.line},
             |  "column" : ${error.pos.column},
             |  "message" : "Yielding Error",
             |  "trace": [
             |    {
             |      "text": "<code>yields_as</code> clause is not Valid.  It does not permit Thread <code>u</code> to update <code>${access}</code> to <code>newValue</code> at a <code>yield</code>."
             |    },
             |    {
             |      "line": "",
             |      "stmt": "yield;",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._yield.png")}"
             |    }
             |  ]
             |}""".stripMargin
        }
        case YieldingTransitivityError(node, message, access) => {
          s"""{
             |  "line" : ${error.pos.line},
             |  "column" : ${error.pos.column},
             |  "message" : "Yielding Error",
             |  "trace": [
             |    {
             |      "text": "<code>yields_as</code> clause is not Transitive.  Thread <code>tid</code> can observe <code>${access}</code> changing to <code>newValue</code> after a <code>yield</code> but not during."
             |    },
             |    {
             |      "line": "tid:",
             |      "stmt": "yield;",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._pre.png")}"
             |    },
             |    {
             |      "line": "?:",
             |      "stmt": "${access} = newValue;",
             |      "color": "",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._post.png")}"
             |    }
             |  ]
             |}""".stripMargin
        }
        case YieldingABAError(node, message, access) => {
          s"""{
             |  "line" : ${error.pos.line},
             |  "column" : ${error.pos.column},
             |  "message" : "Yielding Error",
             |  "trace": [
             |    {
             |      "text": "Field is not <code>noABA</code>.  The <code>yields_as</code> clause enables it to change from <code>A</code> to <code>B</code> to <code>A</code>."
             |    },
             |    {
             |      "line": "tid:",
             |      "stmt": "assume ${access} == A;",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._pre.png")}"
             |    },
             |    {
             |      "line": "?:",
             |      "stmt": "${access} = B;",
             |      "color": "success",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._pre.png")}"
             |    },
             |    {
             |      "line": "?:",
             |      "stmt": "${access} = A;",
             |      "color": "",
             |      "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${error.id}._post.png")}"
             |    }
             |  ]
             |}""".stripMargin
        }

      }
    }


    private def printStabilityError(error: SinkErrorInContext): String = {
      val id = error.sinkError.id


      val e = error.sinkError.asInstanceOf[StabilityError];

      if (error.ctxt.model == None) {
        return ""
      }
      val model = error.ctxt.model.get


      def heapToString(h : UpdatedHeap) = {
        s"${h.name} == ${h.base}${h.writes.map(w => s"[${accessToString(w)}]").mkString("")}"
      }


      def eval(acc: Access, model: SinkModel) = {
        PrettyPrint.pp(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get)
      }

      def path(acc: Access, ctxt: SinkErrorContext): Int = {
        ctxt.model.get.localInt(s"${acc.evalPrefix}_Path@0").get
      }


      def accessToString(acc: Access): String = {
        acc match {
          case ReadAccess(a, tid, evalPath)         =>
            f"""_ := ${a.sinkAccess};"""
          case WriteAccess(a, tid, value, evalPath) =>
            f"""${a.sinkAccess} := ${model.local(value).getOrElse("_")};"""
        }
      }


      def simpleToString(acc: Access): String = {
        acc match {
          case ReadAccess(a, tid, evalPath)         =>
            s"${a.sinkAccess}"
          case WriteAccess(a, tid, value, evalPath) =>
            s"${a.sinkAccess}"
        }
      }

      def mover(acc: Access) = {
        specMover(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get)
      }

      def preds(acc: Access) = {
        specPath(acc.spec, model.localInt(s"${acc.evalPrefix}_Path@0").get).map(x => "\"" + x + "\"").mkString(",")
      }


      def evalTerm(x : StabilityTerm, color : String) : String = {
        x match {
          case StabilityAccess(a)   => {
            button(mover(a), color)
          }
          case StabilityConstant(a) => {
            button(a, color)
          }
        }
      }

      def evalConstraint(x : StabilityConstraint, color: String) : String = {
        x match {
          case StabilityNotAlias(lhs, rhs) => {
            s"where ${lhs} != ${rhs}"
          }
          case StabilityLEQ(lhs, rhs)      => {
            s"where ${evalTerm(lhs, color)} = ${evalTerm(rhs, "info")}"
          }
          case StabilityNotLEQ(lhs, rhs)   => {
            s"where ${evalTerm(lhs, color)} > ${evalTerm(rhs,"info")}"
          }
          case StabilityIn(lhs, members)   => {
            s"where ${evalTerm(lhs, color)} &#8712; { ${members.map(evalTerm(_,"info")).mkString(", ")} }"
          }
          case StabilityNone()             => {
            ""
          }
        }
      }
      //

      def findHeapUpdate(heap: String) = {
        if (heap == "_pre") {
          None
        } else {
          val x = e.heaps.find(_.name == heap)
          assert (x != None);
          x
        }
      }

      def traceStep(item : StabilitySeqItem) = {
        val StabilitySeqItem(x, heap, constraint) = item
        val color = if (x.tid == "t") { "success" } else { "danger" }

        val s = findHeapUpdate(heap) match {
          case Some(update) => {
            def writeToEntryHeap(u: WriteAccess, h : String) = {
              s"""
                {
                  "line": "",
                  "stmt": "${accessToString(u)}",
                  "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}.${h}.png")}",
                  "color": "light"
                }"""
            }
            def writeToEntry(u: WriteAccess) = {
              s"""
                {
                  "line": "",
                  "stmt": "${accessToString(u)}",
                  "color": "light"
                }"""
            }
            assert (update.base == "_pre");
            (writeToEntryHeap(update.writes.head, "_pre")::
             update.writes.tail.map(u => writeToEntry(u))).mkString("", ",", ",")
          }
          case None        => ""
        }
        s +
          s"""
        {
          "line": "${x.tid}:",
          "stmt": "${accessToString(x)}   ${evalConstraint(constraint, color)}",
          "mover":"${mover(x)}",
          "color": "${color}",
          "heap": "${encodePNG(s"${acme.util.Util.outputPathOption.get}/${id}.${heap}.png")}",
          "justification" :
            {
              "preds": [ ${preds(x)} ],
              "access": "${simpleToString(x)}"
            }
        }"""
      }


      val trace =
        List(
        """{ "text": "The following steps may occur:" }""",
        {for (s <- e.seq1) yield {
          traceStep(s)
        }
        }.mkString(""", { "text": "and" },"""),
        """{ "text": " " } """,
        """{ "text": "But, the following does not hold: " } """,
        {
          for (s <- e.seq2) yield {
            traceStep(s)
          }
        }.mkString(""", { "text": "and" }, """)
    )


      s"""{
         |  "line" : ${error.sinkError.pos.line},
         |  "column" : ${error.sinkError.pos.column},
         |  "message" : "${errorMessage(error)}",
         |  "trace": [ ${trace.mkString(",")} ]
         |}""".stripMargin

    }







    /////

    private def button(x : String, color : String = "success")  : String = {
      s"""<button type=\\\"button\\\" class=\\\"btn btn-${color} btn-mover rounded-circle\\\">${x}</button>"""
    }

    private def button(x : Mover, color: String):String = {
      button(pp(x), color)
    }


    def errorMessage(x: SinkErrorInContext): String = {
      (x.sinkError match {
        case x: ReductionError => "Reduction Error"
        case x: ValidityError  => s"Validity Error" // "${x.check}"
        case x: AssertError    => s"Assertion Error" // "${x.check}"
        case x: InvariantError => s"Invariant Error"
        case x: YieldingError  => "YieldsAs Error"
        case x: LoopTerminationError => "Loop Termination Error"
        case x: MethodSpecError => "Method Specification Error"
        case x: LoopPhaseError     => "Loop Reduction Error"
        case x: RequiresError => "Method Specification Error"
        case _                 => x.sinkError.message
      }).replace("\\", "\\\\")
    }
    private def printErrors(errors: List[SinkErrorInContext]) = {
      output.println(""""Errors" : [""")
      for (error <- errors) {
        error.genDots("png", "png", 5)
      }
      output.println(errors.map(error => error.sinkError match {
          case x:ValidityError => printValdityError(error)
          case x:YieldingError => printYieldingError(error)
          case x:ReductionError => printTraceError(error, "Steps do not match pattern " +
          s"<b>${button("R")}* ${button("N")}? ${button("L")}*</b>.")
          case x:StabilityError => printStabilityError(error)
          case x:InvariantError => printTraceError(error, s"Invariant from line ${x.e.pos.line} may not hold.")
          case x:AssertError => printTraceError(error, "Assertion may fail.")
          case x:LoopTerminationError => printTraceError(error, x.message)
          case x:MethodSpecError => printTraceError(error, x.message)
          case x:LoopPhaseError => printTraceError(error, x.message)
          case x:RequiresError => printTraceError(error, x.message)
          case _ => printTraceError(error)
        }).mkString(",\n"))

      output.println("],") // ${x.sinkError.id}
    }

    def start(file: File) = {
    }

    def summarize(file: File, errors: Option[List[SinkErrorInContext]], verifyTime: Long) = {
      errors match {
        case Some(errors) => {
          val timeInSeconds = verifyTime / 1000000000.0
          val timeString = f"${timeInSeconds}%2.2f seconds"
          val filtered = filter(errors)
          if (filtered.size == 0) {
            output.println(
              s"""
                | "Status" : "Verified!",
                | "Time" : "${timeString}",
              """.stripMargin)
          } else {
            output.println(
            s"""
               | "Status" : "${filtered.size} Errors",
               | "Time" : "${timeString}",
              """.stripMargin)
          }
          printErrors(filtered)
        }
        case None         => {
          output.println(
            s"""
               | "Status" : "???",
               | "Time" : "0 seconds",
              """.stripMargin)
        }
      }
    }

    def filter(list : List[SinkErrorInContext]) = {
      val sinkErrors = list.map(_.sinkError)
      def keep(x : SinkError) = {
        val sameNodeErrors = sinkErrors.filter(_.node eq x.node)
        x match {
          case x: YieldingError  =>
            !sameNodeErrors.exists(y => y.isInstanceOf[ValidityError]) &&
              !sameNodeErrors.exists(y => y.isInstanceOf[StabilityError])
          case x: ValidityError  =>
            sameNodeErrors.take(2).contains(x)
          case x: StabilityError =>
            !sameNodeErrors.exists(y => y.isInstanceOf[ValidityError])
          case _                 => true
        }
      }
      list.filter(x => keep(x.sinkError))
    }

    def errorDetails(file: File, errors: Option[List[SinkErrorInContext]]) = {
    }

    override def internalError(e: Throwable): Unit = {
      throw e;
    }
  }

  object AnchorServer {
    def main(args: Array[String]): Unit = {
      val (config, files) = AnchorCommandLine(args)
      if (files.size == 0) {
        acme.util.Util.error("No source files provided.");
        AnchorCommandLine.usage();
        System.exit(0);
      } else {
        val bytes = new ByteArrayOutputStream()
        val out = new PrintWriter(bytes)
        try {
          out.println("{ ")
          val ok = new Anchor(config).process(new ServerReporter(out), files) == 0
          out.println(""""Dummy" : 3 """)
          out.println("} ")
          out.close()
          System.out.println(bytes.toString())
        } catch {
          case e: Throwable =>
            System.out.println(      s""" {
                                 | "Status" : "Ooops!  Internal Anchor Error...",
                                 | "Errors" : [
                                 | {
                                 |  "line" : 1,
                                 |  "column" : 1,
                                 |  "message" : "Please report this problem so we can improve our verifier. Thanks!"
                                 | }]
                                 | }
                                 |""".stripMargin )
        }
        System.exit(0);
      }
    }
  }
