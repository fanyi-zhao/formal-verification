                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/yields_as.anchor:                       
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class BadDiscipline {                                                                           
      volatile int value N                                                                          
        yields_as false;                                                                            
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class BadDiscipline {                                                                           
      volatile int value N                                                                          
        yields_as false;                                                                            
                                                                                                    
                                                                                                    
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
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class BadDiscipline {                                                                           
      volatile int value N                                                                          
        yields_as false;                                                                            
                                                                                                    
                                                                                                    
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
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class BadDiscipline {                                                                           
      volatile int value N                                                                          
        yields_as false;                                                                            
                                                                                                    
                                                                                                    
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
        assume this.value == 0;                                                                     
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
                                                                                                    
                                                                                                    
/*** Class Decl BadDiscipline ***/                                                                  
                                                                                                    
type BadDiscipline;                                                                                 
const unique BadDiscipline.null: BadDiscipline;                                                     
var BadDiscipline._state: [BadDiscipline]State;                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var BadDiscipline.value: [BadDiscipline]int;                                                        
                                                                                                    
function {:inline} ReadEval.BadDiscipline.value(tid: Tid,this : BadDiscipline,BadDiscipline._state: [BadDiscipline]State,BadDiscipline.value: [BadDiscipline]int,BadDiscipline._lock: [BadDiscipline]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.BadDiscipline.value(tid: Tid,this : BadDiscipline,newValue: int,BadDiscipline._state: [BadDiscipline]State,BadDiscipline.value: [BadDiscipline]int,BadDiscipline._lock: [BadDiscipline]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var BadDiscipline._lock: [BadDiscipline]Tid;                                                        
                                                                                                    
function {:inline} ReadEval.BadDiscipline._lock(tid: Tid,this : BadDiscipline,BadDiscipline._state: [BadDiscipline]State,BadDiscipline.value: [BadDiscipline]int,BadDiscipline._lock: [BadDiscipline]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(BadDiscipline._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((BadDiscipline._lock[this]==tid)) then                                                       
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((BadDiscipline._lock[this]==Tid.null)&&(newValue==tid))) then                               
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((BadDiscipline._lock[this]==tid)&&(newValue==Tid.null))) then                              
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.BadDiscipline._lock(tid: Tid,this : BadDiscipline,newValue: Tid,BadDiscipline._state: [BadDiscipline]State,BadDiscipline.value: [BadDiscipline]int,BadDiscipline._lock: [BadDiscipline]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(BadDiscipline._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((BadDiscipline._lock[this]==tid)) then                                                       
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((BadDiscipline._lock[this]==Tid.null)&&(newValue==tid))) then                               
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((BadDiscipline._lock[this]==tid)&&(newValue==Tid.null))) then                              
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
                                                                                                    
 function {:inline} StateInvariant(BadDiscipline._state: [BadDiscipline]State,BadDiscipline.value: [BadDiscipline]int,BadDiscipline._lock: [BadDiscipline]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: BadDiscipline  :: _i == BadDiscipline.null <==> isNull(BadDiscipline._state[_i])) &&  
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 BadDiscipline.value[x] := v;                                                                       
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,x: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): BadDiscipline.value failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 BadDiscipline.value[x] := v;                                                                       
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.BadDiscipline.value(u: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): BadDiscipline.value failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == BadDiscipline.value[x];                                                                
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 BadDiscipline.value[x] := havocValue;                                                              
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,x: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): BadDiscipline.value failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == BadDiscipline.value[x];                                                                
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.BadDiscipline.value(u: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): BadDiscipline.value failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.BadDiscipline.value(t: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,x: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): BadDiscipline.value failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, x: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[x], u);                                                 
 modifies BadDiscipline.value;                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == BadDiscipline.value[x];                                                                
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.BadDiscipline.value(t: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 BadDiscipline.value[x] := havocValue;                                                              
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,x: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): BadDiscipline.value failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.BadDiscipline.value.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: BadDiscipline, y: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[y], u);                                                 
 modifies BadDiscipline.value;                                                                      
 modifies BadDiscipline.value;                                                                      
                                                                                                    
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
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var y_pre: BadDiscipline;                                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var y_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 BadDiscipline.value[x] := v;                                                                       
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.BadDiscipline.value.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: BadDiscipline, y: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[y], u);                                                 
 modifies BadDiscipline.value;                                                                      
 modifies BadDiscipline.value;                                                                      
                                                                                                    
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
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var y_pre: BadDiscipline;                                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var BadDiscipline._lock_mid: [BadDiscipline]Tid;                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var y_mid: BadDiscipline;                                                                          
 var BadDiscipline._state_mid: [BadDiscipline]State;                                                
 var v_mid: int;                                                                                    
 var x_mid: BadDiscipline;                                                                          
 var BadDiscipline.value_mid: [BadDiscipline]int;                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var y_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := BadDiscipline.value[x];                                                                    
 BadDiscipline.value[x] := v;                                                                       
                                                                                                    
 assume BadDiscipline._state_mid == BadDiscipline._state && BadDiscipline.value_mid == BadDiscipline.value && BadDiscipline._lock_mid == BadDiscipline._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 BadDiscipline.value[x] := tmpV;                                                                    
 BadDiscipline.value[y] := w;                                                                       
 _writeByTPost := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.BadDiscipline.value.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: BadDiscipline, y: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[y], u);                                                 
 modifies BadDiscipline.value;                                                                      
 modifies BadDiscipline.value;                                                                      
                                                                                                    
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
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var y_pre: BadDiscipline;                                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var BadDiscipline._lock_mid: [BadDiscipline]Tid;                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var y_mid: BadDiscipline;                                                                          
 var BadDiscipline._state_mid: [BadDiscipline]State;                                                
 var v_mid: int;                                                                                    
 var x_mid: BadDiscipline;                                                                          
 var BadDiscipline.value_mid: [BadDiscipline]int;                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var y_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := BadDiscipline.value[x];                                                                    
 BadDiscipline.value[x] := v;                                                                       
 assume BadDiscipline._state_mid == BadDiscipline._state && BadDiscipline.value_mid == BadDiscipline.value && BadDiscipline._lock_mid == BadDiscipline._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 BadDiscipline.value[x] := tmpV;                                                                    
 BadDiscipline.value[y] := w;                                                                       
 _writeByTPost := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.BadDiscipline.value.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: BadDiscipline, y: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[y], u);                                                 
 modifies BadDiscipline.value;                                                                      
 modifies BadDiscipline.value;                                                                      
                                                                                                    
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
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var y_pre: BadDiscipline;                                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var y_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.BadDiscipline.value(t: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.BadDiscipline.value(u: Tid,y: BadDiscipline,w: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 BadDiscipline.value[y] := w;                                                                       
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.BadDiscipline.value(t: Tid,x: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.BadDiscipline.value.BadDiscipline.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: BadDiscipline, y: BadDiscipline)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(BadDiscipline._state[x], t);                                                 
 requires isAccessible(BadDiscipline._state[y], u);                                                 
 modifies BadDiscipline.value;                                                                      
 modifies BadDiscipline.value;                                                                      
                                                                                                    
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
 var x_pre: BadDiscipline;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var y_pre: BadDiscipline;                                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                   
 var BadDiscipline._state_pre: [BadDiscipline]State;                                                
 var BadDiscipline.value_pre: [BadDiscipline]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var BadDiscipline.value_post: [BadDiscipline]int;                                                  
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var x_post: BadDiscipline;                                                                         
 var y_post: BadDiscipline;                                                                         
 var v_post: int;                                                                                   
 var BadDiscipline._state_post: [BadDiscipline]State;                                               
 var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.BadDiscipline.value(u: Tid,y: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.BadDiscipline.value(t: Tid,x: BadDiscipline,v: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 BadDiscipline.value[x] := v;                                                                       
 assume BadDiscipline._state_post == BadDiscipline._state && BadDiscipline.value_post == BadDiscipline.value && BadDiscipline._lock_post == BadDiscipline._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.BadDiscipline.value(u: Tid,y: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);            
requires ValidTid(tid);                                                                             
modifies BadDiscipline._state;                                                                      
modifies BadDiscipline.value;                                                                       
modifies BadDiscipline._lock;                                                                       
ensures StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);             
ensures Y(tid , old(BadDiscipline._state), old(BadDiscipline.value), old(BadDiscipline._lock) , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
                                                                                                    
// BadDiscipline.value:                                                                             
                                                                                                    
function {:inline} Y_BadDiscipline.value(tid : Tid, this: BadDiscipline, newValue: int , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid): bool
{                                                                                                   
 ((isAccessible(BadDiscipline._state[this], tid) && leq(m#moverPath(ReadEval.BadDiscipline.value(tid: Tid,this: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock)), _R)) ==> (BadDiscipline.value[this] == newValue))
 &&(false)                                                                                          
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_BadDiscipline.value(tid : Tid, this: BadDiscipline, newValue: int , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline.value.Subsumes.W(tid : Tid, u : Tid, this: BadDiscipline, newValue: int , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var BadDiscipline._state_yield: [BadDiscipline]State;                                               
var tid_yield: Tid;                                                                                 
var BadDiscipline.value_yield: [BadDiscipline]int;                                                  
var BadDiscipline._lock_yield: [BadDiscipline]Tid;                                                  
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var this_yield: BadDiscipline;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
 assume isAccessible(BadDiscipline._state[this], u);                                                
 assume !isError(m#moverPath(WriteEval.BadDiscipline.value(u: Tid,this: BadDiscipline,newValue: int,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock)));
                                                                                                    
assume BadDiscipline._state_yield == BadDiscipline._state && BadDiscipline.value_yield == BadDiscipline.value && BadDiscipline._lock_yield == BadDiscipline._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_BadDiscipline.value(tid, this, newValue , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline.value.Reflexive(tid : Tid, this: BadDiscipline , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var BadDiscipline._state_yield: [BadDiscipline]State;                                               
var tid_yield: Tid;                                                                                 
var BadDiscipline.value_yield: [BadDiscipline]int;                                                  
var BadDiscipline._lock_yield: [BadDiscipline]Tid;                                                  
var $pc_yield: Phase;                                                                               
var this_yield: BadDiscipline;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
assume BadDiscipline._state_yield == BadDiscipline._state && BadDiscipline.value_yield == BadDiscipline.value && BadDiscipline._lock_yield == BadDiscipline._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_BadDiscipline.value(tid, this, BadDiscipline.value[this] , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline.value.Transitive(tid : Tid, this: BadDiscipline, newValue : int , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid , BadDiscipline._state_p: [BadDiscipline]State, BadDiscipline.value_p: [BadDiscipline]int, BadDiscipline._lock_p: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires StateInvariant(BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);     
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var this_pre: BadDiscipline;                                                                        
var $pc_pre: Phase;                                                                                 
var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                    
var BadDiscipline._state_pre: [BadDiscipline]State;                                                 
var BadDiscipline.value_pre: [BadDiscipline]int;                                                    
                                                                                                    
var $recorded.state_post: int;                                                                      
var BadDiscipline.value_post: [BadDiscipline]int;                                                   
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var this_post: BadDiscipline;                                                                       
var BadDiscipline._state_post: [BadDiscipline]State;                                                
var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                   
                                                                                                    
assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
 assume Y(tid , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock , BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);
 assume Y_BadDiscipline.value(tid, this, newValue , BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);
assume BadDiscipline._state_post == BadDiscipline._state_p && BadDiscipline.value_post == BadDiscipline.value_p && BadDiscipline._lock_post == BadDiscipline._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_BadDiscipline.value(tid, this, newValue , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
// BadDiscipline._lock:                                                                             
                                                                                                    
function {:inline} Y_BadDiscipline._lock(tid : Tid, this: BadDiscipline, newValue: Tid , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid): bool
{                                                                                                   
 ((isAccessible(BadDiscipline._state[this], tid) && leq(m#moverPath(ReadEval.BadDiscipline._lock(tid: Tid,this: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock)), _R)) ==> (BadDiscipline._lock[this] == newValue))
 &&(((BadDiscipline._lock[this]==tid)==(newValue==tid)))                                            
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_BadDiscipline._lock(tid : Tid, this: BadDiscipline, newValue: Tid , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline._lock.Subsumes.W(tid : Tid, u : Tid, this: BadDiscipline, newValue: Tid , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var BadDiscipline._state_yield: [BadDiscipline]State;                                               
var tid_yield: Tid;                                                                                 
var BadDiscipline.value_yield: [BadDiscipline]int;                                                  
var BadDiscipline._lock_yield: [BadDiscipline]Tid;                                                  
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var this_yield: BadDiscipline;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
 assume isAccessible(BadDiscipline._state[this], u);                                                
 assume !isError(m#moverPath(WriteEval.BadDiscipline._lock(u: Tid,this: BadDiscipline,newValue: Tid,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock)));
 assume leq(m#moverPath(ReadEval.BadDiscipline._lock(tid: Tid,this: BadDiscipline,BadDiscipline._state,BadDiscipline.value,BadDiscipline._lock)), _N);
assume BadDiscipline._state_yield == BadDiscipline._state && BadDiscipline.value_yield == BadDiscipline.value && BadDiscipline._lock_yield == BadDiscipline._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_BadDiscipline._lock(tid, this, newValue , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline._lock.Reflexive(tid : Tid, this: BadDiscipline , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var BadDiscipline._state_yield: [BadDiscipline]State;                                               
var tid_yield: Tid;                                                                                 
var BadDiscipline.value_yield: [BadDiscipline]int;                                                  
var BadDiscipline._lock_yield: [BadDiscipline]Tid;                                                  
var $pc_yield: Phase;                                                                               
var this_yield: BadDiscipline;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
assume BadDiscipline._state_yield == BadDiscipline._state && BadDiscipline.value_yield == BadDiscipline.value && BadDiscipline._lock_yield == BadDiscipline._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_BadDiscipline._lock(tid, this, BadDiscipline._lock[this] , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
                                                                                                    
procedure Y_BadDiscipline._lock.Transitive(tid : Tid, this: BadDiscipline, newValue : Tid , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid , BadDiscipline._state_p: [BadDiscipline]State, BadDiscipline.value_p: [BadDiscipline]int, BadDiscipline._lock_p: [BadDiscipline]Tid)
 requires StateInvariant(BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);           
 requires StateInvariant(BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);     
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var tid_pre: Tid;                                                                                   
var this_pre: BadDiscipline;                                                                        
var $pc_pre: Phase;                                                                                 
var BadDiscipline._lock_pre: [BadDiscipline]Tid;                                                    
var BadDiscipline._state_pre: [BadDiscipline]State;                                                 
var BadDiscipline.value_pre: [BadDiscipline]int;                                                    
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var BadDiscipline.value_post: [BadDiscipline]int;                                                   
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var this_post: BadDiscipline;                                                                       
var BadDiscipline._state_post: [BadDiscipline]State;                                                
var BadDiscipline._lock_post: [BadDiscipline]Tid;                                                   
var newValue_post: Tid;                                                                             
                                                                                                    
assume BadDiscipline._state_pre == BadDiscipline._state && BadDiscipline.value_pre == BadDiscipline.value && BadDiscipline._lock_pre == BadDiscipline._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(BadDiscipline._state[this], tid);                                              
 assume Y(tid , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock , BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);
 assume Y_BadDiscipline._lock(tid, this, newValue , BadDiscipline._state_p, BadDiscipline.value_p, BadDiscipline._lock_p);
assume BadDiscipline._state_post == BadDiscipline._state_p && BadDiscipline.value_post == BadDiscipline.value_p && BadDiscipline._lock_post == BadDiscipline._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_BadDiscipline._lock(tid, this, newValue , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , BadDiscipline._state: [BadDiscipline]State, BadDiscipline.value: [BadDiscipline]int, BadDiscipline._lock: [BadDiscipline]Tid , BadDiscipline._state_p: [BadDiscipline]State, BadDiscipline.value_p: [BadDiscipline]int, BadDiscipline._lock_p: [BadDiscipline]Tid): bool
{                                                                                                   
 (forall this: BadDiscipline :: Y_BadDiscipline.value(tid : Tid, this, BadDiscipline.value_p[this] , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock))
 && (forall this: BadDiscipline :: Y_BadDiscipline._lock(tid : Tid, this, BadDiscipline._lock_p[this] , BadDiscipline._state, BadDiscipline.value, BadDiscipline._lock))
 && (forall _i : BadDiscipline :: isShared(BadDiscipline._state[_i]) ==> isShared(BadDiscipline._state_p[_i]))
 && (forall _i : BadDiscipline :: isLocal(BadDiscipline._state[_i], tid) <==> isLocal(BadDiscipline._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 447.1-447.34: (3.5): BadDiscipline.value failed Write-Write Right-Mover Check
// 504.1-504.30: (3.5): BadDiscipline.value failed Write-Read Right-Mover Check
// 565.1-565.34: (3.5): BadDiscipline.value failed Write-Write Left-Mover Check
// 623.1-623.30: (3.5): BadDiscipline.value failed Write-Read Left-Mover Check
// 678.1-678.34: (3.5): BadDiscipline.value failed Read-Write Right-Mover Check
// 736.1-736.34: (3.5): BadDiscipline.value failed Read-Write Left-Mover Check
// 805.1-805.140: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.1)
// 806.1-806.101: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.2)
// 807.1-807.158: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case A.3)
// 900.1-900.140: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case C)
// 998.1-998.144: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case D)
// 999.1-999.144: (3.5): BadDiscipline.value is not Write-Write Stable with respect to BadDiscipline.value (case R)
// 1068.1-1068.136: (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case F)
// 1069.1-1069.136: (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case H)
// 1070.1-1070.146: (3.5): BadDiscipline.value is not Read-Write Stable with respect to BadDiscipline.value (case I)
// 1138.1-1138.136: (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case J)
// 1139.1-1139.136: (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case K)
// 1140.1-1140.99: (3.5): BadDiscipline.value is not Write-Read Stable with respect to BadDiscipline.value (case L)
// 1172.1-1191.2: (4.27): yields_as clause for BadDiscipline.value is not valid
// 1196.1-1210.2: (4.27): yields_as clause for BadDiscipline.value is not reflexive
// 1216.1-1244.2: (4.27): yields_as clause for BadDiscipline.value is not transitive
// 1264.1-1283.2: (7.32): yields_as clause for BadDiscipline._lock is not valid
// 1288.1-1302.2: (7.32): yields_as clause for BadDiscipline._lock is not reflexive
// 1308.1-1336.2: (7.32): yields_as clause for BadDiscipline._lock is not transitive
