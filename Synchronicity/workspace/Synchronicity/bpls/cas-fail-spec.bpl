                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-fail-spec.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      noABA volatile Node next isRead                                                               
       ? this.next != Node.null ? R : N                                                             
       : this.next == Node.null && newValue != Node.null ? N : E                                    
        yields_as newValue == this.next || newValue != Node.null;                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      noABA volatile Node next isRead                                                               
       ? this.next != Node.null ? R : N                                                             
       : this.next == Node.null && newValue != Node.null ? N : E                                    
        yields_as newValue == this.next || newValue != Node.null;                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      noABA volatile Node next isRead                                                               
       ? this.next != Node.null ? R : N                                                             
       : this.next == Node.null && newValue != Node.null ? N : E                                    
        yields_as newValue == this.next || newValue != Node.null;                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      noABA volatile Node next isRead                                                               
       ? this.next != Node.null ? R : N                                                             
       : this.next == Node.null && newValue != Node.null ? N : E                                    
        yields_as newValue == this.next || newValue != Node.null;                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Node.null;                                                              
        {                                                                                           
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
                                                                                                    
var Node.next: [Node]Node;                                                                          
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isRead) then                                                                                   
  if ((Node.next[this]!=Node.null)) then                                                            
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((Node.next[this]==Node.null)&&(newValue!=Node.null))) then                                   
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((Node.next[this]!=Node.null)) then                                                            
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((Node.next[this]==Node.null)&&(newValue!=Node.null))) then                                   
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (MoverPath) {
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
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid) returns (bool) {
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
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
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
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
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
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);     
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);     
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);     
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);     
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock);         
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock);               
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
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
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock);         
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock);               
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.next, Node._lock);                                        
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
ensures StateInvariant(Node._state, Node.next, Node._lock);                                         
ensures Y(tid , old(Node._state), old(Node.next), old(Node._lock) , Node._state, Node.next, Node._lock);
                                                                                                    
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.next,Node._lock)), _R)) ==> (Node.next[this] == newValue))
 &&(((newValue==Node.next[this])||(newValue!=Node.null)))                                           
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.next,Node._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.next, Node._lock);               
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p);                                 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock , Node._state_p, Node.next_p, Node._lock_p);     
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p);                
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock);                      
}                                                                                                   
                                                                                                    
procedure Check_Node.next.ABAFree(tid : Tid, this: Node, A : Node, B : Node)                        
 modifies Node.next;                                                                                
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires Node.next[this] == A;                                                                     
 requires isAccessible(Node._state[this], tid);                                                     
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var B_pre: Node;                                                                                    
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var A_pre: Node;                                                                                    
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var B_post: Node;                                                                                   
var A_post: Node;                                                                                   
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_Node.next(tid, this, B , Node._state, Node.next, Node._lock);                             
 assume A != B;                                                                                     
Node.next[this] := B;                                                                               
assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_Node.next(tid, this, A , Node._state, Node.next, Node._lock));                          
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var newValue_yield: Tid;                                                                            
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.next,Node._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock)), _N);
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.next, Node._lock);             
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock);                                       
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p);                                 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock , Node._state_p, Node.next_p, Node._lock_p);     
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p);               
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock);                     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.next, Node._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.next, Node._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 475.1-475.34: (3.5): Node.next failed Write-Write Right-Mover Check
// 532.1-532.30: (3.5): Node.next failed Write-Read Right-Mover Check
// 593.1-593.34: (3.5): Node.next failed Write-Write Left-Mover Check
// 651.1-651.30: (3.5): Node.next failed Write-Read Left-Mover Check
// 706.1-706.34: (3.5): Node.next failed Read-Write Right-Mover Check
// 764.1-764.34: (3.5): Node.next failed Read-Write Left-Mover Check
// 833.1-833.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 834.1-834.101: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 835.1-835.158: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 928.1-928.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 1026.1-1026.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 1027.1-1027.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 1096.1-1096.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 1097.1-1097.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 1098.1-1098.146: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 1166.1-1166.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 1167.1-1167.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 1168.1-1168.99: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 1200.1-1219.2: (6.39): yields_as clause for Node.next is not valid
// 1224.1-1238.2: (6.39): yields_as clause for Node.next is not reflexive
// 1244.1-1272.2: (6.39): yields_as clause for Node.next is not transitive
// 1280.1-1310.2: (6.39): Node.next is not ABA-free
// 1330.1-1349.2: (7.32): yields_as clause for Node._lock is not valid
// 1354.1-1368.2: (7.32): yields_as clause for Node._lock is not reflexive
// 1374.1-1402.2: (7.32): yields_as clause for Node._lock is not transitive
