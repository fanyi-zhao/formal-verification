type Heap = <a>[RefNode a]Option(Node a);
var {:layer 0, 2} heap: Heap;
var {:layer 0, 2} head: RefNode(int);

atomic action {:layer 1, 2} SpecSetRefVal(ref: RefNode(int), x: Option(Node(int)))
modifies heap;
{
    var _heap: Heap;
    _heap := old(heap);
    _heap[ref] := x;
}
yield procedure {:layer 0} SetRefVal(ref: RefNode(int), x: Option(Node(int)));
refines SpecSetRefVal;
ensures heap[ref]->t == x->t;

atomic action {:layer 1, 2} SpecGetRefVal(ref: RefNode(int)) returns (x: Node(int)) 
modifies heap;
{
    var _heap: Heap;
    _heap := old(heap);
    x := _heap[ref]->t;
}
yield procedure {:layer 0} GetRefVal(ref: RefNode(int)) returns (x: Node(int));
refines SpecGetRefVal;
ensures Some(x) == heap[ref];


atomic action {:layer 1, 2} SpecNodeEq(n1: Node(int), n2: Node(int)) returns (eq: bool) {
    eq := n1 == n2;
}
yield procedure {:layer 0} NodeEq(n1: Node(int), n2: Node(int)) returns (eq: bool)
refines SpecNodeEq;
{
    eq := (n1->val == n2->val && n1->next == n2->next);
}

atomic action {:layer 1, 2} SpecCAS_Head(expectedNode: Node(int), desiredNode: Node(int)) returns (success: bool) 
modifies heap;
{
    var eq: bool;
    var headNode: Node(int);

    call headNode := SpecGetRefVal(head);
    call eq := SpecNodeEq(headNode, expectedNode);

    if (eq) {
        call SpecSetRefVal(head, Some(desiredNode));
        success := true;
    } else {
        success := false;
    }
}
yield procedure {:layer 0} CAS_Head(expectedNode: Node(int), desiredNode: Node(int)) returns (success: bool);
refines SpecCAS_Head;
ensures success == (
    (old(heap[head]->t->val) == expectedNode->val)
    && (old(heap[head]->t->next) == expectedNode->next)
);

atomic action {:layer 1, 2} SpecAllocNodeRef() returns (k: Lval (RefNode(int)))
modifies heap;
{
    call k := Ref_Alloc();
    call SpecSetRefVal(k->val, None());
}
yield procedure {:layer 0} AllocNodeRef() returns (k: Lval (RefNode(int)));
refines SpecAllocNodeRef;

// pop
atomic action {:layer 2} SpecPop() returns (item: int) 
modifies heap;
modifies head;
{
    var oldHead: Node(int);
    var newHead: Node(int);

    call oldHead := SpecGetRefVal(head);
    call newHead := SpecGetRefVal(oldHead->next);
    call SpecSetRefVal(head, Some(newHead));
    item := oldHead->val;
}
yield procedure {:layer 1} Pop() returns (item: int)
ensures item == old(heap[head]->t->val);
ensures head == old(heap[head]->t->next);
refines SpecPop;
{
    var oldHead: Node(int);
    var newHead: Node(int);
    var cas_success: bool;

    while (true)
    invariant {:yields} true;
    {
        oldHead := old(heap[head]->t);
        newHead := old(heap[oldHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success) {
            item := oldHead->val;
            assert {:layer 1} item == old(heap[head]->t->val);
            assert {:layer 1} newHead == old(heap[heap[head]->t->next]->t);
            break;
        }
    }
}

// push
atomic action {:layer 2} SpecPush(item: int)
modifies heap;
{
    var newHeadRef: Lval(RefNode(int));
    var newHead: Node(int);

    call newHeadRef := SpecAllocNodeRef();
    call newHead := SpecGetRefVal(newHeadRef->val);
    newHead->next := head;
    newHead->val := item;
    call SpecSetRefVal(head, Some(newHead));
}
yield procedure {:layer 1} Push(item: int)
ensures heap[heap[head]->t->next]->t->val == old(heap[head]->t->val);
ensures item == heap[head]->t->val;
refines SpecPush;
{
    var oldHeadRef: RefNode(int);
    var oldHead: Node(int);
    var newHeadRef: Lval(RefNode(int));
    var newHead: Node(int);
    var cas_success: bool;

    call newHeadRef := AllocNodeRef();
    newHead := old(heap[newHeadRef->val]->t);
    newHead->val := item;

    while (true)
    invariant {:yields} true;
    {
        oldHeadRef := old(head);
        newHead->next := oldHeadRef;
        oldHead := old(heap[newHead->next]->t);
        call cas_success := CAS_Head(oldHead, newHead);
        if (cas_success) {
            assert {:layer 1} newHead->next == old(head);
            break;
        }
    }
}