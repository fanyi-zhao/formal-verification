                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stable-1.sink:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class ThreadState {                                                                             
       int sxR isRead                                                                               
       ? !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? B : N                                                                 
         : R                                                                                        
       : !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? N : E                                                                 
         : E                                                                                        
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ThreadState {                                                                             
       int sxR isRead                                                                               
       ? !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? B : N                                                                 
         : R                                                                                        
       : !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? N : E                                                                 
         : E                                                                                        
                                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class ThreadState {                                                                             
       int sxR isRead                                                                               
       ? !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? B : N                                                                 
         : R                                                                                        
       : !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? N : E                                                                 
         : E                                                                                        
                                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ThreadState {                                                                             
       int sxR isRead                                                                               
       ? !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? B : N                                                                 
         : R                                                                                        
       : !(this.sxR == -1)                                                                          
         ? holds(this, tid) ? N : E                                                                 
         : E                                                                                        
                                                                                                    
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
                                                                                                    
                                                                                                    
/*** Class Decl ThreadState ***/                                                                    
                                                                                                    
type ThreadState;                                                                                   
const unique ThreadState.null: ThreadState;                                                         
var ThreadState._state: [ThreadState]State;                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var ThreadState.sxR: [ThreadState]int;                                                              
                                                                                                    
function {:inline} ReadEval.ThreadState.sxR(tid: Tid,this : ThreadState,ThreadState._state: [ThreadState]State,ThreadState.sxR: [ThreadState]int,ThreadState._lock: [ThreadState]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if (!((ThreadState.sxR[this]==-(1)))) then                                                        
   if ((isAccessible(ThreadState._state[this], tid) && ThreadState._lock[this] == tid)) then        
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   moverPath(_R, 1)                                                                                 
 else                                                                                               
  if (!((ThreadState.sxR[this]==-(1)))) then                                                        
   if ((isAccessible(ThreadState._state[this], tid) && ThreadState._lock[this] == tid)) then        
    moverPath(_N, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ThreadState.sxR(tid: Tid,this : ThreadState,newValue: int,ThreadState._state: [ThreadState]State,ThreadState.sxR: [ThreadState]int,ThreadState._lock: [ThreadState]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if (!((ThreadState.sxR[this]==-(1)))) then                                                        
   if ((isAccessible(ThreadState._state[this], tid) && ThreadState._lock[this] == tid)) then        
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   moverPath(_R, 1)                                                                                 
 else                                                                                               
  if (!((ThreadState.sxR[this]==-(1)))) then                                                        
   if ((isAccessible(ThreadState._state[this], tid) && ThreadState._lock[this] == tid)) then        
    moverPath(_N, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ThreadState._lock: [ThreadState]Tid;                                                            
                                                                                                    
function {:inline} ReadEval.ThreadState._lock(tid: Tid,this : ThreadState,ThreadState._state: [ThreadState]State,ThreadState.sxR: [ThreadState]int,ThreadState._lock: [ThreadState]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(ThreadState._state[this], tid)) then                                                   
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ThreadState._lock[this]==tid)) then                                                         
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ThreadState._lock[this]==Tid.null)&&(newValue==tid))) then                                 
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ThreadState._lock[this]==tid)&&(newValue==Tid.null))) then                                
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ThreadState._lock(tid: Tid,this : ThreadState,newValue: Tid,ThreadState._state: [ThreadState]State,ThreadState.sxR: [ThreadState]int,ThreadState._lock: [ThreadState]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ThreadState._state[this], tid)) then                                                   
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ThreadState._lock[this]==tid)) then                                                         
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ThreadState._lock[this]==Tid.null)&&(newValue==tid))) then                                 
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ThreadState._lock[this]==tid)&&(newValue==Tid.null))) then                                
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
                                                                                                    
 function {:inline} StateInvariant(ThreadState._state: [ThreadState]State,ThreadState.sxR: [ThreadState]int,ThreadState._lock: [ThreadState]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: ThreadState  :: _i == ThreadState.null <==> isNull(ThreadState._state[_i])) &&        
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ThreadState.sxR[x] := v;                                                                           
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,x: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): ThreadState.sxR failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ThreadState.sxR[x] := v;                                                                           
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ThreadState.sxR(u: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): ThreadState.sxR failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ThreadState.sxR[x];                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ThreadState.sxR[x] := havocValue;                                                                  
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,x: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): ThreadState.sxR failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ThreadState.sxR[x];                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ThreadState.sxR(u: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): ThreadState.sxR failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)    
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ThreadState.sxR(t: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,x: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): ThreadState.sxR failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, x: ThreadState)     
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[x], u);                                                   
 modifies ThreadState.sxR;                                                                          
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ThreadState.sxR[x];                                                                    
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ThreadState.sxR(t: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ThreadState.sxR[x] := havocValue;                                                                  
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,x: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): ThreadState.sxR failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ThreadState.sxR.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, w0: int, x: ThreadState, y: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[y], u);                                                   
 modifies ThreadState.sxR;                                                                          
 modifies ThreadState.sxR;                                                                          
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: ThreadState;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: ThreadState;                                                                           
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ThreadState.sxR[x] := v;                                                                           
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ThreadState.sxR.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, w0: int, x: ThreadState, y: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[y], u);                                                   
 modifies ThreadState.sxR;                                                                          
 modifies ThreadState.sxR;                                                                          
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: ThreadState;                                                                            
                                                                                                    
 var x_mid: ThreadState;                                                                            
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var ThreadState._lock_mid: [ThreadState]Tid;                                                       
 var $recorded.state_mid: int;                                                                      
 var ThreadState._state_mid: [ThreadState]State;                                                    
 var w_mid: int;                                                                                    
 var ThreadState.sxR_mid: [ThreadState]int;                                                         
 var y_mid: ThreadState;                                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: ThreadState;                                                                           
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ThreadState.sxR[x];                                                                        
 ThreadState.sxR[x] := v;                                                                           
                                                                                                    
 assume ThreadState._state_mid == ThreadState._state && ThreadState.sxR_mid == ThreadState.sxR && ThreadState._lock_mid == ThreadState._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ThreadState.sxR[x] := tmpV;                                                                        
 ThreadState.sxR[y] := w;                                                                           
 _writeByTPost := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ThreadState.sxR.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, w0: int, x: ThreadState, y: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[y], u);                                                   
 modifies ThreadState.sxR;                                                                          
 modifies ThreadState.sxR;                                                                          
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: ThreadState;                                                                            
                                                                                                    
 var x_mid: ThreadState;                                                                            
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var ThreadState._lock_mid: [ThreadState]Tid;                                                       
 var $recorded.state_mid: int;                                                                      
 var ThreadState._state_mid: [ThreadState]State;                                                    
 var w_mid: int;                                                                                    
 var ThreadState.sxR_mid: [ThreadState]int;                                                         
 var y_mid: ThreadState;                                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: ThreadState;                                                                           
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ThreadState.sxR[x];                                                                        
 ThreadState.sxR[x] := v;                                                                           
 assume ThreadState._state_mid == ThreadState._state && ThreadState.sxR_mid == ThreadState.sxR && ThreadState._lock_mid == ThreadState._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ThreadState.sxR[x] := tmpV;                                                                        
 ThreadState.sxR[y] := w;                                                                           
 _writeByTPost := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ThreadState.sxR.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, w0: int, x: ThreadState, y: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[y], u);                                                   
 modifies ThreadState.sxR;                                                                          
 modifies ThreadState.sxR;                                                                          
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: ThreadState;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: ThreadState;                                                                           
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ThreadState.sxR(t: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ThreadState.sxR(u: Tid,y: ThreadState,w: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ThreadState.sxR[y] := w;                                                                           
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ThreadState.sxR(t: Tid,x: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ThreadState.sxR.ThreadState.sxR(t: Tid, u: Tid, v: int, w: int, w0: int, x: ThreadState, y: ThreadState)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ThreadState._state[x], t);                                                   
 requires isAccessible(ThreadState._state[y], u);                                                   
 modifies ThreadState.sxR;                                                                          
 modifies ThreadState.sxR;                                                                          
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: ThreadState;                                                                            
 var w_pre: int;                                                                                    
 var ThreadState.sxR_pre: [ThreadState]int;                                                         
 var $pc_pre: Phase;                                                                                
 var ThreadState._state_pre: [ThreadState]State;                                                    
 var ThreadState._lock_pre: [ThreadState]Tid;                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: ThreadState;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ThreadState.sxR_post: [ThreadState]int;                                                        
 var x_post: ThreadState;                                                                           
 var ThreadState._lock_post: [ThreadState]Tid;                                                      
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: ThreadState;                                                                           
 var v_post: int;                                                                                   
 var ThreadState._state_post: [ThreadState]State;                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ThreadState.sxR(u: Tid,y: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ThreadState.sxR(t: Tid,x: ThreadState,v: int,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ThreadState.sxR[x] := v;                                                                           
 assume ThreadState._state_post == ThreadState._state && ThreadState.sxR_post == ThreadState.sxR && ThreadState._lock_post == ThreadState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ThreadState.sxR(u: Tid,y: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                    
requires ValidTid(tid);                                                                             
modifies ThreadState._state;                                                                        
modifies ThreadState.sxR;                                                                           
modifies ThreadState._lock;                                                                         
ensures StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                     
ensures Y(tid , old(ThreadState._state), old(ThreadState.sxR), old(ThreadState._lock) , ThreadState._state, ThreadState.sxR, ThreadState._lock);
                                                                                                    
// ThreadState.sxR:                                                                                 
                                                                                                    
function {:inline} Y_ThreadState.sxR(tid : Tid, this: ThreadState, newValue: int , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid): bool
{                                                                                                   
 ((isAccessible(ThreadState._state[this], tid) && leq(m#moverPath(ReadEval.ThreadState.sxR(tid: Tid,this: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock)), _R)) ==> (ThreadState.sxR[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ThreadState.sxR(tid : Tid, this: ThreadState, newValue: int , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ThreadState.sxR.Subsumes.W(tid : Tid, u : Tid, this: ThreadState, newValue: int , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var ThreadState._state_yield: [ThreadState]State;                                                   
var $pc_yield: Phase;                                                                               
var ThreadState._lock_yield: [ThreadState]Tid;                                                      
var ThreadState.sxR_yield: [ThreadState]int;                                                        
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var this_yield: ThreadState;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
 assume isAccessible(ThreadState._state[this], u);                                                  
 assume !isError(m#moverPath(WriteEval.ThreadState.sxR(u: Tid,this: ThreadState,newValue: int,ThreadState._state,ThreadState.sxR,ThreadState._lock)));
                                                                                                    
assume ThreadState._state_yield == ThreadState._state && ThreadState.sxR_yield == ThreadState.sxR && ThreadState._lock_yield == ThreadState._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ThreadState.sxR(tid, this, newValue , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
                                                                                                    
procedure Y_ThreadState.sxR.Reflexive(tid : Tid, this: ThreadState , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var ThreadState._state_yield: [ThreadState]State;                                                   
var $pc_yield: Phase;                                                                               
var ThreadState._lock_yield: [ThreadState]Tid;                                                      
var ThreadState.sxR_yield: [ThreadState]int;                                                        
var this_yield: ThreadState;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
assume ThreadState._state_yield == ThreadState._state && ThreadState.sxR_yield == ThreadState.sxR && ThreadState._lock_yield == ThreadState._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ThreadState.sxR(tid, this, ThreadState.sxR[this] , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
                                                                                                    
procedure Y_ThreadState.sxR.Transitive(tid : Tid, this: ThreadState, newValue : int , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid , ThreadState._state_p: [ThreadState]State, ThreadState.sxR_p: [ThreadState]int, ThreadState._lock_p: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires StateInvariant(ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: ThreadState;                                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var ThreadState.sxR_pre: [ThreadState]int;                                                          
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var ThreadState._state_pre: [ThreadState]State;                                                     
var ThreadState._lock_pre: [ThreadState]Tid;                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var ThreadState.sxR_post: [ThreadState]int;                                                         
var newValue_post: int;                                                                             
var ThreadState._lock_post: [ThreadState]Tid;                                                       
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var this_post: ThreadState;                                                                         
var ThreadState._state_post: [ThreadState]State;                                                    
                                                                                                    
assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
 assume Y(tid , ThreadState._state, ThreadState.sxR, ThreadState._lock , ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);
 assume Y_ThreadState.sxR(tid, this, newValue , ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);
assume ThreadState._state_post == ThreadState._state_p && ThreadState.sxR_post == ThreadState.sxR_p && ThreadState._lock_post == ThreadState._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ThreadState.sxR(tid, this, newValue , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
// ThreadState._lock:                                                                               
                                                                                                    
function {:inline} Y_ThreadState._lock(tid : Tid, this: ThreadState, newValue: Tid , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid): bool
{                                                                                                   
 ((isAccessible(ThreadState._state[this], tid) && leq(m#moverPath(ReadEval.ThreadState._lock(tid: Tid,this: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock)), _R)) ==> (ThreadState._lock[this] == newValue))
 &&(((ThreadState._lock[this]==tid)==(newValue==tid)))                                              
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ThreadState._lock(tid : Tid, this: ThreadState, newValue: Tid , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ThreadState._lock.Subsumes.W(tid : Tid, u : Tid, this: ThreadState, newValue: Tid , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var ThreadState._state_yield: [ThreadState]State;                                                   
var $pc_yield: Phase;                                                                               
var ThreadState._lock_yield: [ThreadState]Tid;                                                      
var ThreadState.sxR_yield: [ThreadState]int;                                                        
var u_yield: Tid;                                                                                   
var this_yield: ThreadState;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
 assume isAccessible(ThreadState._state[this], u);                                                  
 assume !isError(m#moverPath(WriteEval.ThreadState._lock(u: Tid,this: ThreadState,newValue: Tid,ThreadState._state,ThreadState.sxR,ThreadState._lock)));
 assume leq(m#moverPath(ReadEval.ThreadState._lock(tid: Tid,this: ThreadState,ThreadState._state,ThreadState.sxR,ThreadState._lock)), _N);
assume ThreadState._state_yield == ThreadState._state && ThreadState.sxR_yield == ThreadState.sxR && ThreadState._lock_yield == ThreadState._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ThreadState._lock(tid, this, newValue , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
                                                                                                    
procedure Y_ThreadState._lock.Reflexive(tid : Tid, this: ThreadState , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var ThreadState._state_yield: [ThreadState]State;                                                   
var $pc_yield: Phase;                                                                               
var ThreadState._lock_yield: [ThreadState]Tid;                                                      
var ThreadState.sxR_yield: [ThreadState]int;                                                        
var this_yield: ThreadState;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
assume ThreadState._state_yield == ThreadState._state && ThreadState.sxR_yield == ThreadState.sxR && ThreadState._lock_yield == ThreadState._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ThreadState._lock(tid, this, ThreadState._lock[this] , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
                                                                                                    
procedure Y_ThreadState._lock.Transitive(tid : Tid, this: ThreadState, newValue : Tid , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid , ThreadState._state_p: [ThreadState]State, ThreadState.sxR_p: [ThreadState]int, ThreadState._lock_p: [ThreadState]Tid)
 requires StateInvariant(ThreadState._state, ThreadState.sxR, ThreadState._lock);                   
 requires StateInvariant(ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: ThreadState;                                                                          
var $recorded.state_pre: int;                                                                       
var ThreadState.sxR_pre: [ThreadState]int;                                                          
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var ThreadState._state_pre: [ThreadState]State;                                                     
var ThreadState._lock_pre: [ThreadState]Tid;                                                        
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var ThreadState.sxR_post: [ThreadState]int;                                                         
var ThreadState._lock_post: [ThreadState]Tid;                                                       
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var this_post: ThreadState;                                                                         
var newValue_post: Tid;                                                                             
var ThreadState._state_post: [ThreadState]State;                                                    
                                                                                                    
assume ThreadState._state_pre == ThreadState._state && ThreadState.sxR_pre == ThreadState.sxR && ThreadState._lock_pre == ThreadState._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ThreadState._state[this], tid);                                                
 assume Y(tid , ThreadState._state, ThreadState.sxR, ThreadState._lock , ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);
 assume Y_ThreadState._lock(tid, this, newValue , ThreadState._state_p, ThreadState.sxR_p, ThreadState._lock_p);
assume ThreadState._state_post == ThreadState._state_p && ThreadState.sxR_post == ThreadState.sxR_p && ThreadState._lock_post == ThreadState._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ThreadState._lock(tid, this, newValue , ThreadState._state, ThreadState.sxR, ThreadState._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , ThreadState._state: [ThreadState]State, ThreadState.sxR: [ThreadState]int, ThreadState._lock: [ThreadState]Tid , ThreadState._state_p: [ThreadState]State, ThreadState.sxR_p: [ThreadState]int, ThreadState._lock_p: [ThreadState]Tid): bool
{                                                                                                   
 (forall this: ThreadState :: Y_ThreadState.sxR(tid : Tid, this, ThreadState.sxR_p[this] , ThreadState._state, ThreadState.sxR, ThreadState._lock))
 && (forall this: ThreadState :: Y_ThreadState._lock(tid : Tid, this, ThreadState._lock_p[this] , ThreadState._state, ThreadState.sxR, ThreadState._lock))
 && (forall _i : ThreadState :: isShared(ThreadState._state[_i]) ==> isShared(ThreadState._state_p[_i]))
 && (forall _i : ThreadState :: isLocal(ThreadState._state[_i], tid) <==> isLocal(ThreadState._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 447.1-447.34: (2.5): ThreadState.sxR failed Write-Write Right-Mover Check
// 504.1-504.30: (2.5): ThreadState.sxR failed Write-Read Right-Mover Check
// 565.1-565.34: (2.5): ThreadState.sxR failed Write-Write Left-Mover Check
// 623.1-623.30: (2.5): ThreadState.sxR failed Write-Read Left-Mover Check
// 678.1-678.34: (2.5): ThreadState.sxR failed Read-Write Right-Mover Check
// 736.1-736.34: (2.5): ThreadState.sxR failed Read-Write Left-Mover Check
// 805.1-805.140: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.1)
// 806.1-806.101: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.2)
// 807.1-807.158: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case A.3)
// 900.1-900.140: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case C)
// 998.1-998.144: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case D)
// 999.1-999.144: (2.5): ThreadState.sxR is not Write-Write Stable with respect to ThreadState.sxR (case R)
// 1068.1-1068.136: (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case F)
// 1069.1-1069.136: (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case H)
// 1070.1-1070.146: (2.5): ThreadState.sxR is not Read-Write Stable with respect to ThreadState.sxR (case I)
// 1138.1-1138.136: (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case J)
// 1139.1-1139.136: (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case K)
// 1140.1-1140.99: (2.5): ThreadState.sxR is not Write-Read Stable with respect to ThreadState.sxR (case L)
// 1171.1-1190.2: (2.5): yields_as clause for ThreadState.sxR is not valid
// 1195.1-1209.2: (2.5): yields_as clause for ThreadState.sxR is not reflexive
// 1215.1-1243.2: (2.5): yields_as clause for ThreadState.sxR is not transitive
// 1263.1-1282.2: (7.32): yields_as clause for ThreadState._lock is not valid
// 1287.1-1301.2: (7.32): yields_as clause for ThreadState._lock is not reflexive
// 1307.1-1335.2: (7.32): yields_as clause for ThreadState._lock is not transitive
