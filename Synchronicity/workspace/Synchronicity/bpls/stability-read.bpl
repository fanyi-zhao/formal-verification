                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stability-read.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.read == 0;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
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
                                                                                                    
                                                                                                    
/*** Class Decl VarState ***/                                                                       
                                                                                                    
type VarState;                                                                                      
const unique VarState.null: VarState;                                                               
var VarState._state: [VarState]State;                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var VarState.read: [VarState]int;                                                                   
                                                                                                    
function {:inline} ReadEval.VarState.read(tid: Tid,this : VarState,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.VarState.read(tid: Tid,this : VarState,newValue: int,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var VarState._lock: [VarState]Tid;                                                                  
                                                                                                    
function {:inline} ReadEval.VarState._lock(tid: Tid,this : VarState,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(VarState._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((VarState._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((VarState._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((VarState._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.VarState._lock(tid: Tid,this : VarState,newValue: Tid,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(VarState._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((VarState._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((VarState._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((VarState._lock[this]==tid)&&(newValue==Tid.null))) then                                   
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
                                                                                                    
 function {:inline} StateInvariant(VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: VarState  :: _i == VarState.null <==> isNull(VarState._state[_i])) &&                 
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)   
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.6): VarState.read failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)    
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.VarState.read(u: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.6): VarState.read failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)    
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == VarState.read[x];                                                                      
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 VarState.read[x] := havocValue;                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.6): VarState.read failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)     
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == VarState.read[x];                                                                      
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.VarState.read(u: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.6): VarState.read failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)         
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.6): VarState.read failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)          
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == VarState.read[x];                                                                      
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 VarState.read[x] := havocValue;                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.6): VarState.read failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var v_mid: int;                                                                                    
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
                                                                                                    
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var v_mid: int;                                                                                    
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[y] := w;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(VarState._state, VarState.read, VarState._lock);                            
requires ValidTid(tid);                                                                             
modifies VarState._state;                                                                           
modifies VarState.read;                                                                             
modifies VarState._lock;                                                                            
ensures StateInvariant(VarState._state, VarState.read, VarState._lock);                             
ensures Y(tid , old(VarState._state), old(VarState.read), old(VarState._lock) , VarState._state, VarState.read, VarState._lock);
                                                                                                    
// VarState.read:                                                                                   
                                                                                                    
function {:inline} Y_VarState.read(tid : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid): bool
{                                                                                                   
 ((isAccessible(VarState._state[this], tid) && leq(m#moverPath(ReadEval.VarState.read(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock)), _R)) ==> (VarState.read[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_VarState.read(tid : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Subsumes.W(tid : Tid, u : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var VarState._state_yield: [VarState]State;                                                         
var u_yield: Tid;                                                                                   
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume isAccessible(VarState._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.VarState.read(u: Tid,this: VarState,newValue: int,VarState._state,VarState.read,VarState._lock)));
                                                                                                    
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState.read(tid, this, newValue , VarState._state, VarState.read, VarState._lock);      
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Reflexive(tid : Tid, this: VarState , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var VarState._state_yield: [VarState]State;                                                         
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState.read(tid, this, VarState.read[this] , VarState._state, VarState.read, VarState._lock);
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Transitive(tid : Tid, this: VarState, newValue : int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires StateInvariant(VarState._state_p, VarState.read_p, VarState._lock_p);                     
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: VarState;                                                                             
var VarState.read_pre: [VarState]int;                                                               
var $recorded.state_pre: int;                                                                       
var VarState._state_pre: [VarState]State;                                                           
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var VarState._lock_pre: [VarState]Tid;                                                              
                                                                                                    
var VarState._state_post: [VarState]State;                                                          
var VarState.read_post: [VarState]int;                                                              
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: VarState;                                                                            
var tid_post: Tid;                                                                                  
var VarState._lock_post: [VarState]Tid;                                                             
                                                                                                    
assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume Y(tid , VarState._state, VarState.read, VarState._lock , VarState._state_p, VarState.read_p, VarState._lock_p);
 assume Y_VarState.read(tid, this, newValue , VarState._state_p, VarState.read_p, VarState._lock_p);
assume VarState._state_post == VarState._state_p && VarState.read_post == VarState.read_p && VarState._lock_post == VarState._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_VarState.read(tid, this, newValue , VarState._state, VarState.read, VarState._lock);      
}                                                                                                   
// VarState._lock:                                                                                  
                                                                                                    
function {:inline} Y_VarState._lock(tid : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid): bool
{                                                                                                   
 ((isAccessible(VarState._state[this], tid) && leq(m#moverPath(ReadEval.VarState._lock(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock)), _R)) ==> (VarState._lock[this] == newValue))
 &&(((VarState._lock[this]==tid)==(newValue==tid)))                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_VarState._lock(tid : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Subsumes.W(tid : Tid, u : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var VarState._state_yield: [VarState]State;                                                         
var u_yield: Tid;                                                                                   
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume isAccessible(VarState._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.VarState._lock(u: Tid,this: VarState,newValue: Tid,VarState._state,VarState.read,VarState._lock)));
 assume leq(m#moverPath(ReadEval.VarState._lock(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock)), _N);
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState._lock(tid, this, newValue , VarState._state, VarState.read, VarState._lock);     
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Reflexive(tid : Tid, this: VarState , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var VarState._state_yield: [VarState]State;                                                         
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState._lock(tid, this, VarState._lock[this] , VarState._state, VarState.read, VarState._lock);
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Transitive(tid : Tid, this: VarState, newValue : Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock);                           
 requires StateInvariant(VarState._state_p, VarState.read_p, VarState._lock_p);                     
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: VarState;                                                                             
var VarState.read_pre: [VarState]int;                                                               
var $recorded.state_pre: int;                                                                       
var VarState._state_pre: [VarState]State;                                                           
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var VarState._lock_pre: [VarState]Tid;                                                              
var newValue_pre: Tid;                                                                              
                                                                                                    
var VarState._state_post: [VarState]State;                                                          
var VarState.read_post: [VarState]int;                                                              
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: VarState;                                                                            
var tid_post: Tid;                                                                                  
var VarState._lock_post: [VarState]Tid;                                                             
var newValue_post: Tid;                                                                             
                                                                                                    
assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume Y(tid , VarState._state, VarState.read, VarState._lock , VarState._state_p, VarState.read_p, VarState._lock_p);
 assume Y_VarState._lock(tid, this, newValue , VarState._state_p, VarState.read_p, VarState._lock_p);
assume VarState._state_post == VarState._state_p && VarState.read_post == VarState.read_p && VarState._lock_post == VarState._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_VarState._lock(tid, this, newValue , VarState._state, VarState.read, VarState._lock);     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid): bool
{                                                                                                   
 (forall this: VarState :: Y_VarState.read(tid : Tid, this, VarState.read_p[this] , VarState._state, VarState.read, VarState._lock))
 && (forall this: VarState :: Y_VarState._lock(tid : Tid, this, VarState._lock_p[this] , VarState._state, VarState.read, VarState._lock))
 && (forall _i : VarState :: isShared(VarState._state[_i]) ==> isShared(VarState._state_p[_i]))     
 && (forall _i : VarState :: isLocal(VarState._state[_i], tid) <==> isLocal(VarState._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 485.1-485.34: (3.6): VarState.read failed Write-Write Right-Mover Check
// 542.1-542.30: (3.6): VarState.read failed Write-Read Right-Mover Check
// 603.1-603.34: (3.6): VarState.read failed Write-Write Left-Mover Check
// 661.1-661.30: (3.6): VarState.read failed Write-Read Left-Mover Check
// 716.1-716.34: (3.6): VarState.read failed Read-Write Right-Mover Check
// 774.1-774.34: (3.6): VarState.read failed Read-Write Left-Mover Check
// 843.1-843.140: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.1)
// 844.1-844.101: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.2)
// 845.1-845.158: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case A.3)
// 938.1-938.140: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case C)
// 1036.1-1036.144: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case D)
// 1037.1-1037.144: (3.6): VarState.read is not Write-Write Stable with respect to VarState.read (case R)
// 1106.1-1106.136: (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case F)
// 1107.1-1107.136: (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case H)
// 1108.1-1108.146: (3.6): VarState.read is not Read-Write Stable with respect to VarState.read (case I)
// 1176.1-1176.136: (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case J)
// 1177.1-1177.136: (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case K)
// 1178.1-1178.99: (3.6): VarState.read is not Write-Read Stable with respect to VarState.read (case L)
// 1209.1-1228.2: (3.6): yields_as clause for VarState.read is not valid
// 1233.1-1247.2: (3.6): yields_as clause for VarState.read is not reflexive
// 1253.1-1281.2: (3.6): yields_as clause for VarState.read is not transitive
// 1301.1-1320.2: (7.32): yields_as clause for VarState._lock is not valid
// 1325.1-1339.2: (7.32): yields_as clause for VarState._lock is not reflexive
// 1345.1-1373.2: (7.32): yields_as clause for VarState._lock is not transitive
