                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/constructor-invariant.anchor:           
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
      invariant  this.next != Node.null ==> this.item <= this.next.item;                            
                                                                                                    
      requires this.next == Node.null;                                                              
      requires next != Node.null ==> item <= next.item;                                             
                                                                                                    
      public void init(int item,Node next) {                                                        
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          boolean tmp1;                                                                             
          boolean tmp2;                                                                             
          Node tmp3;                                                                                
          tmp3 := this.next;                                                                        
          tmp2 = tmp3 != Node.null;                                                                 
          boolean tmp4;                                                                             
          int tmp5;                                                                                 
          tmp5 := this.item;                                                                        
          int tmp6;                                                                                 
          Node tmp7;                                                                                
          tmp7 := this.next;                                                                        
          tmp6 := tmp7.item;                                                                        
          tmp4 = tmp5 <= tmp6;                                                                      
          tmp1 = tmp2 ==> tmp4;                                                                     
          assert tmp1 /* == this.next != Node.null ==> this.item <= this.next.item */;              
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.next != Node.null ==> this.item <= this.next.item;                            
                                                                                                    
      requires this.next == Node.null;                                                              
      requires next != Node.null ==> item <= next.item;                                             
                                                                                                    
      public void init(int item,Node next) {                                                        
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          boolean tmp1;                                                                             
          boolean tmp2;                                                                             
          Node tmp3;                                                                                
          tmp3 := this.next;                                                                        
          tmp2 = tmp3 != Node.null;                                                                 
          boolean tmp4;                                                                             
          int tmp5;                                                                                 
          tmp5 := this.item;                                                                        
          int tmp6;                                                                                 
          Node tmp7;                                                                                
          tmp7 := this.next;                                                                        
          tmp6 := tmp7.item;                                                                        
          tmp4 = tmp5 <= tmp6;                                                                      
          tmp1 = tmp2 ==> tmp4;                                                                     
          assert tmp1 /* == this.next != Node.null ==> this.item <= this.next.item */;              
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.next != Node.null ==> this.item <= this.next.item;                            
                                                                                                    
      requires this.next == Node.null;                                                              
      requires next != Node.null ==> item <= next.item;                                             
                                                                                                    
      public void init(int item,Node next) {                                                        
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          boolean tmp1;                                                                             
          boolean tmp2;                                                                             
          Node tmp3;                                                                                
          tmp3 := this.next;                                                                        
          tmp2 = tmp3 != Node.null;                                                                 
          boolean tmp4;                                                                             
          int tmp5;                                                                                 
          tmp5 := this.item;                                                                        
          int tmp6;                                                                                 
          Node tmp7;                                                                                
          tmp7 := this.next;                                                                        
          tmp6 := tmp7.item;                                                                        
          tmp4 = tmp5 <= tmp6;                                                                      
          tmp1 = tmp2 ==> tmp4;                                                                     
          assert tmp1 /* == this.next != Node.null ==> this.item <= this.next.item */;              
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? B                                                                                          
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.next != Node.null ==> this.item <= this.next.item;                            
                                                                                                    
      requires this.next == Node.null;                                                              
      requires next != Node.null ==> item <= next.item;                                             
                                                                                                    
      public void init(int item,Node next) {                                                        
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          boolean tmp1;                                                                             
          boolean tmp2;                                                                             
          Node tmp3;                                                                                
          tmp3 := this.next;                                                                        
          tmp2 = tmp3 != Node.null;                                                                 
          boolean tmp4;                                                                             
          int tmp5;                                                                                 
          tmp5 := this.item;                                                                        
          int tmp6;                                                                                 
          Node tmp7;                                                                                
          tmp7 := this.next;                                                                        
          tmp6 := tmp7.item;                                                                        
          tmp4 = tmp5 <= tmp6;                                                                      
          tmp1 = tmp2 ==> tmp4;                                                                     
          assert tmp1 /* == this.next != Node.null ==> this.item <= this.next.item */;              
          {                                                                                         
            // return;                                                                              
          }                                                                                         
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
  moverPath(_B, 1)                                                                                  
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
  moverPath(_B, 1)                                                                                  
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
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
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
                                                                                                    
function {:inline} Invariant.Node.1045916(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (bool) {
 ((Node.next[this]!=Node.null)==>(Node.item[this]<=Node.item[Node.next[this]]))                     
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Node.init(tid:Tid, this : Node, item : int, next : Node)                                 
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isSharedAssignable(Node._state[next]);                                                            // (7.5): Parameter VarDecl(ClassType(Node),next) is not global
requires isLocal(Node._state[this], tid);                                                           
requires (forall _x : Node :: this != _x ==> !isLocal(Node._state[_x], tid));                       
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                             
requires (Node.next[this]==Node.null);                                                              
                                                                                                    
requires ((next!=Node.null)==>(item<=Node.item[next]));                                             
                                                                                                    
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && _this != this ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (7.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock);                              
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (7.5): Object invariant may not hold.
{                                                                                                   
 var tmp3: Node;                                                                                    
 var Node._state1051567: [Node]State;                                                               
 var tmp21051570: bool;                                                                             
 var next1051526: Node;                                                                             
 var path1051570: int;                                                                              
 var Node.item1051529: [Node]int;                                                                   
 var $recorded.state1051558: int;                                                                   
 var $recorded.state1051541: int;                                                                   
 var tmp21051541: bool;                                                                             
 var tmp71051567: Node;                                                                             
 var moverPath1051558: MoverPath;                                                                   
 var tmp51051567: int;                                                                              
 var item1051567: int;                                                                              
 var path1051529: int;                                                                              
 var tmp11051558: bool;                                                                             
 var path1051541: int;                                                                              
 var tmp5: int;                                                                                     
 var item1051602: int;                                                                              
 var $pc1051602: Phase;                                                                             
 var $recorded.state1051602: int;                                                                   
 var Node._state1051526: [Node]State;                                                               
 var path1051558: int;                                                                              
 var tmp71051601: Node;                                                                             
 var Node._lock1051541: [Node]Tid;                                                                  
 var mover1051570: Mover;                                                                           
 var Node.item1051526: [Node]int;                                                                   
 var $recorded.state1051529: int;                                                                   
 var Node.item1051570: [Node]int;                                                                   
 var tmp7: Node;                                                                                    
 var tid1051602: Tid;                                                                               
 var path1051526: int;                                                                              
 var Node.next1051529: [Node]Node;                                                                  
 var tmp11051541: bool;                                                                             
 var tmp1: bool;                                                                                    
 var moverPath1051567: MoverPath;                                                                   
 var tmp51051570: int;                                                                              
 var $recorded.state1051601: int;                                                                   
 var mover1051541: Mover;                                                                           
 var Node._state1051570: [Node]State;                                                               
 var tmp61051570: int;                                                                              
 var Node.next1051601: [Node]Node;                                                                  
 var next1051567: Node;                                                                             
 var tmp11051601: bool;                                                                             
 var tmp2: bool;                                                                                    
 var tid1051526: Tid;                                                                               
 var tmp31051541: Node;                                                                             
 var $recorded.state1051567: int;                                                                   
 var tmp41051567: bool;                                                                             
 var path1051567: int;                                                                              
 var tmp71051602: Node;                                                                             
 var $pc1051558: Phase;                                                                             
 var $pc1051541: Phase;                                                                             
 var Node.next1051541: [Node]Node;                                                                  
 var next1051541: Node;                                                                             
 var $pc1051526: Phase;                                                                             
 var tmp41051602: bool;                                                                             
 var tid1051529: Tid;                                                                               
 var next1051570: Node;                                                                             
 var Node.item1051558: [Node]int;                                                                   
 var this1051602: Node;                                                                             
 var this1051526: Node;                                                                             
 var Node.next1051558: [Node]Node;                                                                  
 var tmp51051602: int;                                                                              
 var item1051558: int;                                                                              
 var mover1051529: Mover;                                                                           
 var tmp11051570: bool;                                                                             
 var Node._lock1051529: [Node]Tid;                                                                  
 var mover1051567: Mover;                                                                           
 var Node.next1051602: [Node]Node;                                                                  
 var item1051570: int;                                                                              
 var $recorded.state1051526: int;                                                                   
 var tid1051570: Tid;                                                                               
 var Node.next1051526: [Node]Node;                                                                  
 var tmp31051602: Node;                                                                             
 var this1051541: Node;                                                                             
 var Node._state1051541: [Node]State;                                                               
 var this1051529: Node;                                                                             
 var Node.next1051570: [Node]Node;                                                                  
 var tmp41051570: bool;                                                                             
 var mover1051526: Mover;                                                                           
 var tid1051601: Tid;                                                                               
 var next1051558: Node;                                                                             
 var moverPath1051526: MoverPath;                                                                   
 var next1051529: Node;                                                                             
 var this1051601: Node;                                                                             
 var Node._lock1051570: [Node]Tid;                                                                  
 var tmp61051602: int;                                                                              
 var tmp61051567: int;                                                                              
 var Node.item1051602: [Node]int;                                                                   
 var tmp31051570: Node;                                                                             
 var Node.item1051567: [Node]int;                                                                   
 var tmp51051601: int;                                                                              
 var this1051558: Node;                                                                             
 var Node._lock1051602: [Node]Tid;                                                                  
 var tmp61051601: int;                                                                              
 var item1051601: int;                                                                              
 var tmp71051570: Node;                                                                             
 var item1051526: int;                                                                              
 var Node._state1051558: [Node]State;                                                               
 var next1051601: Node;                                                                             
 var $pc1051601: Phase;                                                                             
 var Node._lock1051601: [Node]Tid;                                                                  
 var Node._lock1051558: [Node]Tid;                                                                  
 var tmp31051601: Node;                                                                             
 var moverPath1051570: MoverPath;                                                                   
 var tmp11051602: bool;                                                                             
 var Node._state1051601: [Node]State;                                                               
 var mover1051558: Mover;                                                                           
 var next1051602: Node;                                                                             
 var tmp4: bool;                                                                                    
 var this1051570: Node;                                                                             
 var $recorded.state1051570: int;                                                                   
 var tmp41051601: bool;                                                                             
 var tmp21051601: bool;                                                                             
 var Node._lock1051526: [Node]Tid;                                                                  
 var tmp21051602: bool;                                                                             
 var tid1051567: Tid;                                                                               
 var Node._state1051602: [Node]State;                                                               
 var item1051541: int;                                                                              
 var $pc1051570: Phase;                                                                             
 var tid1051541: Tid;                                                                               
 var Node.item1051541: [Node]int;                                                                   
 var Node.next1051567: [Node]Node;                                                                  
 var item1051529: int;                                                                              
 var tmp21051558: bool;                                                                             
 var tid1051558: Tid;                                                                               
 var moverPath1051529: MoverPath;                                                                   
 var Node._state1051529: [Node]State;                                                               
 var this1051567: Node;                                                                             
 var tmp31051567: Node;                                                                             
 var tmp21051567: bool;                                                                             
 var tmp31051558: Node;                                                                             
 var tmp11051567: bool;                                                                             
 var Node._lock1051567: [Node]Tid;                                                                  
 var $pc1051567: Phase;                                                                             
 var tmp51051558: int;                                                                              
 var Node.item1051601: [Node]int;                                                                   
 var $pc1051529: Phase;                                                                             
 var tmp6: int;                                                                                     
 var moverPath1051541: MoverPath;                                                                   
 var tmp41051558: bool;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock)),_R);       // (7.5): Can only have right-mover memory accesses in requires clause
 assert true && leq(m#moverPath(ReadEval.Node.item(tid: Tid,next: Node,Node._state,Node.item,Node.next,Node._lock)),_R);       // (7.27): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 7.5: assume this.item == 0;                                                                     
                                                                                                    
 assume (Node.item[this]==0);                                                                       
                                                                                                    
 // 7.5: assume this.next == Node.null;                                                             
                                                                                                    
 assume (Node.next[this]==Node.null);                                                               
                                                                                                    
                                                                                                    
 // 9.9: this.item := item;                                                                         
                                                                                                    
                                                                                                    
 moverPath1051526 := WriteEval.Node.item(tid: Tid,this: Node,item: int,Node._state,Node.item,Node.next,Node._lock);
 mover1051526 := m#moverPath(moverPath1051526);                                                     
 path1051526 := p#moverPath(moverPath1051526);                                                      
 assume Node._state1051526 == Node._state && Node.item1051526 == Node.item && Node.next1051526 == Node.next && Node._lock1051526 == Node._lock && item1051526 == item && next1051526 == next && this1051526 == this && tid1051526 == tid && $pc1051526 == $pc;
 assume $recorded.state1051526 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1051526);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 Node.item[this] := item;                                                                           
                                                                                                    
                                                                                                    
 // 10.9: this.next := next;                                                                        
                                                                                                    
                                                                                                    
 moverPath1051529 := WriteEval.Node.next(tid: Tid,this: Node,next: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1051529 := m#moverPath(moverPath1051529);                                                     
 path1051529 := p#moverPath(moverPath1051529);                                                      
 assume Node._state1051529 == Node._state && Node.item1051529 == Node.item && Node.next1051529 == Node.next && Node._lock1051529 == Node._lock && item1051529 == item && next1051529 == next && this1051529 == this && tid1051529 == tid && $pc1051529 == $pc;
 assume $recorded.state1051529 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (10.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1051529);                                                              
 assert $pc != PhaseError;                                                                                 // (10.9): Reduction failure
 Node.next[this] := next;                                                                           
 if (isLocal(Node._state[next], tid)) {                                                             
  Node._state[next] := SHARED();                                                                    
  assert isSharedAssignable(Node._state[Node.next[next]]);                                                 // (10.9): next became shared, but next.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 11.9: boolean tmp1;                                                                             
                                                                                                    
                                                                                                    
 // 11.9: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 11.9: Node tmp3;                                                                                
                                                                                                    
                                                                                                    
 // 11.9: tmp3 := this.next;                                                                        
                                                                                                    
                                                                                                    
 moverPath1051541 := ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1051541 := m#moverPath(moverPath1051541);                                                     
 path1051541 := p#moverPath(moverPath1051541);                                                      
 assume Node._state1051541 == Node._state && Node.item1051541 == Node.item && Node.next1051541 == Node.next && Node._lock1051541 == Node._lock && tmp31051541 == tmp3 && tmp21051541 == tmp2 && tmp11051541 == tmp1 && item1051541 == item && next1051541 == next && this1051541 == this && tid1051541 == tid && $pc1051541 == $pc;
 assume $recorded.state1051541 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1051541);                                                              
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 tmp3 := Node.next[this];                                                                           
                                                                                                    
 // 11.9: tmp2 = tmp3 != Node.null;                                                                 
                                                                                                    
 tmp2 := (tmp3!=Node.null);                                                                         
                                                                                                    
 // 11.9: boolean tmp4;                                                                             
                                                                                                    
                                                                                                    
 // 11.9: int tmp5;                                                                                 
                                                                                                    
                                                                                                    
 // 11.9: tmp5 := this.item;                                                                        
                                                                                                    
                                                                                                    
 moverPath1051558 := ReadEval.Node.item(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1051558 := m#moverPath(moverPath1051558);                                                     
 path1051558 := p#moverPath(moverPath1051558);                                                      
 assume Node._state1051558 == Node._state && Node.item1051558 == Node.item && Node.next1051558 == Node.next && Node._lock1051558 == Node._lock && tmp51051558 == tmp5 && tmp41051558 == tmp4 && tmp31051558 == tmp3 && tmp21051558 == tmp2 && tmp11051558 == tmp1 && item1051558 == item && next1051558 == next && this1051558 == this && tid1051558 == tid && $pc1051558 == $pc;
 assume $recorded.state1051558 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1051558);                                                              
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 tmp5 := Node.item[this];                                                                           
                                                                                                    
 // 11.9: int tmp6;                                                                                 
                                                                                                    
                                                                                                    
 // 11.9: Node tmp7;                                                                                
                                                                                                    
                                                                                                    
 // 11.9: tmp7 := this.next;                                                                        
                                                                                                    
                                                                                                    
 moverPath1051567 := ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1051567 := m#moverPath(moverPath1051567);                                                     
 path1051567 := p#moverPath(moverPath1051567);                                                      
 assume Node._state1051567 == Node._state && Node.item1051567 == Node.item && Node.next1051567 == Node.next && Node._lock1051567 == Node._lock && tmp71051567 == tmp7 && tmp61051567 == tmp6 && tmp51051567 == tmp5 && tmp41051567 == tmp4 && tmp31051567 == tmp3 && tmp21051567 == tmp2 && tmp11051567 == tmp1 && item1051567 == item && next1051567 == next && this1051567 == this && tid1051567 == tid && $pc1051567 == $pc;
 assume $recorded.state1051567 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1051567);                                                              
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 tmp7 := Node.next[this];                                                                           
                                                                                                    
 // 11.9: tmp6 := tmp7.item;                                                                        
                                                                                                    
                                                                                                    
 moverPath1051570 := ReadEval.Node.item(tid: Tid,tmp7: Node,Node._state,Node.item,Node.next,Node._lock);
 mover1051570 := m#moverPath(moverPath1051570);                                                     
 path1051570 := p#moverPath(moverPath1051570);                                                      
 assume Node._state1051570 == Node._state && Node.item1051570 == Node.item && Node.next1051570 == Node.next && Node._lock1051570 == Node._lock && tmp71051570 == tmp7 && tmp61051570 == tmp6 && tmp51051570 == tmp5 && tmp41051570 == tmp4 && tmp31051570 == tmp3 && tmp21051570 == tmp2 && tmp11051570 == tmp1 && item1051570 == item && next1051570 == next && this1051570 == this && tid1051570 == tid && $pc1051570 == $pc;
 assume $recorded.state1051570 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp7 != Node.null;                                                                         
 } else {                                                                                           
  assert tmp7 != Node.null;                                                                                // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1051570);                                                              
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 tmp6 := Node.item[tmp7];                                                                           
                                                                                                    
 // 11.9: tmp4 = tmp5 <= tmp6;                                                                      
                                                                                                    
 tmp4 := (tmp5<=tmp6);                                                                              
                                                                                                    
 // 11.9: tmp1 = tmp2 ==> tmp4;                                                                     
                                                                                                    
 tmp1 := (tmp2==>tmp4);                                                                             
                                                                                                    
 // 11.9: assert tmp1 /* == this.next != Node.null ==> this.item <= this.next.item */;              
                                                                                                    
 assume Node._state1051601 == Node._state && Node.item1051601 == Node.item && Node.next1051601 == Node.next && Node._lock1051601 == Node._lock && tmp71051601 == tmp7 && tmp61051601 == tmp6 && tmp51051601 == tmp5 && tmp41051601 == tmp4 && tmp31051601 == tmp3 && tmp21051601 == tmp2 && tmp11051601 == tmp1 && item1051601 == item && next1051601 == next && this1051601 == this && tid1051601 == tid;
 assume $recorded.state1051601 == 1;                                                                
 assert tmp1 /* lowered ((Node.next[this]!=Node.null)==>(Node.item[this]<=Node.item[Node.next[this]])) */;       // (11.9): This assertion may not hold.
                                                                                                    
 // 8.38: // return;                                                                                
                                                                                                    
 assume Node._state1051602 == Node._state && Node.item1051602 == Node.item && Node.next1051602 == Node.next && Node._lock1051602 == Node._lock && tmp71051602 == tmp7 && tmp61051602 == tmp6 && tmp51051602 == tmp5 && tmp41051602 == tmp4 && tmp31051602 == tmp3 && tmp21051602 == tmp2 && tmp11051602 == tmp1 && item1051602 == item && next1051602 == next && this1051602 == this && tid1051602 == tid;
 assume $recorded.state1051602 == 1;                                                                
 assert  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (8.38): Object invariant may not hold.
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
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.item failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.item failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Read-Write Left-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Left-Mover Check
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock);                             
requires ValidTid(tid);                                                                             
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (<undefined position>): Object invariant may not hold.
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock);                              
ensures Y(tid , old(Node._state), old(Node.item), old(Node.next), old(Node._lock) , Node._state, Node.item, Node.next, Node._lock);
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (2.24): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (3.24): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.1045916(tid: Tid,_this : Node,Node._state,Node.item,Node.next,Node._lock));       // (1.1): Object invariant may not hold.
                                                                                                    
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
                                                                                                    
                                                                                                    
// 518.1-856.2: (Method:7.5)
// 526.1-526.24: (7.5): Bad tid
// 527.1-527.48: (7.5): Parameter VarDecl(ClassType(Node),next) is not global
// 536.1-536.208: (7.5): Object invariant may not hold.
// 539.1-539.198: (7.5): Object invariant may not hold.
// 686.1-686.121: (7.5): Can only have right-mover memory accesses in requires clause
// 687.1-687.121: (7.27): Can only have right-mover memory accesses in requires clause
// 689.2-692.30: (class anchor.sink.Assume:7.5)
// 693.2-696.38: (class anchor.sink.Assume:7.5)
// 698.2-714.26: (class anchor.sink.Write:9.9)
// 710.1-710.28: (9.9): Cannot have potential null deference in left-mover part.
// 713.1-713.27: (9.9): Reduction failure
// 716.2-737.2: (class anchor.sink.Write:10.9)
// 728.1-728.28: (10.9): Cannot have potential null deference in left-mover part.
// 731.1-731.27: (10.9): Reduction failure
// 735.1-735.59: (10.9): next became shared, but next.next may not be shared.
// 738.2-740.2: (class anchor.sink.VarDeclStmt:11.9)
// 741.2-743.2: (class anchor.sink.VarDeclStmt:11.9)
// 744.2-746.2: (class anchor.sink.VarDeclStmt:11.9)
// 747.2-764.26: (class anchor.sink.Read:11.9)
// 759.1-759.28: (11.9): Cannot have potential null deference in left-mover part.
// 763.1-763.27: (11.9): Reduction failure
// 765.2-768.28: (class anchor.sink.Assign:11.9)
// 769.2-771.2: (class anchor.sink.VarDeclStmt:11.9)
// 772.2-774.2: (class anchor.sink.VarDeclStmt:11.9)
// 775.2-792.26: (class anchor.sink.Read:11.9)
// 787.1-787.28: (11.9): Cannot have potential null deference in left-mover part.
// 791.1-791.27: (11.9): Reduction failure
// 793.2-795.2: (class anchor.sink.VarDeclStmt:11.9)
// 796.2-798.2: (class anchor.sink.VarDeclStmt:11.9)
// 799.2-816.26: (class anchor.sink.Read:11.9)
// 811.1-811.28: (11.9): Cannot have potential null deference in left-mover part.
// 815.1-815.27: (11.9): Reduction failure
// 817.2-834.26: (class anchor.sink.Read:11.9)
// 829.1-829.28: (11.9): Cannot have potential null deference in left-mover part.
// 833.1-833.27: (11.9): Reduction failure
// 835.2-838.23: (class anchor.sink.Assign:11.9)
// 839.2-842.24: (class anchor.sink.Assign:11.9)
// 843.2-848.107: (class anchor.sink.Assert:11.9)
// 848.1-848.107: (11.9): This assertion may not hold.
// 849.2-855.9: (class anchor.sink.Return:8.38)
// 854.1-854.198: (8.38): Object invariant may not hold.
// 934.1-934.34: (2.5): Node.item failed Write-Write Right-Mover Check
// 993.1-993.30: (2.5): Node.item failed Write-Read Right-Mover Check
// 1056.1-1056.34: (2.5): Node.item failed Write-Write Left-Mover Check
// 1116.1-1116.30: (2.5): Node.item failed Write-Read Left-Mover Check
// 1173.1-1173.34: (2.5): Node.item failed Read-Write Right-Mover Check
// 1233.1-1233.34: (2.5): Node.item failed Read-Write Left-Mover Check
// 1292.1-1292.34: (3.5): Node.next failed Write-Write Right-Mover Check
// 1351.1-1351.30: (3.5): Node.next failed Write-Read Right-Mover Check
// 1414.1-1414.34: (3.5): Node.next failed Write-Write Left-Mover Check
// 1474.1-1474.30: (3.5): Node.next failed Write-Read Left-Mover Check
// 1531.1-1531.34: (3.5): Node.next failed Read-Write Right-Mover Check
// 1591.1-1591.34: (3.5): Node.next failed Read-Write Left-Mover Check
// 1662.1-1662.140: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
// 1663.1-1663.101: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
// 1664.1-1664.158: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
// 1760.1-1760.140: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
// 1861.1-1861.144: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
// 1862.1-1862.144: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
// 1933.1-1933.136: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
// 1934.1-1934.136: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
// 1935.1-1935.146: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
// 2005.1-2005.136: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
// 2006.1-2006.136: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
// 2007.1-2007.99: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
// 2079.1-2079.140: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
// 2080.1-2080.101: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
// 2081.1-2081.158: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
// 2177.1-2177.140: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
// 2278.1-2278.144: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
// 2279.1-2279.144: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
// 2350.1-2350.136: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
// 2351.1-2351.136: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
// 2352.1-2352.146: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
// 2422.1-2422.136: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
// 2423.1-2423.136: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
// 2424.1-2424.99: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
// 2496.1-2496.140: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
// 2497.1-2497.101: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
// 2498.1-2498.158: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
// 2594.1-2594.140: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
// 2695.1-2695.144: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
// 2696.1-2696.144: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
// 2767.1-2767.136: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
// 2768.1-2768.136: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
// 2769.1-2769.146: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
// 2839.1-2839.136: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
// 2840.1-2840.136: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
// 2841.1-2841.99: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
// 2913.1-2913.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 2914.1-2914.101: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 2915.1-2915.158: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 3011.1-3011.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 3112.1-3112.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 3113.1-3113.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 3184.1-3184.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 3185.1-3185.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 3186.1-3186.146: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 3256.1-3256.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 3257.1-3257.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 3258.1-3258.99: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 3265.1-3265.199: (<undefined position>): Object invariant may not hold.
// 3272.1-3272.198: (<undefined position>): Object invariant may not hold.
// 3292.1-3312.2: (2.5): yields_as clause for Node.item is not valid
// 3317.1-3332.2: (2.5): yields_as clause for Node.item is not reflexive
// 3338.1-3338.199: (2.24): Object invariant may not hold.
// 3339.1-3369.2: (2.5): yields_as clause for Node.item is not transitive
// 3388.1-3408.2: (3.5): yields_as clause for Node.next is not valid
// 3413.1-3428.2: (3.5): yields_as clause for Node.next is not reflexive
// 3434.1-3434.199: (3.24): Object invariant may not hold.
// 3435.1-3465.2: (3.5): yields_as clause for Node.next is not transitive
// 3485.1-3505.2: (7.32): yields_as clause for Node._lock is not valid
// 3510.1-3525.2: (7.32): yields_as clause for Node._lock is not reflexive
// 3531.1-3531.199: (1.1): Object invariant may not hold.
// 3532.1-3562.2: (7.32): yields_as clause for Node._lock is not transitive
