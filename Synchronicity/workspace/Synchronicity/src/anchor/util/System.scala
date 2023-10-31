package anchor.util
import acme.util.Util._

import scala.sys.process._
import acme.util._
import java.io._

import scala.language.postfixOps

object System {

  def runSubProcess(cmds: String*): Unit = {
    for (cmd <- cmds) {
      cmd ! ProcessLogger(line => log(line),
                          line => log(line))

    }
  }

}

object Dot {
  def gen(namePrefix: String, dot: String, suffix : String = "pdf", outputFormat : String = "pdf"): String = {
    val file = new File(Util.makeLogFileName(namePrefix + ".dot"))
    val pw = new PrintWriter(file)
    pw.write(dot)
    pw.close()
    val outputFile = Util.makeLogFileName(s"${namePrefix}.${suffix}")
    assert ((file #> s"dot -T${outputFormat}" #>> new File(outputFile) !) == 0)
    outputFile
  }
}