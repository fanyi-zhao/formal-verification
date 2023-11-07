// Boogie program verifier version 3.0.5.0, Copyright (c) 2003-2014, Microsoft.
// Command Line Options: -trace -lib:base -lib:node -civlDesugaredFile:desugared.out.bpl treiber-stack-linked-list.bpl

type Heap = PolymorphicMapType_5887;

var heap: PolymorphicMapType_5887;

var head: Ref_5911;

const Identity: [int]int;

function {:inline} AtLeast(x: int) : [int]bool
{
  MapLe_1169(MapConst_1186_1169(x), Identity)
}

function {:inline} Range(from: int, n: int) : [int]bool
{
  MapDiff_1189(AtLeast(from), AtLeast(from + n))
}

type {:builtin "Seq"} Seq _;

datatype Node_31 {
  Node_31(next: Ref_5911, val: int)
}

type Ref_5911;

datatype Option_5934 {
  None_5934(),
  Some_5934(t: Node_31)
}

datatype Lval_6847 {
  Lval_6847(val: Ref_5911)
}

procedure Ref_Alloc_6871() returns (k: Lval_6847);



function {:builtin "MapConst"} MapConst_1186_1169(int) : [int]int;

function {:builtin "MapLe"} MapLe_1169([int]int, [int]int) : [int]bool;

function {:inline} MapDiff_1189(a: [int]bool, b: [int]bool) : [int]bool
{
  MapAnd_1189(a, MapNot_1189(b))
}

function {:builtin "MapNot"} MapNot_1189([int]bool) : [int]bool;

function {:builtin "MapAnd"} MapAnd_1189([int]bool, [int]bool) : [int]bool;

datatype Vec_1186 {
  Vec_1186(contents: [int]int, len: int)
}

function Default_1186() : int;

function {:builtin "MapIte"} MapIte_1210_1186([int]bool, [int]int, [int]int) : [int]int;

function Between_31(f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911) : bool;

function Avoiding_31(f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911) : bool;

axiom (forall x: int :: Identity[x] == x);

axiom (forall x: Vec_1186 :: 
  { x->len } { x->contents } 
  MapIte_1210_1186(Range(0, x->len), MapConst_1186_1169(Default_1186()), x->contents)
     == MapConst_1186_1169(Default_1186()));

axiom (forall x: Vec_1186 :: { x->len } x->len >= 0);

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911 :: Between_31(f, x, x, x));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911, w: Ref_5911 :: 
  { Between_31(f, y, z, w), f[x] } 
  Between_31(f, x, f[x]->next, f[x]->next));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911 :: 
  { f[x], Between_31(f, x, y, y) } 
  Between_31(f, x, y, y) ==> x == y || Between_31(f, x, f[x]->next, y));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911 :: 
  { f[x], Between_31(f, x, y, y) } 
  f[x]->next == x && Between_31(f, x, y, y) ==> x == y);

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911 :: 
  { Between_31(f, x, y, x) } 
  Between_31(f, x, y, x) ==> x == y);

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911 :: 
  { Between_31(f, x, y, y), Between_31(f, x, z, z) } 
  Between_31(f, x, y, y) && Between_31(f, x, z, z)
     ==> Between_31(f, x, y, z) || Between_31(f, x, z, y));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911 :: 
  { Between_31(f, x, y, z) } 
  Between_31(f, x, y, z) ==> Between_31(f, x, y, y) && Between_31(f, y, z, z));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911 :: 
  { Between_31(f, x, y, y), Between_31(f, y, z, z) } 
  Between_31(f, x, y, y) && Between_31(f, y, z, z) ==> Between_31(f, x, z, z));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911, w: Ref_5911 :: 
  { Between_31(f, x, y, z), Between_31(f, y, w, z) } 
  Between_31(f, x, y, z) && Between_31(f, y, w, z)
     ==> Between_31(f, x, y, w) && Between_31(f, x, w, z));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911, w: Ref_5911 :: 
  { Between_31(f, x, y, z), Between_31(f, x, w, y) } 
  Between_31(f, x, y, z) && Between_31(f, x, w, y)
     ==> Between_31(f, x, w, z) && Between_31(f, w, y, z));

axiom (forall f: [Ref_5911]Node_31, u: Ref_5911, x: Ref_5911 :: 
  { Between_31(f, u, x, x) } 
  Between_31(f, u, x, x) ==> Between_31(f, u, u, x));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911 :: 
  { Avoiding_31(f, x, y, z) } 
  Avoiding_31(f, x, y, z)
     <==> Between_31(f, x, y, z) || (Between_31(f, x, y, y) && !Between_31(f, x, z, z)));

axiom (forall f: [Ref_5911]Node_31, x: Ref_5911, y: Ref_5911, z: Ref_5911 :: 
  { Between_31(f, x, y, z) } 
  Between_31(f, x, y, z) <==> Avoiding_31(f, x, y, z) && Avoiding_31(f, x, z, z));

axiom (forall f: [Ref_5911]Node_31, 
    u: Ref_5911, 
    v: Ref_5911, 
    x: Ref_5911, 
    p: Ref_5911, 
    q: Node_31 :: 
  { Avoiding_31(f[p := q], u, v, x) } 
  Avoiding_31(f[p := q], u, v, x)
     <==> (Avoiding_31(f, u, v, p) && Avoiding_31(f, u, v, x))
       || (
        Avoiding_31(f, u, p, x)
         && p != x
         && Avoiding_31(f, q->next, v, p)
         && Avoiding_31(f, q->next, v, x)));

datatype PolymorphicMapType_5887 {
  PolymorphicMapType_5887(PolymorphicMapType_5887_38: [Ref_5911]Option_5934)
}

function {:inline} Lval_Collector_6847(l: Lval_6847) : [Ref_5911]bool
{
  MapConst_5_6847(false)[l->val := true]
}

function {:builtin "MapConst"} MapConst_5_6847(bool) : [Ref_5911]bool;

function {:builtin "MapConst"} MapConst_3_6847(int) : [Ref_5911]int;

function {:builtin "MapOr"} MapOr_6847([Ref_5911]bool, [Ref_5911]bool) : [Ref_5911]bool;

function {:builtin "MapImp"} MapImp_6847([Ref_5911]bool, [Ref_5911]bool) : [Ref_5911]bool;

function {:builtin "MapEq"} MapEq_6847_3([Ref_5911]int, [Ref_5911]int) : [Ref_5911]bool;

function {:builtin "MapAdd"} MapAdd_6847([Ref_5911]int, [Ref_5911]int) : [Ref_5911]int;

function {:builtin "MapIte"} MapIte_6847_3([Ref_5911]bool, [Ref_5911]int, [Ref_5911]int) : [Ref_5911]int;

function {:builtin "MapLe"} MapLe_6847([Ref_5911]int, [Ref_5911]int) : [Ref_5911]bool;

datatype Lheap_6871 {
  Lheap_6871(dom: [Ref_5911]bool, val: [Ref_5911]Node_31)
}

datatype Lset_6871 {
  Lset_6871(dom: [Node_31]bool)
}

datatype Lval_6871 {
  Lval_6871(val: Node_31)
}

function Nil_6871() : Ref_5911;

function Trigger_SpecSetRefVal__heap(_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecGetRefVal__heap(_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecCAS_Head_eq(eq: bool) : bool;

function Trigger_SpecCAS_Head_headNode(headNode: Node_31) : bool;

function Trigger_SpecCAS_Head_inline$SpecGetRefVal$0$_heap(inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecCAS_Head_inline$SpecGetRefVal$0$ref(inline$SpecGetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecCAS_Head_inline$SpecGetRefVal$0$x(inline$SpecGetRefVal$0$x: Node_31) : bool;

function Trigger_SpecCAS_Head_inline$SpecGetRefVal$0$heap(inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecCAS_Head_inline$SpecNodeEq$0$n1(inline$SpecNodeEq$0$n1: Node_31) : bool;

function Trigger_SpecCAS_Head_inline$SpecNodeEq$0$n2(inline$SpecNodeEq$0$n2: Node_31) : bool;

function Trigger_SpecCAS_Head_inline$SpecNodeEq$0$eq(inline$SpecNodeEq$0$eq: bool) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5934) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5934) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_oldHead(oldHead: Node_31) : bool;

function Trigger_SpecPop_newHead(newHead: Node_31) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$0$_heap(inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$0$ref(inline$SpecGetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$0$x(inline$SpecGetRefVal$0$x: Node_31) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$0$heap(inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$1$_heap(inline$SpecGetRefVal$1$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$1$ref(inline$SpecGetRefVal$1$ref: Ref_5911) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$1$x(inline$SpecGetRefVal$1$x: Node_31) : bool;

function Trigger_SpecPop_inline$SpecGetRefVal$1$heap(inline$SpecGetRefVal$1$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPop_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecPop_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5934) : bool;

function Trigger_SpecPop_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_newHeadRef(newHeadRef: Lval_6847) : bool;

function Trigger_SpecPush_newHead(newHead: Node_31) : bool;

function Trigger_SpecPush_inline$SpecAllocNodeRef$0$k(inline$SpecAllocNodeRef$0$k: Lval_6847) : bool;

function Trigger_SpecPush_inline$SpecAllocNodeRef$0$heap(inline$SpecAllocNodeRef$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5934) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$_heap(inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$ref(inline$SpecGetRefVal$0$ref: Ref_5911) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$x(inline$SpecGetRefVal$0$x: Node_31) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$heap(inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$_heap(inline$SpecSetRefVal$1$_heap: PolymorphicMapType_5887) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$ref(inline$SpecSetRefVal$1$ref: Ref_5911) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$x(inline$SpecSetRefVal$1$x: Option_5934) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$heap(inline$SpecSetRefVal$1$heap: PolymorphicMapType_5887) : bool;

implementation SpecSetRefVal(ref: Ref_5911, x: Option_5934)
{
  var _heap: PolymorphicMapType_5887;

  /*** structured program:
    _heap := old(heap);
    _heap->PolymorphicMapType_5887_38[ref] := x;
  **** end structured program */

  anon0:
    _heap := old(heap);
    _heap->PolymorphicMapType_5887_38[ref] := x;
    return;
}



procedure {:inline 1} SpecSetRefVal(ref: Ref_5911, x: Option_5934);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecSetRefVal(ref: Ref_5911, x: Option_5934) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    Civl_heap == Civl_old_heap)
}

implementation SpecGetRefVal(ref: Ref_5911) returns (x: Node_31)
{
  var _heap: PolymorphicMapType_5887;

  /*** structured program:
    _heap := old(heap);
    x := _heap->PolymorphicMapType_5887_38[ref]->t;
  **** end structured program */

  anon0:
    _heap := old(heap);
    x := _heap->PolymorphicMapType_5887_38[ref]->t;
    return;
}



procedure {:inline 1} SpecGetRefVal(ref: Ref_5911) returns (x: Node_31);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecGetRefVal(ref: Ref_5911, x: Node_31) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    x == Civl_heap->PolymorphicMapType_5887_38[ref]->t && Civl_heap == Civl_old_heap)
}

implementation SpecNodeEq(n1: Node_31, n2: Node_31) returns (eq: bool)
{
  /*** structured program:
    eq := n1 == n2;
  **** end structured program */

  anon0:
    eq := n1 == n2;
    return;
}



procedure {:inline 1} SpecNodeEq(n1: Node_31, n2: Node_31) returns (eq: bool);



function {:inline} Civl_InputOutputRelation_SpecNodeEq(n1: Node_31, n2: Node_31, eq: bool) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    eq <==> n1 == n2)
}

implementation SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool)
{
  var eq: bool;
  var headNode: Node_31;
  var inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$0$ref: Ref_5911;
  var inline$SpecGetRefVal$0$x: Node_31;
  var inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887;
  var inline$SpecNodeEq$0$n1: Node_31;
  var inline$SpecNodeEq$0$n2: Node_31;
  var inline$SpecNodeEq$0$eq: bool;
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$ref: Ref_5911;
  var inline$SpecSetRefVal$0$x: Option_5934;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887;

  /*** structured program:
    call headNode := SpecGetRefVal(head);
    call eq := SpecNodeEq(headNode, expectedNode);
    if (eq)
    {
        call SpecSetRefVal(head, Some_5934(desiredNode));
        success := true;
    }
    else
    {
        success := false;
    }
  **** end structured program */

  anon0:
    goto inline$SpecGetRefVal$0$Entry;

  inline$SpecGetRefVal$0$Entry:
    inline$SpecGetRefVal$0$ref := head;
    havoc inline$SpecGetRefVal$0$_heap, inline$SpecGetRefVal$0$x;
    inline$SpecGetRefVal$0$heap := heap;
    goto inline$SpecGetRefVal$0$anon0;

  inline$SpecGetRefVal$0$anon0:
    inline$SpecGetRefVal$0$_heap := inline$SpecGetRefVal$0$heap;
    inline$SpecGetRefVal$0$x := inline$SpecGetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecGetRefVal$0$ref]->t;
    goto inline$SpecGetRefVal$0$Return;

  inline$SpecGetRefVal$0$Return:
    headNode := inline$SpecGetRefVal$0$x;
    goto anon0$1;

  anon0$1:
    goto inline$SpecNodeEq$0$Entry;

  inline$SpecNodeEq$0$Entry:
    inline$SpecNodeEq$0$n1 := headNode;
    inline$SpecNodeEq$0$n2 := expectedNode;
    havoc inline$SpecNodeEq$0$eq;
    goto inline$SpecNodeEq$0$anon0;

  inline$SpecNodeEq$0$anon0:
    inline$SpecNodeEq$0$eq := inline$SpecNodeEq$0$n1 == inline$SpecNodeEq$0$n2;
    goto inline$SpecNodeEq$0$Return;

  inline$SpecNodeEq$0$Return:
    eq := inline$SpecNodeEq$0$eq;
    goto anon0$2;

  anon0$2:
    goto anon3_Then, anon3_Else;

  anon3_Else:
    assume {:partition} !eq;
    success := false;
    return;

  anon3_Then:
    assume {:partition} eq;
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := head;
    inline$SpecSetRefVal$0$x := Some_5934(desiredNode);
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto anon3_Then$1;

  anon3_Then$1:
    success := true;
    return;
}



procedure {:inline 1} SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31, success: bool) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    (
        Civl_heap->PolymorphicMapType_5887_38[Civl_head]->t == expectedNode
         && (success <==> true)
         && Civl_heap == Civl_old_heap)
       || (
        !(Civl_heap->PolymorphicMapType_5887_38[Civl_head]->t == expectedNode)
         && (success <==> false)
         && Civl_heap == Civl_old_heap))
}

implementation SpecAllocNodeRef() returns (k: Lval_6847)
{
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$ref: Ref_5911;
  var inline$SpecSetRefVal$0$x: Option_5934;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887;

  /*** structured program:
    call k := Ref_Alloc_6871();
    call SpecSetRefVal(k->val, None_5934());
  **** end structured program */

  anon0:
    havoc k;
    assume k->val != Nil_6871();
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := k->val;
    inline$SpecSetRefVal$0$x := None_5934();
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto anon0$1;

  anon0$1:
    return;
}



procedure {:inline 1} SpecAllocNodeRef() returns (k: Lval_6847);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecAllocNodeRef(k: Lval_6847) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    k->val != Nil_6871() && Civl_heap == Civl_old_heap)
}

implementation SpecPop() returns (item: int)
{
  var oldHead: Node_31;
  var newHead: Node_31;
  var inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$0$ref: Ref_5911;
  var inline$SpecGetRefVal$0$x: Node_31;
  var inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$1$_heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$1$ref: Ref_5911;
  var inline$SpecGetRefVal$1$x: Node_31;
  var inline$SpecGetRefVal$1$heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$ref: Ref_5911;
  var inline$SpecSetRefVal$0$x: Option_5934;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887;

  /*** structured program:
    call oldHead := SpecGetRefVal(head);
    call newHead := SpecGetRefVal(oldHead->next);
    call SpecSetRefVal(head, Some_5934(newHead));
    item := oldHead->val;
  **** end structured program */

  anon0:
    goto inline$SpecGetRefVal$0$Entry;

  inline$SpecGetRefVal$0$Entry:
    inline$SpecGetRefVal$0$ref := head;
    havoc inline$SpecGetRefVal$0$_heap, inline$SpecGetRefVal$0$x;
    inline$SpecGetRefVal$0$heap := heap;
    goto inline$SpecGetRefVal$0$anon0;

  inline$SpecGetRefVal$0$anon0:
    inline$SpecGetRefVal$0$_heap := inline$SpecGetRefVal$0$heap;
    inline$SpecGetRefVal$0$x := inline$SpecGetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecGetRefVal$0$ref]->t;
    goto inline$SpecGetRefVal$0$Return;

  inline$SpecGetRefVal$0$Return:
    oldHead := inline$SpecGetRefVal$0$x;
    goto anon0$1;

  anon0$1:
    goto inline$SpecGetRefVal$1$Entry;

  inline$SpecGetRefVal$1$Entry:
    inline$SpecGetRefVal$1$ref := oldHead->next;
    havoc inline$SpecGetRefVal$1$_heap, inline$SpecGetRefVal$1$x;
    inline$SpecGetRefVal$1$heap := heap;
    goto inline$SpecGetRefVal$1$anon0;

  inline$SpecGetRefVal$1$anon0:
    inline$SpecGetRefVal$1$_heap := inline$SpecGetRefVal$1$heap;
    inline$SpecGetRefVal$1$x := inline$SpecGetRefVal$1$_heap->PolymorphicMapType_5887_38[inline$SpecGetRefVal$1$ref]->t;
    goto inline$SpecGetRefVal$1$Return;

  inline$SpecGetRefVal$1$Return:
    newHead := inline$SpecGetRefVal$1$x;
    goto anon0$2;

  anon0$2:
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := head;
    inline$SpecSetRefVal$0$x := Some_5934(newHead);
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto anon0$3;

  anon0$3:
    item := oldHead->val;
    return;
}



procedure {:inline 1} SpecPop() returns (item: int);
  modifies heap, head;



function {:inline} Civl_InputOutputRelation_SpecPop(item: int) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    item == Civl_heap->PolymorphicMapType_5887_38[Civl_head]->t->val
       && Civl_heap == Civl_old_heap
       && Civl_head == Civl_old_head)
}

implementation SpecPush(item: int)
{
  var newHeadRef: Lval_6847;
  var newHead: Node_31;
  var inline$SpecAllocNodeRef$0$k: Lval_6847;
  var inline$SpecAllocNodeRef$0$heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$0$ref: Ref_5911;
  var inline$SpecSetRefVal$0$x: Option_5934;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5887;
  var inline$SpecGetRefVal$0$ref: Ref_5911;
  var inline$SpecGetRefVal$0$x: Node_31;
  var inline$SpecGetRefVal$0$heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$1$_heap: PolymorphicMapType_5887;
  var inline$SpecSetRefVal$1$ref: Ref_5911;
  var inline$SpecSetRefVal$1$x: Option_5934;
  var inline$SpecSetRefVal$1$heap: PolymorphicMapType_5887;

  /*** structured program:
    call newHeadRef := SpecAllocNodeRef();
    call newHead := SpecGetRefVal(newHeadRef->val);
    newHead->next := head;
    newHead->val := item;
    call SpecSetRefVal(head, Some_5934(newHead));
  **** end structured program */

  anon0:
    goto inline$SpecAllocNodeRef$0$Entry;

  inline$SpecAllocNodeRef$0$Entry:
    havoc inline$SpecAllocNodeRef$0$k;
    inline$SpecAllocNodeRef$0$heap := heap;
    goto inline$SpecAllocNodeRef$0$anon0;

  inline$SpecAllocNodeRef$0$anon0:
    havoc inline$SpecAllocNodeRef$0$k;
    assume Trigger_SpecPush_inline$SpecAllocNodeRef$0$k(inline$SpecAllocNodeRef$0$k);
    assume inline$SpecAllocNodeRef$0$k->val != Nil_6871();
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := inline$SpecAllocNodeRef$0$k->val;
    inline$SpecSetRefVal$0$x := None_5934();
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto inline$SpecAllocNodeRef$0$anon0$1;

  inline$SpecAllocNodeRef$0$anon0$1:
    goto inline$SpecAllocNodeRef$0$Return;

  inline$SpecAllocNodeRef$0$Return:
    newHeadRef := inline$SpecAllocNodeRef$0$k;
    goto anon0$1;

  anon0$1:
    goto inline$SpecGetRefVal$0$Entry;

  inline$SpecGetRefVal$0$Entry:
    inline$SpecGetRefVal$0$ref := newHeadRef->val;
    havoc inline$SpecGetRefVal$0$_heap, inline$SpecGetRefVal$0$x;
    inline$SpecGetRefVal$0$heap := heap;
    goto inline$SpecGetRefVal$0$anon0;

  inline$SpecGetRefVal$0$anon0:
    inline$SpecGetRefVal$0$_heap := inline$SpecGetRefVal$0$heap;
    inline$SpecGetRefVal$0$x := inline$SpecGetRefVal$0$_heap->PolymorphicMapType_5887_38[inline$SpecGetRefVal$0$ref]->t;
    goto inline$SpecGetRefVal$0$Return;

  inline$SpecGetRefVal$0$Return:
    newHead := inline$SpecGetRefVal$0$x;
    goto anon0$2;

  anon0$2:
    newHead->next := head;
    newHead->val := item;
    goto inline$SpecSetRefVal$1$Entry;

  inline$SpecSetRefVal$1$Entry:
    inline$SpecSetRefVal$1$ref := head;
    inline$SpecSetRefVal$1$x := Some_5934(newHead);
    havoc inline$SpecSetRefVal$1$_heap;
    inline$SpecSetRefVal$1$heap := heap;
    goto inline$SpecSetRefVal$1$anon0;

  inline$SpecSetRefVal$1$anon0:
    inline$SpecSetRefVal$1$_heap := inline$SpecSetRefVal$1$heap;
    inline$SpecSetRefVal$1$_heap->PolymorphicMapType_5887_38[inline$SpecSetRefVal$1$ref] := inline$SpecSetRefVal$1$x;
    goto inline$SpecSetRefVal$1$Return;

  inline$SpecSetRefVal$1$Return:
    goto anon0$3;

  anon0$3:
    return;
}



procedure {:inline 1} SpecPush(item: int);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecPush(item: int) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911, 
      Civl_inline$SpecAllocNodeRef$0$k#2: Lval_6847 :: 
    Civl_inline$SpecAllocNodeRef$0$k#2->val != Nil_6871()
       && Civl_heap == Civl_old_heap)
}

implementation Civl_Skip()
{

  init:
    return;
}



procedure {:inline 1} Civl_Skip();



function {:inline} Civl_InputOutputRelation_Civl_Skip() : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5887, 
      Civl_old_head: Ref_5911, 
      Civl_heap: PolymorphicMapType_5887, 
      Civl_head: Ref_5911 :: 
    true)
}

procedure Civl_SetRefVal_0(ref: Ref_5911, x: Option_5934);
  modifies heap, head;



procedure Civl_GetRefVal_0(ref: Ref_5911) returns (x: Node_31);
  modifies heap, head;



procedure Civl_NodeEq_0(n1: Node_31, n2: Node_31) returns (eq: bool);
  modifies heap, head;



procedure Civl_CAS_Head_0(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool);
  modifies heap, head;



procedure Civl_AllocNodeRef_0() returns (k: Lval_6847);
  modifies heap, head;



procedure Civl_Pop_0() returns (item: int);
  modifies heap, head;



procedure Civl_Push_0(item: int);
  modifies heap, head;



implementation Civl_NodeEq_0(n1: Node_31, n2: Node_31) returns (eq: bool)
{
  var Civl_global_old_heap: PolymorphicMapType_5887;
  var Civl_global_old_head: Ref_5911;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_old_eq: bool;
  var Civl_linear_Ref_5911_available: [Ref_5911]bool;

  /*** structured program:
    eq := n1->val == n2->val && n1->next == n2->next;
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_pc, Civl_ok, Civl_eval := false, false, false;
    Civl_old_eq := eq;
    assume true;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon0;

  anon0:
    eq := n1->val == n2->val && n1->next == n2->next;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5911_available, Civl_global_old_heap, Civl_global_old_head);
    assume false;
    return;

  Civl_RefinementChecker:
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc
       ==> heap == Civl_global_old_heap
         && head == Civl_global_old_head
         && (eq <==> Civl_old_eq);
    assume false;
    return;

  Civl_UnchangedChecker:
    assert heap == Civl_global_old_heap && head == Civl_global_old_head;
    assert Civl_pc ==> (eq <==> Civl_old_eq);
    assume false;
    return;

  Civl_ReturnChecker:
    Civl_eval := (eq <==> n1 == n2)
       && heap == Civl_global_old_heap
       && head == Civl_global_old_head;
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc
       ==> heap == Civl_global_old_heap
         && head == Civl_global_old_head
         && (eq <==> Civl_old_eq);
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || ((eq <==> Civl_old_eq) && Civl_ok);
    assert Civl_ok;
    assume false;
    return;

  Civl_UnifiedReturn:
    return;
}



implementation Civl_Pop_0() returns (item: int)
{
  var oldHead: Node_31;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5887;
  var Civl_global_old_head: Ref_5911;
  var Civl_linear_Ref_5911_available: [Ref_5911]bool;

  /*** structured program:
    while (true)
      invariant {:yields} true;
    {
        oldHead := old(heap->PolymorphicMapType_5887_38[head]->t);
        newHead := old(heap->PolymorphicMapType_5887_38[oldHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            item := oldHead->val;
            assert item == old(heap->PolymorphicMapType_5887_38[head]->t->val);
            assert newHead
               == old(heap->PolymorphicMapType_5887_38[heap->PolymorphicMapType_5887_38[head]->t->next]->t);
            break;
        }
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon0;

  anon0:
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHead := old(heap->PolymorphicMapType_5887_38[head]->t);
    newHead := old(heap->PolymorphicMapType_5887_38[oldHead->next]->t);
    goto anon3_LoopBody_0, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon3_LoopBody_0:
    call cas_success := Civl_ParallelCall_CAS_Head_0(oldHead, newHead);
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !cas_success;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon4_Then:
    assume {:partition} cas_success;
    item := oldHead->val;
    assert true;
    assert true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  anon3_LoopDone:
    assume {:partition} !true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5911_available, Civl_global_old_heap, Civl_global_old_head);
    assume false;
    return;

  Civl_RefinementChecker:
    assume false;
    return;

  Civl_UnchangedChecker:
    assume false;
    return;

  Civl_ReturnChecker:
    assume false;
    return;

  Civl_UnifiedReturn:
    return;
}



implementation Civl_Push_0(item: int)
{
  var oldHeadRef: Ref_5911;
  var oldHead: Node_31;
  var newHeadRef: Lval_6847;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5887;
  var Civl_global_old_head: Ref_5911;
  var Civl_linear_Ref_5911_available: [Ref_5911]bool;

  /*** structured program:
    call newHeadRef := AllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5887_38[newHeadRef->val]->t);
    newHead->val := item;
    while (true)
      invariant {:yields} true;
    {
        oldHeadRef := old(head);
        newHead->next := oldHeadRef;
        oldHead := old(heap->PolymorphicMapType_5887_38[newHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            assert newHead->next == old(head);
            break;
        }
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon0;

  anon0:
    goto anon0_0, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon0_0:
    call newHeadRef := Civl_ParallelCall_AllocNodeRef_0();
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapOr_6847(Lval_Collector_6847(newHeadRef), MapConst_5_6847(false));
    newHead := old(heap->PolymorphicMapType_5887_38[newHeadRef->val]->t);
    newHead->val := item;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapOr_6847(Lval_Collector_6847(newHeadRef), MapConst_5_6847(false));
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHeadRef := old(head);
    newHead->next := oldHeadRef;
    oldHead := old(heap->PolymorphicMapType_5887_38[newHead->next]->t);
    goto anon3_LoopBody_0, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon3_LoopBody_0:
    call cas_success := Civl_ParallelCall_CAS_Head_0(oldHead, newHead);
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapOr_6847(Lval_Collector_6847(newHeadRef), MapConst_5_6847(false));
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !cas_success;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon4_Then:
    assume {:partition} cas_success;
    assert true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  anon3_LoopDone:
    assume {:partition} !true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5911_available, Civl_global_old_heap, Civl_global_old_head);
    assume false;
    return;

  Civl_RefinementChecker:
    assume false;
    return;

  Civl_UnchangedChecker:
    assume false;
    return;

  Civl_ReturnChecker:
    assume false;
    return;

  Civl_UnifiedReturn:
    return;
}



procedure Civl_ParallelCall_CAS_Head_0(Civl_0_expectedNode: Node_31, Civl_0_desiredNode: Node_31)
   returns (Civl_0_success: bool);
  modifies heap, head;



procedure Civl_ParallelCall_AllocNodeRef_0() returns (Civl_0_k: Lval_6847);
  modifies heap, head;



procedure {:inline 1} Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5911_in: [Ref_5911]bool, 
    Civl_global_old_heap: PolymorphicMapType_5887, 
    Civl_global_old_head: Ref_5911);



implementation Civl_Wrapper_NoninterferenceChecker_0(Civl_Civl_linear_Ref_5911_in: [Ref_5911]bool, 
    Civl_Civl_global_old_heap: PolymorphicMapType_5887, 
    Civl_Civl_global_old_head: Ref_5911)
{

  enter:
    return;
}



procedure Civl_Pop_1() returns (item: int);
  modifies heap, head;



procedure Civl_Push_1(item: int);
  modifies heap, head;



implementation Civl_Pop_1() returns (item: int)
{
  var oldHead: Node_31;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5887;
  var Civl_global_old_head: Ref_5911;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_old_item: int;
  var Civl_linear_Ref_5911_available: [Ref_5911]bool;

  /*** structured program:
    while (true)
      invariant {:yields} true;
    {
        oldHead := old(heap->PolymorphicMapType_5887_38[head]->t);
        newHead := old(heap->PolymorphicMapType_5887_38[oldHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            item := oldHead->val;
            assert item == old(heap->PolymorphicMapType_5887_38[head]->t->val);
            assert newHead
               == old(heap->PolymorphicMapType_5887_38[heap->PolymorphicMapType_5887_38[head]->t->next]->t);
            break;
        }
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_pc, Civl_ok, Civl_eval := false, false, false;
    Civl_old_item := item;
    assume true;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon0;

  anon0:
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    assume Civl_pc || true;
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_item := item;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHead := old(heap->PolymorphicMapType_5887_38[head]->t);
    newHead := old(heap->PolymorphicMapType_5887_38[oldHead->next]->t);
    call cas_success := SpecCAS_Head(oldHead, newHead);
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !cas_success;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon4_Then:
    assume {:partition} cas_success;
    item := oldHead->val;
    assert item == old(heap->PolymorphicMapType_5887_38[head]->t->val);
    assert newHead
       == old(heap->PolymorphicMapType_5887_38[heap->PolymorphicMapType_5887_38[head]->t->next]->t);
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  anon3_LoopDone:
    assume {:partition} !true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_1(Civl_linear_Ref_5911_available, Civl_global_old_heap, Civl_global_old_head);
    assume false;
    return;

  Civl_RefinementChecker:
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc
       ==> heap == Civl_global_old_heap
         && head == Civl_global_old_head
         && item == Civl_old_item;
    assume false;
    return;

  Civl_UnchangedChecker:
    assert heap == Civl_global_old_heap && head == Civl_global_old_head;
    assert Civl_pc ==> item == Civl_old_item;
    assume false;
    return;

  Civl_ReturnChecker:
    Civl_eval := item == heap->PolymorphicMapType_5887_38[head]->t->val
       && heap == Civl_global_old_heap
       && head == Civl_global_old_head;
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc
       ==> heap == Civl_global_old_heap
         && head == Civl_global_old_head
         && item == Civl_old_item;
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || (item == Civl_old_item && Civl_ok);
    assert Civl_ok;
    assume false;
    return;

  Civl_UnifiedReturn:
    return;
}



implementation Civl_Push_1(item: int)
{
  var oldHeadRef: Ref_5911;
  var oldHead: Node_31;
  var newHeadRef: Lval_6847;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5887;
  var Civl_global_old_head: Ref_5911;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_linear_Ref_5911_available: [Ref_5911]bool;

  /*** structured program:
    call newHeadRef := AllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5887_38[newHeadRef->val]->t);
    newHead->val := item;
    while (true)
      invariant {:yields} true;
    {
        oldHeadRef := old(head);
        newHead->next := oldHeadRef;
        oldHead := old(heap->PolymorphicMapType_5887_38[newHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            assert newHead->next == old(head);
            break;
        }
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_pc, Civl_ok, Civl_eval := false, false, false;
    assume true;
    Civl_linear_Ref_5911_available := MapConst_5_6847(false);
    goto anon0;

  anon0:
    call newHeadRef := SpecAllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5887_38[newHeadRef->val]->t);
    newHead->val := item;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    assume Civl_pc || true;
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5911_available := MapOr_6847(Lval_Collector_6847(newHeadRef), MapConst_5_6847(false));
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHeadRef := old(head);
    newHead->next := oldHeadRef;
    oldHead := old(heap->PolymorphicMapType_5887_38[newHead->next]->t);
    call cas_success := SpecCAS_Head(oldHead, newHead);
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !cas_success;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon4_Then:
    assume {:partition} cas_success;
    assert newHead->next == old(head);
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  anon3_LoopDone:
    assume {:partition} !true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_1(Civl_linear_Ref_5911_available, Civl_global_old_heap, Civl_global_old_head);
    assume false;
    return;

  Civl_RefinementChecker:
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc ==> heap == Civl_global_old_heap && head == Civl_global_old_head;
    assume false;
    return;

  Civl_UnchangedChecker:
    assert heap == Civl_global_old_heap && head == Civl_global_old_head;
    assert Civl_pc ==> true;
    assume false;
    return;

  Civl_ReturnChecker:
    Civl_eval := (exists Civl_inline$SpecAllocNodeRef$0$k#2: Lval_6847 :: 
      Civl_inline$SpecAllocNodeRef$0$k#2->val != Nil_6871()
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head);
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc ==> heap == Civl_global_old_heap && head == Civl_global_old_head;
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || Civl_ok;
    assert Civl_ok;
    assume false;
    return;

  Civl_UnifiedReturn:
    return;
}



procedure {:inline 1} Civl_Wrapper_NoninterferenceChecker_1(Civl_linear_Ref_5911_in: [Ref_5911]bool, 
    Civl_global_old_heap: PolymorphicMapType_5887, 
    Civl_global_old_head: Ref_5911);



implementation Civl_Wrapper_NoninterferenceChecker_1(Civl_Civl_linear_Ref_5911_in: [Ref_5911]bool, 
    Civl_Civl_global_old_heap: PolymorphicMapType_5887, 
    Civl_Civl_global_old_head: Ref_5911)
{

  enter:
    return;
}


