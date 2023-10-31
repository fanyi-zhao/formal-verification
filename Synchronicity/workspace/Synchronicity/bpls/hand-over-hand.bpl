                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/hand-over-hand.sink:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
      invariant  this.next != this;                                                                 
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void append(int item) {                                                                
        Node curr;                                                                                  
        curr = this;                                                                                
        acquire(curr);                                                                              
        Node next;                                                                                  
        next := curr.next;                                                                          
        while (next != Node.null)                                                                   
          invariant isShared(curr);                                                                 
          invariant next == Node.null || isShared(next);                                            
          invariant holds(curr, tid);                                                               
          invariant curr.next == next;                                                              
          {                                                                                         
          acquire(next);                                                                            
          Node prev;                                                                                
          prev = curr;                                                                              
          curr = next;                                                                              
          next := curr.next;                                                                        
          release(prev);                                                                            
          yield;                                                                                    
        }                                                                                           
        Node node;                                                                                  
        node = new Node();                                                                          
        node.item := item;                                                                          
        curr.next := node;                                                                          
        release(curr);                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
       Tid _lock isLocal(this, tid)                                                                 
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this._lock == tid ? R : E                                                                
         : this._lock == Tid.null && newValue == tid                                                
           ? R                                                                                      
           : this._lock == tid && newValue == Tid.null ? L : E !                                    
        yields_as this._lock == tid == (newValue == tid);                                           
                                                                                                    
                                                                                                    
      invariant  this.next != this;                                                                 
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void append(int item) {                                                                
        Node curr;                                                                                  
        curr = this;                                                                                
        acquire(curr);                                                                              
        Node next;                                                                                  
        next := curr.next;                                                                          
        while (next != Node.null)                                                                   
          invariant isShared(curr);                                                                 
          invariant next == Node.null || isShared(next);                                            
          invariant holds(curr, tid);                                                               
          invariant curr.next == next;                                                              
          {                                                                                         
          acquire(next);                                                                            
          Node prev;                                                                                
          prev = curr;                                                                              
          curr = next;                                                                              
          next := curr.next;                                                                        
          release(prev);                                                                            
          yield;                                                                                    
        }                                                                                           
        Node node;                                                                                  
        node = new Node();                                                                          
        node.item := item;                                                                          
        curr.next := node;                                                                          
        release(curr);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
       Tid _lock isLocal(this, tid)                                                                 
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this._lock == tid ? R : E                                                                
         : this._lock == Tid.null && newValue == tid                                                
           ? R                                                                                      
           : this._lock == tid && newValue == Tid.null ? L : E !                                    
        yields_as this._lock == tid == (newValue == tid);                                           
                                                                                                    
                                                                                                    
      invariant  this.next != this;                                                                 
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void append(int item) {                                                                
        Node curr;                                                                                  
        curr = this;                                                                                
        acquire(curr);                                                                              
        Node next;                                                                                  
        next := curr.next;                                                                          
        while (next != Node.null)                                                                   
          invariant isShared(curr);                                                                 
          invariant next == Node.null || isShared(next);                                            
          invariant holds(curr, tid);                                                               
          invariant curr.next == next;                                                              
          {                                                                                         
          acquire(next);                                                                            
          Node prev;                                                                                
          prev = curr;                                                                              
          curr = next;                                                                              
          next := curr.next;                                                                        
          release(prev);                                                                            
          yield;                                                                                    
        }                                                                                           
        Node node;                                                                                  
        node = new Node();                                                                          
        node.item := item;                                                                          
        curr.next := node;                                                                          
        release(curr);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
       Tid _lock isLocal(this, tid)                                                                 
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this._lock == tid ? R : E                                                                
         : this._lock == Tid.null && newValue == tid                                                
           ? R                                                                                      
           : this._lock == tid && newValue == Tid.null ? L : E !                                    
        yields_as this._lock == tid == (newValue == tid);                                           
                                                                                                    
                                                                                                    
      invariant  this.next != this;                                                                 
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void append(int item) {                                                                
        Node curr;                                                                                  
        curr = this;                                                                                
        acquire(curr);                                                                              
        Node next;                                                                                  
        next := curr.next;                                                                          
        while (next != Node.null)                                                                   
          invariant isShared(curr);                                                                 
          invariant next == Node.null || isShared(next);                                            
          invariant holds(curr, tid);                                                               
          invariant curr.next == next;                                                              
          {                                                                                         
          acquire(next);                                                                            
          Node prev;                                                                                
          prev = curr;                                                                              
          curr = next;                                                                              
          next := curr.next;                                                                        
          release(prev);                                                                            
          yield;                                                                                    
        }                                                                                           
        Node node;                                                                                  
        node = new Node();                                                                          
        node.item := item;                                                                          
        curr.next := node;                                                                          
        release(curr);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
 */                                                                                                 
                                                                                                    
//// Background                                                                                     
                                                                                                    
                                                                                                    
 /*                                                                                                 
 * Tid                                                                                              
 */                                                                                                 
 type Tid = int;  // make int so you can iterate over Tids                                          
 const unique Tid.null: Tid;                                                                        
 axiom Tid.null == -1;                                                                              
                                                                                                    
 function {:inline} ValidTid(tid : Tid): bool {                                                     
  tid != Tid.null && tid >= 0                                                                       
 }                                                                                                  
                                                                                                    
 type{:datatype} State;                                                                             
 function{:constructor} NULL(): State;                                                              
 function{:constructor} FRESH(): State;                                                             
 function{:constructor} LOCAL(t: Tid): State;                                                       
 function{:constructor} SHARED(): State;                                                            
                                                                                                    
 function {:inline} isNull(state: State) : bool {                                                   
  state == NULL()                                                                                   
 }                                                                                                  
                                                                                                    
 function {:inline} isFresh(state: State) : bool {                                                  
  state == FRESH()                                                                                  
 }                                                                                                  
                                                                                                    
 function {:inline} isShared(state: State) : bool {                                                 
  state == SHARED()                                                                                 
 }                                                                                                  
                                                                                                    
 function {:inline} isLocal(state: State, t: Tid) : bool {                                          
  state == LOCAL(t)                                                                                 
 }                                                                                                  
                                                                                                    
 function {:inline} isLocalAssignable(state: State, t: Tid) : bool {                                
  state == LOCAL(t) || state == SHARED() || state == NULL()                                         
 }                                                                                                  
                                                                                                    
 function {:inline} isSharedAssignable(state: State) : bool {                                       
  state == SHARED() || state == NULL()                                                              
 }                                                                                                  
                                                                                                    
 function {:inline} isAccessible(state: State, t: Tid) : bool {                                     
  state == LOCAL(t) || state == SHARED()                                                            
 }                                                                                                  
                                                                                                    
 function {:inline} isAllocated(state: State) : bool {                                              
  !isFresh(state) && !isNull(state)                                                                 
 }                                                                                                  
                                                                                                    
                                                                                                    
 function MOD(x:int, y:int): int;                                                                   
                                                                                                    
                                                                                                    
 /*                                                                                                 
 * For triggers                                                                                     
 */                                                                                                 
 function {:inline false} _trigger(i: int): bool {  true  }                                         
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 type Phase;                                                                                        
 const unique PreCommit : Phase;                                                                    
 const unique PostCommit : Phase;                                                                   
 const unique PhaseError : Phase;                                                                   
                                                                                                    
 function {:inline} transition(p: Phase, m: Mover): Phase {                                         
  if (m == _B) then                                                                                 
   p                                                                                                
  else if (m == _R) then                                                                            
   if (p == PreCommit) then                                                                         
    PreCommit                                                                                       
   else                                                                                             
    PhaseError                                                                                      
  else if (m == _L) then                                                                            
   if (p == PostCommit) then                                                                        
    PostCommit                                                                                      
   else if (p == PreCommit) then                                                                    
    PostCommit                                                                                      
   else                                                                                             
    PhaseError                                                                                      
  else if (m == _N) then                                                                            
   if (p == PreCommit) then                                                                         
    PostCommit                                                                                      
   else                                                                                             
    PhaseError                                                                                      
  else                                                                                              
   PhaseError // m == E or m == I                                                                   
 }                                                                                                  
                                                                                                    
                                                                                                    
 type Mover;                                                                                        
 const unique _B : Mover;                                                                           
 const unique _R : Mover;                                                                           
 const unique _L : Mover;                                                                           
 const unique _N : Mover;                                                                           
 const unique _E : Mover;                                                                           
                                                                                                    
 axiom (forall m : Mover :: m == _B || m == _R || m == _L || m == _N || m == _E);                   
                                                                                                    
 function {:inline} leq(m1: Mover, m2: Mover) : bool {                                              
  if (m1 == _B) then                                                                                
   true                                                                                             
  else if (m1 == _R) then                                                                           
   m2 == _R || m2 == _N || m2 == _E                                                                 
  else if (m1 == _L) then                                                                           
   m2 == _L || m2 == _N || m2 == _E                                                                 
  else if (m1 == _N) then                                                                           
   m2 == _N || m2 == _E                                                                             
  else if (m1 == _E) then                                                                           
   m2 == _E                                                                                         
  else                                                                                              
   false // should never happen...                                                                  
 }                                                                                                  
                                                                                                    
 function {:inline} lt(m1: Mover, m2: Mover) : bool { m1 != m2 && leq(m1, m2) }                     
                                                                                                    
 function {:inline} isError(m : Mover) : bool {                                                     
  m == _E                                                                                           
 }                                                                                                  
                                                                                                    
 function {:inline} eqOrError(m : Mover, n : Mover) : bool {                                        
  m == n || m == _E                                                                                 
 }                                                                                                  
                                                                                                    
 type{:datatype} MoverPath;                                                                         
 function{:constructor} moverPath(m:Mover, p:int):MoverPath;                                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// axioms                                                                                         
                                                                                                    
                                                                                                    
//// classes                                                                                        
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.item: [Node]int;                                                                           
                                                                                                    
function {:inline} ReadEval.Node.item(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.item(tid: Tid,this : Node,newValue: int,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.next: [Node]Node;                                                                          
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Node._state[this], tid) && Node._lock[this] == tid)) then                       
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Node._state[this], tid) && Node._lock[this] == tid)) then                       
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Node.1780836(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (bool) {
 (Node.next[this]!=this)                                                                            
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Node.append(tid:Tid, this : Node, item : int)                                            
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.5): Bad tid
requires isShared(Node._state[this]);                                                                      // (10.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                             
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (10.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock);                              
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (10.5): Object invariant may not hold.
{                                                                                                   
 var item1781053_bottom: int;                                                                       
 var $recorded.state1781064: int;                                                                   
 var path1781034: int;                                                                              
 var Node.item1781051_post: [Node]int;                                                              
 var $pc1781061: Phase;                                                                             
 var Node.item1781053: [Node]int;                                                                   
 var next: Node;                                                                                    
 var $recorded.state1781048: int;                                                                   
 var curr1781067: Node;                                                                             
 var $pc1781051_post: Phase;                                                                        
 var tid1781064: Tid;                                                                               
 var Node.item1781064: [Node]int;                                                                   
 var prev1781048: Node;                                                                             
 var node: Node;                                                                                    
 var this1781067: Node;                                                                             
 var $recorded.state1781053_bottom: int;                                                            
 var next1781053: Node;                                                                             
 var moverPath1781048: MoverPath;                                                                   
 var Node.next1781048: [Node]Node;                                                                  
 var node1781064: Node;                                                                             
 var $recorded.state1781067: int;                                                                   
 var this1781053: Node;                                                                             
 var $recorded.state1781051_post: int;                                                              
 var next1781048: Node;                                                                             
 var curr1781064: Node;                                                                             
 var item1781064: int;                                                                              
 var mover1781064: Mover;                                                                           
 var mover1781034: Mover;                                                                           
 var node1781067: Node;                                                                             
 var Node._state1781051: [Node]State;                                                               
 var $pc1781048: Phase;                                                                             
 var Node.next1781064: [Node]Node;                                                                  
 var Node.next1781053_bottom: [Node]Node;                                                           
 var next1781053_bottom: Node;                                                                      
 var Node.item1781048: [Node]int;                                                                   
 var prev1781051_post: Node;                                                                        
 var path1781048: int;                                                                              
 var item1781051_post: int;                                                                         
 var this1781048: Node;                                                                             
 var $pc1781064: Phase;                                                                             
 var prev: Node;                                                                                    
 var curr1781051: Node;                                                                             
 var tid1781061: Tid;                                                                               
 var node1781061: Node;                                                                             
 var next1781064: Node;                                                                             
 var next1781051_post: Node;                                                                        
 var Node.item1781051: [Node]int;                                                                   
 var curr: Node;                                                                                    
 var moverPath1781064: MoverPath;                                                                   
 var Node._lock1781034: [Node]Tid;                                                                  
 var item1781048: int;                                                                              
 var $pc1781051: Phase;                                                                             
 var Node.item1781034: [Node]int;                                                                   
 var Node.next1781034: [Node]Node;                                                                  
 var Node.item1781067: [Node]int;                                                                   
 var this1781053_bottom: Node;                                                                      
 var $pc1781067: Phase;                                                                             
 var this1781051_post: Node;                                                                        
 var tid1781051: Tid;                                                                               
 var Node._lock1781061: [Node]Tid;                                                                  
 var item1781034: int;                                                                              
 var curr1781053: Node;                                                                             
 var curr1781061: Node;                                                                             
 var item1781061: int;                                                                              
 var $recorded.state1781053: int;                                                                   
 var phase1781053: Phase;                                                                           
 var Node.next1781051: [Node]Node;                                                                  
 var tid1781053: Tid;                                                                               
 var item1781051: int;                                                                              
 var prev1781051: Node;                                                                             
 var Node._state1781067: [Node]State;                                                               
 var Node._state1781061: [Node]State;                                                               
 var this1781034: Node;                                                                             
 var $recorded.state1781061: int;                                                                   
 var $recorded.state1781034: int;                                                                   
 var next1781034: Node;                                                                             
 var Node._lock1781053_bottom: [Node]Tid;                                                           
 var Node._state1781034: [Node]State;                                                               
 var $pc1781034: Phase;                                                                             
 var tid1781053_bottom: Tid;                                                                        
 var Node._state1781053: [Node]State;                                                               
 var next1781067: Node;                                                                             
 var mover1781061: Mover;                                                                           
 var Node._lock1781051: [Node]Tid;                                                                  
 var Node.item1781061: [Node]int;                                                                   
 var Node._state1781051_post: [Node]State;                                                          
 var curr1781048: Node;                                                                             
 var Node.next1781067: [Node]Node;                                                                  
 var tid1781048: Tid;                                                                               
 var Node._lock1781051_post: [Node]Tid;                                                             
 var tid1781051_post: Tid;                                                                          
 var curr1781034: Node;                                                                             
 var Node._state1781053_bottom: [Node]State;                                                        
 var Node._state1781048: [Node]State;                                                               
 var moverPath1781061: MoverPath;                                                                   
 var Node.item1781053_bottom: [Node]int;                                                            
 var tid1781034: Tid;                                                                               
 var Node._lock1781048: [Node]Tid;                                                                  
 var path1781061: int;                                                                              
 var this1781061: Node;                                                                             
 var moverPath1781034: MoverPath;                                                                   
 var curr1781053_bottom: Node;                                                                      
 var Node.next1781053: [Node]Node;                                                                  
 var next1781051: Node;                                                                             
 var item1781067: int;                                                                              
 var Node._lock1781053: [Node]Tid;                                                                  
 var Node._lock1781067: [Node]Tid;                                                                  
 var path1781064: int;                                                                              
 var this1781064: Node;                                                                             
 var item1781053: int;                                                                              
 var Node.next1781061: [Node]Node;                                                                  
 var this1781051: Node;                                                                             
 var $pc1781053_bottom: Phase;                                                                      
 var mover1781048: Mover;                                                                           
 var Node._lock1781064: [Node]Tid;                                                                  
 var Node._state1781064: [Node]State;                                                               
 var tid1781067: Tid;                                                                               
 var Node.next1781051_post: [Node]Node;                                                             
 var next1781061: Node;                                                                             
 var curr1781051_post: Node;                                                                        
 var $pc1781053: Phase;                                                                             
 var $recorded.state1781051: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 12.9: Node curr;                                                                                
                                                                                                    
                                                                                                    
 // 12.21: curr = this;                                                                             
                                                                                                    
 curr := this;                                                                                      
 if ($pc == PreCommit) {                                                                            
  assume curr != Node.null;                                                                         
 } else {                                                                                           
  assert curr != Node.null;                                                                                // (13.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Node._lock[curr] == Tid.null;                                                               
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (13.9): Reduction failure
 Node._lock[curr] := tid;                                                                           
                                                                                                    
 // 14.9: Node next;                                                                                
                                                                                                    
                                                                                                    
 // 14.9: next := curr.next;                                                                        
                                                                                                    
                                                                                                    
 moverPath1781034 := ReadEval.Node.next(tid: Tid,curr: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1781034 := m#moverPath(moverPath1781034);                                                     
 path1781034 := p#moverPath(moverPath1781034);                                                      
 assume Node._state1781034 == Node._state && Node.item1781034 == Node.item && Node.next1781034 == Node.next && Node._lock1781034 == Node._lock && next1781034 == next && curr1781034 == curr && item1781034 == item && this1781034 == this && tid1781034 == tid && $pc1781034 == $pc;
 assume $recorded.state1781034 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume curr != Node.null;                                                                         
 } else {                                                                                           
  assert curr != Node.null;                                                                                // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1781034);                                                              
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 next := Node.next[curr];                                                                           
 assume Node._state1781053 == Node._state && Node.item1781053 == Node.item && Node.next1781053 == Node.next && Node._lock1781053 == Node._lock && next1781053 == next && curr1781053 == curr && item1781053 == item && this1781053 == this && tid1781053 == tid;
 assume $recorded.state1781053 == 1;                                                                
                                                                                                    
 // 15.9: while (next != Node.null)                                                                 
                                                                                                    
 phase1781053 := $pc;                                                                               
 while ((next!=Node.null))                                                                          
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (10.5): Bad tid
  invariant isShared(Node._state[this]);                                                                   // (10.5): this is not global
                                                                                                    
  invariant StateInvariant(Node._state, Node.item, Node.next, Node._lock);                          
  invariant  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (15.9): Object invariant may not hold.
  invariant isShared(Node._state[curr]);                                                            
  invariant ((next==Node.null)||isShared(Node._state[next]));                                       
  invariant (isAccessible(Node._state[curr], tid) && Node._lock[curr] == tid);                      
  invariant (Node.next[curr]==next);                                                                
  invariant (forall _this : Node :: Invariant.Y_Node.item(tid : Tid, _this, Node.item[_this] ,Node._state1781053,Node.item1781053,Node.next1781053,Node._lock1781053));       // (15.9): Loop does not preserve yields_as annotation for field item
  invariant (forall _this : Node :: Invariant.Y_Node.next(tid : Tid, _this, Node.next[_this] ,Node._state1781053,Node.item1781053,Node.next1781053,Node._lock1781053));       // (15.9): Loop does not preserve yields_as annotation for field next
  invariant phase1781053 == $pc;                                                                           // (15.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (15.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume next != Node.null;                                                                        
  } else {                                                                                          
   assert next != Node.null;                                                                               // (22.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Node._lock[next] == Tid.null;                                                              
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (22.13): Reduction failure
  Node._lock[next] := tid;                                                                          
                                                                                                    
  // 23.13: Node prev;                                                                              
                                                                                                    
                                                                                                    
  // 23.25: prev = curr;                                                                            
                                                                                                    
  prev := curr;                                                                                     
                                                                                                    
  // 24.20: curr = next;                                                                            
                                                                                                    
  curr := next;                                                                                     
                                                                                                    
  // 25.13: next := curr.next;                                                                      
                                                                                                    
                                                                                                    
  moverPath1781048 := ReadEval.Node.next(tid: Tid,curr: Node,Node._state,Node.item,Node.next,Node._lock);
  mover1781048 := m#moverPath(moverPath1781048);                                                    
  path1781048 := p#moverPath(moverPath1781048);                                                     
  assume Node._state1781048 == Node._state && Node.item1781048 == Node.item && Node.next1781048 == Node.next && Node._lock1781048 == Node._lock && prev1781048 == prev && next1781048 == next && curr1781048 == curr && item1781048 == item && this1781048 == this && tid1781048 == tid && $pc1781048 == $pc;
  assume $recorded.state1781048 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume curr != Node.null;                                                                        
  } else {                                                                                          
   assert curr != Node.null;                                                                               // (25.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1781048);                                                             
  assert $pc != PhaseError;                                                                                // (25.13): Reduction failure
  next := Node.next[curr];                                                                          
  if ($pc == PreCommit) {                                                                           
   assume prev != Node.null;                                                                        
  } else {                                                                                          
   assert prev != Node.null;                                                                               // (26.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Node._lock[prev] == tid;                                                                          // (26.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (26.13): Reduction failure
  Node._lock[prev] := Tid.null;                                                                     
                                                                                                    
  // 27.13: yield;                                                                                  
                                                                                                    
  assume Node._state1781051 == Node._state && Node.item1781051 == Node.item && Node.next1781051 == Node.next && Node._lock1781051 == Node._lock && prev1781051 == prev && next1781051 == next && curr1781051 == curr && item1781051 == item && this1781051 == this && tid1781051 == tid;
  assume $recorded.state1781051 == 1;                                                               
  assert  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (27.13): Object invariant may not hold.
  call Yield(tid);                                                                                  
  assume  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (27.13): Object invariant may not hold.
  $pc := PreCommit;                                                                                 
  assume Node._state1781051_post == Node._state && Node.item1781051_post == Node.item && Node.next1781051_post == Node.next && Node._lock1781051_post == Node._lock && prev1781051_post == prev && next1781051_post == next && curr1781051_post == curr && item1781051_post == item && this1781051_post == this && tid1781051_post == tid;
  assume $recorded.state1781051_post == 1;                                                          
  assume Node._state1781053_bottom == Node._state && Node.item1781053_bottom == Node.item && Node.next1781053_bottom == Node.next && Node._lock1781053_bottom == Node._lock && next1781053_bottom == next && curr1781053_bottom == curr && item1781053_bottom == item && this1781053_bottom == this && tid1781053_bottom == tid;
  assume $recorded.state1781053_bottom == 1;                                                        
  assert phase1781053 == $pc;                                                                              // (15.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 32.9: Node node;                                                                                
                                                                                                    
                                                                                                    
 // 32.9: node = new Node();                                                                        
                                                                                                    
 havoc node;                                                                                        
 assume node != Node.null && isFresh(Node._state[node]);                                            
 Node._state[node] := LOCAL(tid);                                                                   
 assume Node.item[node]  == 0;                                                                      
 assume Node.next[node]  == Node.null;                                                              
 assume Node._lock[node]  == Tid.null;                                                              
                                                                                                    
                                                                                                    
 // 33.9: node.item := item;                                                                        
                                                                                                    
                                                                                                    
 moverPath1781061 := WriteEval.Node.item(tid: Tid,node: Node,item: int,Node._state,Node.item,Node.next,Node._lock);
 mover1781061 := m#moverPath(moverPath1781061);                                                     
 path1781061 := p#moverPath(moverPath1781061);                                                      
 assume Node._state1781061 == Node._state && Node.item1781061 == Node.item && Node.next1781061 == Node.next && Node._lock1781061 == Node._lock && node1781061 == node && next1781061 == next && curr1781061 == curr && item1781061 == item && this1781061 == this && tid1781061 == tid && $pc1781061 == $pc;
 assume $recorded.state1781061 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume node != Node.null;                                                                         
 } else {                                                                                           
  assert node != Node.null;                                                                                // (33.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1781061);                                                              
 assert $pc != PhaseError;                                                                                 // (33.9): Reduction failure
 Node.item[node] := item;                                                                           
                                                                                                    
                                                                                                    
 // 34.9: curr.next := node;                                                                        
                                                                                                    
                                                                                                    
 moverPath1781064 := WriteEval.Node.next(tid: Tid,curr: Node,node: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1781064 := m#moverPath(moverPath1781064);                                                     
 path1781064 := p#moverPath(moverPath1781064);                                                      
 assume Node._state1781064 == Node._state && Node.item1781064 == Node.item && Node.next1781064 == Node.next && Node._lock1781064 == Node._lock && node1781064 == node && next1781064 == next && curr1781064 == curr && item1781064 == item && this1781064 == this && tid1781064 == tid && $pc1781064 == $pc;
 assume $recorded.state1781064 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume curr != Node.null;                                                                         
 } else {                                                                                           
  assert curr != Node.null;                                                                                // (34.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1781064);                                                              
 assert $pc != PhaseError;                                                                                 // (34.9): Reduction failure
 Node.next[curr] := node;                                                                           
 if (isLocal(Node._state[node], tid)) {                                                             
  Node._state[node] := SHARED();                                                                    
  assert isSharedAssignable(Node._state[Node.next[node]]);                                                 // (34.9): node became shared, but node.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume curr != Node.null;                                                                         
 } else {                                                                                           
  assert curr != Node.null;                                                                                // (35.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Node._lock[curr] == tid;                                                                           // (35.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (35.9): Reduction failure
 Node._lock[curr] := Tid.null;                                                                      
                                                                                                    
 // 10.34: // return;                                                                               
                                                                                                    
 assume Node._state1781067 == Node._state && Node.item1781067 == Node.item && Node.next1781067 == Node.next && Node._lock1781067 == Node._lock && node1781067 == node && next1781067 == next && curr1781067 == curr && item1781067 == item && this1781067 == this && tid1781067 == tid;
 assume $recorded.state1781067 == 1;                                                                
 assert  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (10.34): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  (forall _i: Node ::  (isShared(Node._state[_i]) ==> isSharedAssignable(Node._state[Node.next[_i]]))) &&
  (forall _i: Node ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Node._state[_i],_t) ==> isLocalAssignable(Node._state[Node.next[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Node.item failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)             
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Node.item failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                 
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                  
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Node.item[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Node.next[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : int;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : int;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _readByTPost : MoverPath;                                                                      
 var _readByTPost_Mover : Mover;                                                                    
 var _readByTPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var _readByUPost : MoverPath;                                                                      
 var _readByUPost_Mover : Mover;                                                                    
 var _readByUPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : int;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : int;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _readByTPost : MoverPath;                                                                      
 var _readByTPost_Mover : Mover;                                                                    
 var _readByTPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var _readByUPost : MoverPath;                                                                      
 var _readByUPost_Mover : Mover;                                                                    
 var _readByUPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _readByTPost : MoverPath;                                                                      
 var _readByTPost_Mover : Mover;                                                                    
 var _readByTPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var _readByUPost : MoverPath;                                                                      
 var _readByUPost_Mover : Mover;                                                                    
 var _readByUPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUPost : MoverPath;                                                                     
 var _writeByUPost_Mover : Mover;                                                                   
 var _writeByUPost_Path : int;                                                                      
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _readByTPost : MoverPath;                                                                      
 var _readByTPost_Mover : Mover;                                                                    
 var _readByTPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var _readByUPost : MoverPath;                                                                      
 var _readByUPost_Mover : Mover;                                                                    
 var _readByUPost_Path : int;                                                                       
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                             
requires ValidTid(tid);                                                                             
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (<undefined position>): Object invariant may not hold.
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock);                              
ensures Y(tid , old(Node._state), old(Node.item), old(Node.next), old(Node._lock) , Node._state, Node.item, Node.next, Node._lock);
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Node.item:                                                                                       
                                                                                                    
function {:inline} Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.item(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock)), _R)) ==> (Node.item[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.item(u: Tid,this: Node,newValue: int,Node._state,Node.item,Node.next,Node._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);           
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, Node.item[this] , Node._state, Node.item, Node.next, Node._lock);    
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Transitive(tid : Tid, this: Node, newValue : int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p);                    
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (4.14): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var newValue_pre: int;                                                                              
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);
 assume Y_Node.item(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);   
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);           
}                                                                                                   
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock)), _R)) ==> (Node.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.item,Node.next,Node._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);           
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.item, Node.next, Node._lock);    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p);                    
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (5.15): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);   
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);           
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var newValue_yield: Tid;                                                                            
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.item,Node.next,Node._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock)), _N);
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);          
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.item, Node.next, Node._lock);  
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                            
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p);                    
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1780836(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var newValue_pre: Tid;                                                                              
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p);  
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock);          
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.item(tid : Tid, this, Node.item_p[this] , Node._state, Node.item, Node.next, Node._lock))
 && (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.item, Node.next, Node._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.item, Node.next, Node._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 546.1-880.2: (Method:10.5)
// 554.1-554.24: (10.5): Bad tid
// 555.1-555.38: (10.5): this is not global
// 558.1-558.199: (10.5): Object invariant may not hold.
// 561.1-561.198: (10.5): Object invariant may not hold.
// 690.2-692.2: (class anchor.sink.VarDeclStmt:12.9)
// 693.2-696.15: (class anchor.sink.Assign:12.21)
// 700.1-700.28: (13.9): Cannot have potential null deference in left-mover part.
// 704.1-704.27: (13.9): Reduction failure
// 706.2-708.2: (class anchor.sink.VarDeclStmt:14.9)
// 709.2-726.26: (class anchor.sink.Read:14.9)
// 721.1-721.28: (14.9): Cannot have potential null deference in left-mover part.
// 725.1-725.27: (14.9): Reduction failure
// 729.2-733.27: (class anchor.sink.While:15.9)
// 735.1-735.27: (10.5): Bad tid
// 736.1-736.41: (10.5): this is not global
// 739.1-739.202: (15.9): Object invariant may not hold.
// 739.202-740.41: (15.9): invariant isShared(curr) may not hold
// 740.41-741.62: (15.9): invariant next == Node.null || isShared(next) may not hold
// 741.62-742.79: (15.9): invariant holds(curr, tid) may not hold
// 742.79-743.37: (15.9): invariant curr.next == next may not hold
// 744.1-744.168: (15.9): Loop does not preserve yields_as annotation for field item
// 745.1-745.168: (15.9): Loop does not preserve yields_as annotation for field next
// 746.1-746.33: (15.9): Phase must be invariant at loop head
// 747.1-747.30: (15.9): Potentially infinite loop cannot be in post-commit phase.
// 752.1-752.29: (22.13): Cannot have potential null deference in left-mover part.
// 756.1-756.28: (22.13): Reduction failure
// 758.3-760.3: (class anchor.sink.VarDeclStmt:23.13)
// 761.3-764.16: (class anchor.sink.Assign:23.25)
// 765.3-768.16: (class anchor.sink.Assign:24.20)
// 769.3-786.27: (class anchor.sink.Read:25.13)
// 781.1-781.29: (25.13): Cannot have potential null deference in left-mover part.
// 785.1-785.28: (25.13): Reduction failure
// 790.1-790.29: (26.13): Cannot have potential null deference in left-mover part.
// 792.1-792.34: (26.13): lock not held
// 794.1-794.28: (26.13): Reduction failure
// 796.3-806.43: (class anchor.sink.Yield:27.13)
// 801.1-801.199: (27.13): Object invariant may not hold.
// 803.1-803.199: (27.13): Object invariant may not hold.
// 809.1-809.30: (15.9): Phase must be invariant at loop head
// 811.2-813.2: (class anchor.sink.VarDeclStmt:32.9)
// 814.2-822.39: (class anchor.sink.Alloc:32.9)
// 824.2-840.26: (class anchor.sink.Write:33.9)
// 836.1-836.28: (33.9): Cannot have potential null deference in left-mover part.
// 839.1-839.27: (33.9): Reduction failure
// 842.2-863.2: (class anchor.sink.Write:34.9)
// 854.1-854.28: (34.9): Cannot have potential null deference in left-mover part.
// 857.1-857.27: (34.9): Reduction failure
// 861.1-861.59: (34.9): node became shared, but node.next may not be shared.
// 867.1-867.28: (35.9): Cannot have potential null deference in left-mover part.
// 869.1-869.33: (35.9): lock not held
// 871.1-871.27: (35.9): Reduction failure
// 873.2-879.9: (class anchor.sink.Return:10.34)
// 878.1-878.198: (10.34): Object invariant may not hold.
// 958.1-958.34: (4.5): Node.item failed Write-Write Right-Mover Check
// 1017.1-1017.30: (4.5): Node.item failed Write-Read Right-Mover Check
// 1080.1-1080.34: (4.5): Node.item failed Write-Write Left-Mover Check
// 1140.1-1140.30: (4.5): Node.item failed Write-Read Left-Mover Check
// 1197.1-1197.34: (4.5): Node.item failed Read-Write Right-Mover Check
// 1257.1-1257.34: (4.5): Node.item failed Read-Write Left-Mover Check
// 1316.1-1316.34: (5.5): Node.next failed Write-Write Right-Mover Check
// 1375.1-1375.30: (5.5): Node.next failed Write-Read Right-Mover Check
// 1438.1-1438.34: (5.5): Node.next failed Write-Write Left-Mover Check
// 1498.1-1498.30: (5.5): Node.next failed Write-Read Left-Mover Check
// 1555.1-1555.34: (5.5): Node.next failed Read-Write Right-Mover Check
// 1615.1-1615.34: (5.5): Node.next failed Read-Write Left-Mover Check
// 1686.1-1686.140: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
// 1687.1-1687.101: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
// 1688.1-1688.158: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
// 1784.1-1784.140: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
// 1885.1-1885.144: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
// 1886.1-1886.144: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
// 1957.1-1957.136: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
// 1958.1-1958.136: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
// 1959.1-1959.146: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
// 2029.1-2029.136: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
// 2030.1-2030.136: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
// 2031.1-2031.99: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
// 2103.1-2103.140: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
// 2104.1-2104.101: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
// 2105.1-2105.158: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
// 2201.1-2201.140: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
// 2302.1-2302.144: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
// 2303.1-2303.144: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
// 2374.1-2374.136: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
// 2375.1-2375.136: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
// 2376.1-2376.146: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
// 2446.1-2446.136: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
// 2447.1-2447.136: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
// 2448.1-2448.99: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
// 2520.1-2520.140: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
// 2521.1-2521.101: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
// 2522.1-2522.158: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
// 2618.1-2618.140: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
// 2719.1-2719.144: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
// 2720.1-2720.144: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
// 2791.1-2791.136: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
// 2792.1-2792.136: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
// 2793.1-2793.146: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
// 2863.1-2863.136: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
// 2864.1-2864.136: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
// 2865.1-2865.99: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
// 2937.1-2937.140: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 2938.1-2938.101: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 2939.1-2939.158: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 3035.1-3035.140: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 3136.1-3136.144: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 3137.1-3137.144: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 3208.1-3208.136: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 3209.1-3209.136: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 3210.1-3210.146: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 3280.1-3280.136: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 3281.1-3281.136: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 3282.1-3282.99: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 3289.1-3289.199: (<undefined position>): Object invariant may not hold.
// 3296.1-3296.198: (<undefined position>): Object invariant may not hold.
// 3316.1-3336.2: (4.5): yields_as clause for Node.item is not valid
// 3341.1-3356.2: (4.5): yields_as clause for Node.item is not reflexive
// 3362.1-3362.199: (4.14): Object invariant may not hold.
// 3363.1-3393.2: (4.5): yields_as clause for Node.item is not transitive
// 3412.1-3432.2: (5.5): yields_as clause for Node.next is not valid
// 3437.1-3452.2: (5.5): yields_as clause for Node.next is not reflexive
// 3458.1-3458.199: (5.15): Object invariant may not hold.
// 3459.1-3489.2: (5.5): yields_as clause for Node.next is not transitive
// 3509.1-3529.2: (7.32): yields_as clause for Node._lock is not valid
// 3534.1-3549.2: (7.32): yields_as clause for Node._lock is not reflexive
// 3555.1-3555.199: (2.1): Object invariant may not hold.
// 3556.1-3586.2: (7.32): yields_as clause for Node._lock is not transitive
