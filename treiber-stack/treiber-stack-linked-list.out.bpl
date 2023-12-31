// Boogie program verifier version 3.0.5.0, Copyright (c) 2003-2014, Microsoft.
// Command Line Options: -trace -civlDesugaredFile:treiber-stack-linked-list.out.bpl -lib:base -lib:node treiber-stack-linked-list.bpl

type Heap = PolymorphicMapType_5917;

var heap: PolymorphicMapType_5917;

var head: Ref_5941;

const Identity: [int]int;

function {:inline} AtLeast(x: int) : [int]bool
{
  MapLe_1183(MapConst_1200_1183(x), Identity)
}

function {:inline} Range(from: int, n: int) : [int]bool
{
  MapDiff_1203(AtLeast(from), AtLeast(from + n))
}

type {:builtin "Seq"} Seq _;

datatype Node_31 {
  Node_31(next: Ref_5941, val: int)
}

type Ref_5941;

datatype Option_5964 {
  None_5964(),
  Some_5964(t: Node_31)
}

datatype Lval_7184 {
  Lval_7184(val: Ref_5941)
}

procedure Ref_Alloc_7208() returns (k: Lval_7184);



function {:builtin "MapConst"} MapConst_1200_1183(int) : [int]int;

function {:builtin "MapLe"} MapLe_1183([int]int, [int]int) : [int]bool;

function {:inline} MapDiff_1203(a: [int]bool, b: [int]bool) : [int]bool
{
  MapAnd_1203(a, MapNot_1203(b))
}

function {:builtin "MapNot"} MapNot_1203([int]bool) : [int]bool;

function {:builtin "MapAnd"} MapAnd_1203([int]bool, [int]bool) : [int]bool;

datatype Vec_1200 {
  Vec_1200(contents: [int]int, len: int)
}

function Default_1200() : int;

function {:builtin "MapIte"} MapIte_1224_1200([int]bool, [int]int, [int]int) : [int]int;

function Between_31(f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941) : bool;

function Avoiding_31(f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941) : bool;

axiom (forall x: int :: Identity[x] == x);

axiom (forall x: Vec_1200 :: 
  { x->len } { x->contents } 
  MapIte_1224_1200(Range(0, x->len), MapConst_1200_1183(Default_1200()), x->contents)
     == MapConst_1200_1183(Default_1200()));

axiom (forall x: Vec_1200 :: { x->len } x->len >= 0);

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom true;

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941 :: Between_31(f, x, x, x));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941, w: Ref_5941 :: 
  { Between_31(f, y, z, w), f[x] } 
  Between_31(f, x, f[x]->next, f[x]->next));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941 :: 
  { f[x], Between_31(f, x, y, y) } 
  Between_31(f, x, y, y) ==> x == y || Between_31(f, x, f[x]->next, y));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941 :: 
  { f[x], Between_31(f, x, y, y) } 
  f[x]->next == x && Between_31(f, x, y, y) ==> x == y);

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941 :: 
  { Between_31(f, x, y, x) } 
  Between_31(f, x, y, x) ==> x == y);

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941 :: 
  { Between_31(f, x, y, y), Between_31(f, x, z, z) } 
  Between_31(f, x, y, y) && Between_31(f, x, z, z)
     ==> Between_31(f, x, y, z) || Between_31(f, x, z, y));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941 :: 
  { Between_31(f, x, y, z) } 
  Between_31(f, x, y, z) ==> Between_31(f, x, y, y) && Between_31(f, y, z, z));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941 :: 
  { Between_31(f, x, y, y), Between_31(f, y, z, z) } 
  Between_31(f, x, y, y) && Between_31(f, y, z, z) ==> Between_31(f, x, z, z));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941, w: Ref_5941 :: 
  { Between_31(f, x, y, z), Between_31(f, y, w, z) } 
  Between_31(f, x, y, z) && Between_31(f, y, w, z)
     ==> Between_31(f, x, y, w) && Between_31(f, x, w, z));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941, w: Ref_5941 :: 
  { Between_31(f, x, y, z), Between_31(f, x, w, y) } 
  Between_31(f, x, y, z) && Between_31(f, x, w, y)
     ==> Between_31(f, x, w, z) && Between_31(f, w, y, z));

axiom (forall f: [Ref_5941]Node_31, u: Ref_5941, x: Ref_5941 :: 
  { Between_31(f, u, x, x) } 
  Between_31(f, u, x, x) ==> Between_31(f, u, u, x));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941 :: 
  { Avoiding_31(f, x, y, z) } 
  Avoiding_31(f, x, y, z)
     <==> Between_31(f, x, y, z) || (Between_31(f, x, y, y) && !Between_31(f, x, z, z)));

axiom (forall f: [Ref_5941]Node_31, x: Ref_5941, y: Ref_5941, z: Ref_5941 :: 
  { Between_31(f, x, y, z) } 
  Between_31(f, x, y, z) <==> Avoiding_31(f, x, y, z) && Avoiding_31(f, x, z, z));

axiom (forall f: [Ref_5941]Node_31, 
    u: Ref_5941, 
    v: Ref_5941, 
    x: Ref_5941, 
    p: Ref_5941, 
    q: Node_31 :: 
  { Avoiding_31(f[p := q], u, v, x) } 
  Avoiding_31(f[p := q], u, v, x)
     <==> (Avoiding_31(f, u, v, p) && Avoiding_31(f, u, v, x))
       || (
        Avoiding_31(f, u, p, x)
         && p != x
         && Avoiding_31(f, q->next, v, p)
         && Avoiding_31(f, q->next, v, x)));

datatype PolymorphicMapType_5917 {
  PolymorphicMapType_5917(PolymorphicMapType_5917_38: [Ref_5941]Option_5964)
}

function {:inline} Lval_Collector_7184(l: Lval_7184) : [Ref_5941]bool
{
  MapConst_5_7184(false)[l->val := true]
}

function {:builtin "MapConst"} MapConst_5_7184(bool) : [Ref_5941]bool;

function {:builtin "MapConst"} MapConst_3_7184(int) : [Ref_5941]int;

function {:builtin "MapOr"} MapOr_7184([Ref_5941]bool, [Ref_5941]bool) : [Ref_5941]bool;

function {:builtin "MapImp"} MapImp_7184([Ref_5941]bool, [Ref_5941]bool) : [Ref_5941]bool;

function {:builtin "MapEq"} MapEq_7184_3([Ref_5941]int, [Ref_5941]int) : [Ref_5941]bool;

function {:builtin "MapAdd"} MapAdd_7184([Ref_5941]int, [Ref_5941]int) : [Ref_5941]int;

function {:builtin "MapIte"} MapIte_7184_3([Ref_5941]bool, [Ref_5941]int, [Ref_5941]int) : [Ref_5941]int;

function {:builtin "MapLe"} MapLe_7184([Ref_5941]int, [Ref_5941]int) : [Ref_5941]bool;

datatype Lheap_7208 {
  Lheap_7208(dom: [Ref_5941]bool, val: [Ref_5941]Node_31)
}

datatype Lset_7208 {
  Lset_7208(dom: [Node_31]bool)
}

datatype Lval_7208 {
  Lval_7208(val: Node_31)
}

function Nil_7208() : Ref_5941;

function Trigger_SpecSetRefVal__heap(_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecGetRefVal__heap(_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5941) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5964) : bool;

function Trigger_SpecCAS_Head_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5941) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5964) : bool;

function Trigger_SpecAllocNodeRef_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_newHeadRef(newHeadRef: Lval_7184) : bool;

function Trigger_SpecPush_newHead(newHead: Node_31) : bool;

function Trigger_SpecPush_inline$SpecAllocNodeRef$0$k(inline$SpecAllocNodeRef$0$k: Lval_7184) : bool;

function Trigger_SpecPush_inline$SpecAllocNodeRef$0$heap(inline$SpecAllocNodeRef$0$heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$_heap(inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$ref(inline$SpecSetRefVal$0$ref: Ref_5941) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$x(inline$SpecSetRefVal$0$x: Option_5964) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$0$heap(inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$_heap(inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$ref(inline$SpecGetRefVal$0$ref: Ref_5941) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$x(inline$SpecGetRefVal$0$x: Node_31) : bool;

function Trigger_SpecPush_inline$SpecGetRefVal$0$heap(inline$SpecGetRefVal$0$heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$_heap(inline$SpecSetRefVal$1$_heap: PolymorphicMapType_5917) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$ref(inline$SpecSetRefVal$1$ref: Ref_5941) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$x(inline$SpecSetRefVal$1$x: Option_5964) : bool;

function Trigger_SpecPush_inline$SpecSetRefVal$1$heap(inline$SpecSetRefVal$1$heap: PolymorphicMapType_5917) : bool;

implementation SpecSetRefVal(ref: Ref_5941, x: Option_5964)
{
  var _heap: PolymorphicMapType_5917;

  /*** structured program:
    _heap := old(heap);
    _heap->PolymorphicMapType_5917_38[ref] := x;
  **** end structured program */

  anon0:
    _heap := old(heap);
    _heap->PolymorphicMapType_5917_38[ref] := x;
    return;
}



procedure {:inline 1} SpecSetRefVal(ref: Ref_5941, x: Option_5964);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecSetRefVal(ref: Ref_5941, x: Option_5964) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    Civl_heap == Civl_old_heap)
}

implementation SpecGetRefVal(ref: Ref_5941) returns (x: Node_31)
{
  var _heap: PolymorphicMapType_5917;

  /*** structured program:
    _heap := old(heap);
    x := _heap->PolymorphicMapType_5917_38[ref]->t;
  **** end structured program */

  anon0:
    _heap := old(heap);
    x := _heap->PolymorphicMapType_5917_38[ref]->t;
    return;
}



procedure {:inline 1} SpecGetRefVal(ref: Ref_5941) returns (x: Node_31);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecGetRefVal(ref: Ref_5941, x: Node_31) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    x == Civl_heap->PolymorphicMapType_5917_38[ref]->t && Civl_heap == Civl_old_heap)
}

implementation SpecNodeEq(n1: Node_31, n2: Node_31) returns (eq: bool)
{
  /*** structured program:
    eq := n1->val == n2->val && n1->next == n2->next;
  **** end structured program */

  anon0:
    eq := n1->val == n2->val && n1->next == n2->next;
    return;
}



procedure {:inline 1} SpecNodeEq(n1: Node_31, n2: Node_31) returns (eq: bool);



function {:inline} Civl_InputOutputRelation_SpecNodeEq(n1: Node_31, n2: Node_31, eq: bool) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    eq <==> n1->val == n2->val && n1->next == n2->next)
}

implementation SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool)
{
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$0$ref: Ref_5941;
  var inline$SpecSetRefVal$0$x: Option_5964;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917;

  /*** structured program:
    if (heap[head] == Some(expectedNode))
    {
        call SpecSetRefVal(head, Some_5964(desiredNode));
    }
  **** end structured program */

  anon0:
    goto anon2_Then, anon2_Else;

  anon2_Else:
    assume {:partition} heap->PolymorphicMapType_5917_38[head] != Some_5964(expectedNode);
    return;

  anon2_Then:
    assume {:partition} heap->PolymorphicMapType_5917_38[head] == Some_5964(expectedNode);
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := head;
    inline$SpecSetRefVal$0$x := Some_5964(desiredNode);
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5917_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto anon2_Then$1;

  anon2_Then$1:
    return;
}



procedure {:inline 1} SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecCAS_Head(expectedNode: Node_31, desiredNode: Node_31, success: bool) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    (Civl_heap->PolymorphicMapType_5917_38[Civl_head] == Some_5964(expectedNode)
         && Civl_heap == Civl_old_heap)
       || (Civl_heap->PolymorphicMapType_5917_38[Civl_head] != Some_5964(expectedNode)
         && Civl_heap == Civl_old_heap))
}

implementation SpecAllocNodeRef() returns (k: Lval_7184)
{
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$0$ref: Ref_5941;
  var inline$SpecSetRefVal$0$x: Option_5964;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917;

  /*** structured program:
    call k := Ref_Alloc_7208();
    call SpecSetRefVal(k->val, None_5964());
  **** end structured program */

  anon0:
    havoc k;
    assume k->val != Nil_7208();
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := k->val;
    inline$SpecSetRefVal$0$x := None_5964();
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5917_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
    goto inline$SpecSetRefVal$0$Return;

  inline$SpecSetRefVal$0$Return:
    goto anon0$1;

  anon0$1:
    return;
}



procedure {:inline 1} SpecAllocNodeRef() returns (k: Lval_7184);
  modifies heap;



function {:inline} Civl_InputOutputRelation_SpecAllocNodeRef(k: Lval_7184) : bool
{
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    k->val != Nil_7208() && Civl_heap == Civl_old_heap)
}

implementation SpecPush(item: int)
{
  var newHeadRef: Lval_7184;
  var newHead: Node_31;
  var inline$SpecAllocNodeRef$0$k: Lval_7184;
  var inline$SpecAllocNodeRef$0$heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$0$_heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$0$ref: Ref_5941;
  var inline$SpecSetRefVal$0$x: Option_5964;
  var inline$SpecSetRefVal$0$heap: PolymorphicMapType_5917;
  var inline$SpecGetRefVal$0$_heap: PolymorphicMapType_5917;
  var inline$SpecGetRefVal$0$ref: Ref_5941;
  var inline$SpecGetRefVal$0$x: Node_31;
  var inline$SpecGetRefVal$0$heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$1$_heap: PolymorphicMapType_5917;
  var inline$SpecSetRefVal$1$ref: Ref_5941;
  var inline$SpecSetRefVal$1$x: Option_5964;
  var inline$SpecSetRefVal$1$heap: PolymorphicMapType_5917;

  /*** structured program:
    call newHeadRef := SpecAllocNodeRef();
    call newHead := SpecGetRefVal(newHeadRef->val);
    newHead->next := head;
    newHead->val := item;
    call SpecSetRefVal(head, Some_5964(newHead));
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
    assume inline$SpecAllocNodeRef$0$k->val != Nil_7208();
    goto inline$SpecSetRefVal$0$Entry;

  inline$SpecSetRefVal$0$Entry:
    inline$SpecSetRefVal$0$ref := inline$SpecAllocNodeRef$0$k->val;
    inline$SpecSetRefVal$0$x := None_5964();
    havoc inline$SpecSetRefVal$0$_heap;
    inline$SpecSetRefVal$0$heap := heap;
    goto inline$SpecSetRefVal$0$anon0;

  inline$SpecSetRefVal$0$anon0:
    inline$SpecSetRefVal$0$_heap := inline$SpecSetRefVal$0$heap;
    inline$SpecSetRefVal$0$_heap->PolymorphicMapType_5917_38[inline$SpecSetRefVal$0$ref] := inline$SpecSetRefVal$0$x;
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
    inline$SpecGetRefVal$0$x := inline$SpecGetRefVal$0$_heap->PolymorphicMapType_5917_38[inline$SpecGetRefVal$0$ref]->t;
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
    inline$SpecSetRefVal$1$x := Some_5964(newHead);
    havoc inline$SpecSetRefVal$1$_heap;
    inline$SpecSetRefVal$1$heap := heap;
    goto inline$SpecSetRefVal$1$anon0;

  inline$SpecSetRefVal$1$anon0:
    inline$SpecSetRefVal$1$_heap := inline$SpecSetRefVal$1$heap;
    inline$SpecSetRefVal$1$_heap->PolymorphicMapType_5917_38[inline$SpecSetRefVal$1$ref] := inline$SpecSetRefVal$1$x;
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
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941, 
      Civl_inline$SpecAllocNodeRef$0$k#2: Lval_7184 :: 
    Civl_inline$SpecAllocNodeRef$0$k#2->val != Nil_7208()
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
  (exists Civl_old_heap: PolymorphicMapType_5917, 
      Civl_old_head: Ref_5941, 
      Civl_heap: PolymorphicMapType_5917, 
      Civl_head: Ref_5941 :: 
    true)
}

procedure Civl_SetRefVal_0(ref: Ref_5941, x: Option_5964);
  modifies heap, head;



procedure Civl_GetRefVal_0(ref: Ref_5941) returns (x: Node_31);
  modifies heap, head;



procedure Civl_NodeEq_0(n1: Node_31, n2: Node_31) returns (eq: bool);
  modifies heap, head;



procedure Civl_CAS_Head_0(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool);
  modifies heap, head;



procedure Civl_AllocNodeRef_0() returns (k: Lval_7184);
  modifies heap, head;



procedure Civl_Pop_0() returns (item: int);
  modifies heap, head;



procedure Civl_Push_0(item: int);
  modifies heap, head;



implementation Civl_NodeEq_0(n1: Node_31, n2: Node_31) returns (eq: bool)
{
  var Civl_global_old_heap: PolymorphicMapType_5917;
  var Civl_global_old_head: Ref_5941;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_old_eq: bool;
  var Civl_linear_Ref_5941_available: [Ref_5941]bool;

  /*** structured program:
    eq := n1->val == n2->val && n1->next == n2->next;
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_pc, Civl_ok, Civl_eval := false, false, false;
    Civl_old_eq := eq;
    assume true;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon0;

  anon0:
    eq := n1->val == n2->val && n1->next == n2->next;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5941_available, Civl_global_old_heap, Civl_global_old_head);
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
    Civl_eval := (eq <==> n1->val == n2->val && n1->next == n2->next)
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



implementation Civl_CAS_Head_0(expectedNode: Node_31, desiredNode: Node_31) returns (success: bool)
{
  var eq: bool;
  var headNode: Node_31;
  var _head: Ref_5941;
  var _heap: PolymorphicMapType_5917;
  var Civl_global_old_heap: PolymorphicMapType_5917;
  var Civl_global_old_head: Ref_5941;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_old_success: bool;
  var Civl_linear_Ref_5941_available: [Ref_5941]bool;

  /*** structured program:
    _head := old(head);
    call headNode := GetRefVal(_head);
    call eq := NodeEq(headNode, expectedNode);
    if (eq)
    {
        call SetRefVal(_head, Some_5964(desiredNode));
        success := true;
    }
    else
    {
        success := false;
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_pc, Civl_ok, Civl_eval := false, false, false;
    Civl_old_success := success;
    assume true;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon0;

  anon0:
    _head := old(head);
    Civl_eval := (
        heap->PolymorphicMapType_5917_38[head] == Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head)
       || (
        heap->PolymorphicMapType_5917_38[head] != Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head);
    goto anon0_1, Civl_call_refinement_0, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon0_1:
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || ((success <==> Civl_old_success) && Civl_ok);
    call headNode := Civl_ParallelCall_GetRefVal_0(_head);
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    Civl_eval := (
        heap->PolymorphicMapType_5917_38[head] == Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head)
       || (
        heap->PolymorphicMapType_5917_38[head] != Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head);
    goto anon0_0, Civl_call_refinement_1, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon0_0:
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || ((success <==> Civl_old_success) && Civl_ok);
    call eq := Civl_ParallelCall_NodeEq_0(headNode, expectedNode);
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon3_Then, anon3_Else;

  anon3_Else:
    assume {:partition} !eq;
    success := false;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  anon3_Then:
    assume {:partition} eq;
    Civl_eval := (
        heap->PolymorphicMapType_5917_38[head] == Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head)
       || (
        heap->PolymorphicMapType_5917_38[head] != Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head);
    goto anon3_Then_0, Civl_call_refinement_2, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_Then_0:
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || ((success <==> Civl_old_success) && Civl_ok);
    call Civl_ParallelCall_SetRefVal_0(_head, Some_5964(desiredNode));
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    success := true;
    goto Civl_ReturnChecker, Civl_UnifiedReturn, Civl_NoninterferenceChecker;

  Civl_NoninterferenceChecker:
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5941_available, Civl_global_old_heap, Civl_global_old_head);
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
         && (success <==> Civl_old_success);
    assume false;
    return;

  Civl_UnchangedChecker:
    assert heap == Civl_global_old_heap && head == Civl_global_old_head;
    assert Civl_pc ==> (success <==> Civl_old_success);
    assume false;
    return;

  Civl_ReturnChecker:
    Civl_eval := (
        heap->PolymorphicMapType_5917_38[head] == Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head)
       || (
        heap->PolymorphicMapType_5917_38[head] != Some_5964(expectedNode)
         && heap == Civl_global_old_heap
         && head == Civl_global_old_head);
    assert Civl_pc
       || 
      (heap == Civl_global_old_heap && head == Civl_global_old_head)
       || Civl_eval;
    assert Civl_pc
       ==> heap == Civl_global_old_heap
         && head == Civl_global_old_head
         && (success <==> Civl_old_success);
    Civl_pc, Civl_ok := heap == Civl_global_old_heap && head == Civl_global_old_head ==> Civl_pc, Civl_eval || ((success <==> Civl_old_success) && Civl_ok);
    assert Civl_ok;
    assume false;
    return;

  Civl_UnifiedReturn:
    return;

  Civl_call_refinement_0:
    havoc heap, head;
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    call headNode := SpecGetRefVal(_head);
    goto Civl_UnchangedChecker;

  Civl_call_refinement_1:
    havoc heap, head;
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    call eq := SpecNodeEq(headNode, expectedNode);
    goto Civl_UnchangedChecker;

  Civl_call_refinement_2:
    havoc heap, head;
    assume Civl_pc || true;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_old_success := success;
    call SpecSetRefVal(_head, Some_5964(desiredNode));
    goto Civl_UnchangedChecker;
}



implementation Civl_Pop_0() returns (item: int)
{
  var oldHead: Node_31;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5917;
  var Civl_global_old_head: Ref_5941;
  var Civl_linear_Ref_5941_available: [Ref_5941]bool;

  /*** structured program:
    while (true)
      invariant {:yields} true;
    {
        oldHead := old(heap->PolymorphicMapType_5917_38[head]->t);
        newHead := old(heap->PolymorphicMapType_5917_38[oldHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            item := oldHead->val;
            assert item == old(heap->PolymorphicMapType_5917_38[head]->t->val);
            assert newHead
               == old(heap->PolymorphicMapType_5917_38[heap->PolymorphicMapType_5917_38[head]->t->next]->t);
            break;
        }
    }
  **** end structured program */

  Civl_init:
    havoc heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon0;

  anon0:
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHead := old(heap->PolymorphicMapType_5917_38[head]->t);
    newHead := old(heap->PolymorphicMapType_5917_38[oldHead->next]->t);
    goto anon3_LoopBody_0, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon3_LoopBody_0:
    call cas_success := Civl_ParallelCall_CAS_Head_0(oldHead, newHead);
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
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
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5941_available, Civl_global_old_heap, Civl_global_old_head);
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
  var oldHeadRef: Ref_5941;
  var oldHead: Node_31;
  var newHeadRef: Lval_7184;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5917;
  var Civl_global_old_head: Ref_5941;
  var Civl_linear_Ref_5941_available: [Ref_5941]bool;

  /*** structured program:
    call newHeadRef := AllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5917_38[newHeadRef->val]->t);
    newHead->val := item;
    while (true)
      invariant {:yields} true;
    {
        oldHeadRef := old(head);
        newHead->next := oldHeadRef;
        oldHead := old(heap->PolymorphicMapType_5917_38[newHead->next]->t);
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
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon0;

  anon0:
    goto anon0_0, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon0_0:
    call newHeadRef := Civl_ParallelCall_AllocNodeRef_0();
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapOr_7184(Lval_Collector_7184(newHeadRef), MapConst_5_7184(false));
    newHead := old(heap->PolymorphicMapType_5917_38[newHeadRef->val]->t);
    newHead->val := item;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapOr_7184(Lval_Collector_7184(newHeadRef), MapConst_5_7184(false));
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHeadRef := old(head);
    newHead->next := oldHeadRef;
    oldHead := old(heap->PolymorphicMapType_5917_38[newHead->next]->t);
    goto anon3_LoopBody_0, Civl_NoninterferenceChecker, Civl_UnchangedChecker;

  anon3_LoopBody_0:
    call cas_success := Civl_ParallelCall_CAS_Head_0(oldHead, newHead);
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapOr_7184(Lval_Collector_7184(newHeadRef), MapConst_5_7184(false));
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
    call Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5941_available, Civl_global_old_heap, Civl_global_old_head);
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



procedure Civl_ParallelCall_GetRefVal_0(Civl_0_ref: Ref_5941) returns (Civl_0_x: Node_31);
  modifies heap, head;



procedure Civl_ParallelCall_NodeEq_0(Civl_0_n1: Node_31, Civl_0_n2: Node_31) returns (Civl_0_eq: bool);
  modifies heap, head;



procedure Civl_ParallelCall_SetRefVal_0(Civl_0_ref: Ref_5941, Civl_0_x: Option_5964);
  modifies heap, head;



procedure Civl_ParallelCall_CAS_Head_0(Civl_0_expectedNode: Node_31, Civl_0_desiredNode: Node_31)
   returns (Civl_0_success: bool);
  modifies heap, head;



procedure Civl_ParallelCall_AllocNodeRef_0() returns (Civl_0_k: Lval_7184);
  modifies heap, head;



procedure {:inline 1} Civl_Wrapper_NoninterferenceChecker_0(Civl_linear_Ref_5941_in: [Ref_5941]bool, 
    Civl_global_old_heap: PolymorphicMapType_5917, 
    Civl_global_old_head: Ref_5941);



implementation Civl_Wrapper_NoninterferenceChecker_0(Civl_Civl_linear_Ref_5941_in: [Ref_5941]bool, 
    Civl_Civl_global_old_heap: PolymorphicMapType_5917, 
    Civl_Civl_global_old_head: Ref_5941)
{

  enter:
    return;
}



procedure Civl_Pop_1() returns (item: int);
  modifies heap;



procedure Civl_Push_1(item: int);
  modifies heap, head;



implementation Civl_Pop_1() returns (item: int)
{
  var oldHead: Node_31;
  var newHead: Node_31;
  var cas_success: bool;

  /*** structured program:
    while (true)
      invariant {:yields} true;
    {
        oldHead := old(heap->PolymorphicMapType_5917_38[head]->t);
        newHead := old(heap->PolymorphicMapType_5917_38[oldHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success)
        {
            item := oldHead->val;
            assert item == old(heap->PolymorphicMapType_5917_38[head]->t->val);
            assert newHead
               == old(heap->PolymorphicMapType_5917_38[heap->PolymorphicMapType_5917_38[head]->t->next]->t);
            break;
        }
    }
  **** end structured program */

  anon0:
    goto anon3_LoopHead;

  anon3_LoopHead:
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHead := old(heap->PolymorphicMapType_5917_38[head]->t);
    newHead := old(heap->PolymorphicMapType_5917_38[oldHead->next]->t);
    call cas_success := SpecCAS_Head(oldHead, newHead);
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !cas_success;
    goto anon3_LoopHead;

  anon4_Then:
    assume {:partition} cas_success;
    item := oldHead->val;
    assert item == old(heap->PolymorphicMapType_5917_38[head]->t->val);
    assert newHead
       == old(heap->PolymorphicMapType_5917_38[heap->PolymorphicMapType_5917_38[head]->t->next]->t);
    return;

  anon3_LoopDone:
    assume {:partition} !true;
    return;
}



implementation Civl_Push_1(item: int)
{
  var oldHeadRef: Ref_5941;
  var oldHead: Node_31;
  var newHeadRef: Lval_7184;
  var newHead: Node_31;
  var cas_success: bool;
  var Civl_global_old_heap: PolymorphicMapType_5917;
  var Civl_global_old_head: Ref_5941;
  var Civl_pc: bool;
  var Civl_ok: bool;
  var Civl_eval: bool;
  var Civl_linear_Ref_5941_available: [Ref_5941]bool;

  /*** structured program:
    call newHeadRef := AllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5917_38[newHeadRef->val]->t);
    newHead->val := item;
    while (true)
      invariant {:yields} true;
    {
        oldHeadRef := old(head);
        newHead->next := oldHeadRef;
        oldHead := old(heap->PolymorphicMapType_5917_38[newHead->next]->t);
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
    Civl_linear_Ref_5941_available := MapConst_5_7184(false);
    goto anon0;

  anon0:
    call newHeadRef := SpecAllocNodeRef();
    newHead := old(heap->PolymorphicMapType_5917_38[newHeadRef->val]->t);
    newHead->val := item;
    goto anon3_LoopHead, Civl_NoninterferenceChecker, Civl_RefinementChecker;

  anon3_LoopHead:
    assume Civl_pc || true;
    heap, head := heap, head;
    Civl_global_old_heap, Civl_global_old_head := heap, head;
    Civl_linear_Ref_5941_available := MapOr_7184(Lval_Collector_7184(newHeadRef), MapConst_5_7184(false));
    goto anon3_LoopDone, anon3_LoopBody;

  anon3_LoopBody:
    assume {:partition} true;
    oldHeadRef := old(head);
    newHead->next := oldHeadRef;
    oldHead := old(heap->PolymorphicMapType_5917_38[newHead->next]->t);
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
    call Civl_Wrapper_NoninterferenceChecker_1(Civl_linear_Ref_5941_available, Civl_global_old_heap, Civl_global_old_head);
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
    Civl_eval := (exists Civl_inline$SpecAllocNodeRef$0$k#2: Lval_7184 :: 
      Civl_inline$SpecAllocNodeRef$0$k#2->val != Nil_7208()
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



procedure {:inline 1} Civl_Wrapper_NoninterferenceChecker_1(Civl_linear_Ref_5941_in: [Ref_5941]bool, 
    Civl_global_old_heap: PolymorphicMapType_5917, 
    Civl_global_old_head: Ref_5941);



implementation Civl_Wrapper_NoninterferenceChecker_1(Civl_Civl_linear_Ref_5941_in: [Ref_5941]bool, 
    Civl_Civl_global_old_heap: PolymorphicMapType_5917, 
    Civl_Civl_global_old_head: Ref_5941)
{

  enter:
    return;
}


