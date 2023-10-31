                                                                                                    
 /*                                                                                                 
                                                                                                    
 tests/ok1.anchor:                                                                                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Ok {                                                                                      
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.y == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        synchronized (this) {                                                                       
          int tmp1;                                                                                 
          int tmp2;                                                                                 
          tmp2 := this.y;                                                                           
          tmp1 = tmp2 + 1;                                                                          
          this.y := tmp1;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Ok {                                                                                      
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.y;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.y := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Ok {                                                                                      
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.y;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.y := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Ok {                                                                                      
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.y;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.y := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
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
                                                                                                    
                                                                                                    
/*** Class Decl Ok ***/                                                                             
                                                                                                    
type Ok;                                                                                            
const unique Ok.null: Ok;                                                                           
var Ok._state: [Ok]State;                                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Ok.y: [Ok]int;                                                                                  
                                                                                                    
function {:inline} ReadEval.Ok.y(tid: Tid,this : Ok,Ok._state: [Ok]State,Ok.y: [Ok]int,Ok._lock: [Ok]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(Ok._state[this], tid) && Ok._lock[this] == tid)) then                            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Ok.y(tid: Tid,this : Ok,newValue: int,Ok._state: [Ok]State,Ok.y: [Ok]int,Ok._lock: [Ok]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Ok._state[this], tid) && Ok._lock[this] == tid)) then                            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Ok._lock: [Ok]Tid;                                                                              
                                                                                                    
function {:inline} ReadEval.Ok._lock(tid: Tid,this : Ok,Ok._state: [Ok]State,Ok.y: [Ok]int,Ok._lock: [Ok]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Ok._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Ok._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Ok._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Ok._lock[this]==tid)&&(newValue==Tid.null))) then                                         
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Ok._lock(tid: Tid,this : Ok,newValue: Tid,Ok._state: [Ok]State,Ok.y: [Ok]int,Ok._lock: [Ok]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Ok._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Ok._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Ok._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Ok._lock[this]==tid)&&(newValue==Tid.null))) then                                         
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Ok.inc(tid:Tid, this : Ok)                                                               
modifies Ok._state;                                                                                 
modifies Ok.y;                                                                                      
modifies Ok._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (4.3): Bad tid
requires isShared(Ok._state[this]);                                                                        // (4.3): this is not global
                                                                                                    
requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                 
                                                                                                    
ensures StateInvariant(Ok._state, Ok.y, Ok._lock);                                                  
{                                                                                                   
 var this15971: Ok;                                                                                 
 var moverPath15961: MoverPath;                                                                     
 var $recorded.state15976: int;                                                                     
 var mover15971: Mover;                                                                             
 var tmp215961: int;                                                                                
 var path15971: int;                                                                                
 var $pc15961: Phase;                                                                               
 var moverPath15971: MoverPath;                                                                     
 var $pc15971: Phase;                                                                               
 var Ok._lock15971: [Ok]Tid;                                                                        
 var path15961: int;                                                                                
 var Ok._lock15976: [Ok]Tid;                                                                        
 var this15976: Ok;                                                                                 
 var this15961: Ok;                                                                                 
 var Ok._state15976: [Ok]State;                                                                     
 var mover15961: Mover;                                                                             
 var $pc15976: Phase;                                                                               
 var Ok.y15961: [Ok]int;                                                                            
 var tmp115961: int;                                                                                
 var Ok.y15971: [Ok]int;                                                                            
 var tid15976: Tid;                                                                                 
 var Ok._state15961: [Ok]State;                                                                     
 var $recorded.state15961: int;                                                                     
 var tid15961: Tid;                                                                                 
 var tmp1: int;                                                                                     
 var Ok._lock15961: [Ok]Tid;                                                                        
 var Ok._state15971: [Ok]State;                                                                     
 var Ok.y15976: [Ok]int;                                                                            
 var tmp115971: int;                                                                                
 var tmp2: int;                                                                                     
 var tid15971: Tid;                                                                                 
 var tmp215971: int;                                                                                
 var $recorded.state15971: int;                                                                     
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Ok.null;                                                                           
 } else {                                                                                           
  assert this != Ok.null;                                                                                  // (5.15): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Ok._lock[this] == Tid.null;                                                                 
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (5.15): Reduction failure
 Ok._lock[this] := tid;                                                                             
                                                                                                    
 // 6.4: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 6.4: int tmp2;                                                                                  
                                                                                                    
                                                                                                    
 // 6.4: tmp2 := this.y;                                                                            
                                                                                                    
                                                                                                    
 moverPath15961 := ReadEval.Ok.y(tid: Tid,this: Ok,Ok._state,Ok.y,Ok._lock);                        
 mover15961 := m#moverPath(moverPath15961);                                                         
 path15961 := p#moverPath(moverPath15961);                                                          
 assume Ok._state15961 == Ok._state && Ok.y15961 == Ok.y && Ok._lock15961 == Ok._lock && tmp215961 == tmp2 && tmp115961 == tmp1 && this15961 == this && tid15961 == tid && $pc15961 == $pc;
 assume $recorded.state15961 == 1;                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Ok.null;                                                                           
 } else {                                                                                           
  assert this != Ok.null;                                                                                  // (6.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover15961);                                                                
 assert $pc != PhaseError;                                                                                 // (6.4): Reduction failure
 tmp2 := Ok.y[this];                                                                                
                                                                                                    
 // 6.4: tmp1 = tmp2 + 1;                                                                           
                                                                                                    
 tmp1 := (tmp2+1);                                                                                  
                                                                                                    
                                                                                                    
 // 6.4: this.y := tmp1;                                                                            
                                                                                                    
                                                                                                    
 moverPath15971 := WriteEval.Ok.y(tid: Tid,this: Ok,tmp1: int,Ok._state,Ok.y,Ok._lock);             
 mover15971 := m#moverPath(moverPath15971);                                                         
 path15971 := p#moverPath(moverPath15971);                                                          
 assume Ok._state15971 == Ok._state && Ok.y15971 == Ok.y && Ok._lock15971 == Ok._lock && tmp215971 == tmp2 && tmp115971 == tmp1 && this15971 == this && tid15971 == tid && $pc15971 == $pc;
 assume $recorded.state15971 == 1;                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Ok.null;                                                                           
 } else {                                                                                           
  assert this != Ok.null;                                                                                  // (6.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover15971);                                                                
 assert $pc != PhaseError;                                                                                 // (6.4): Reduction failure
 Ok.y[this] := tmp1;                                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Ok.null;                                                                           
 } else {                                                                                           
  assert this != Ok.null;                                                                                  // (7.2): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Ok._lock[this] == tid;                                                                             // (7.2): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (7.2): Reduction failure
 Ok._lock[this] := Tid.null;                                                                        
                                                                                                    
 // 4.22: // return;                                                                                
                                                                                                    
 assume Ok._state15976 == Ok._state && Ok.y15976 == Ok.y && Ok._lock15976 == Ok._lock && this15976 == this && tid15976 == tid;
 assume $recorded.state15976 == 1;                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Ok._state: [Ok]State,Ok.y: [Ok]int,Ok._lock: [Ok]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Ok  :: _i == Ok.null <==> isNull(Ok._state[_i])) &&                                   
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                  
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Ok.y[x] := v;                                                                                      
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Ok.y(u: Tid,x: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): Ok.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                   
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Ok.y[x] := v;                                                                                      
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Ok.y(u: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.3): Ok.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                   
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Ok.y[x];                                                                               
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Ok.y[x] := havocValue;                                                                             
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Ok.y(u: Tid,x: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): Ok.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                    
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Ok.y[x];                                                                               
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Ok.y(u: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.3): Ok.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                        
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Ok.y(t: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Ok.y(u: Tid,x: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): Ok.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Ok.y(t: Tid, u: Tid, v: int, w: int, x: Ok)                         
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[x], u);                                                            
 modifies Ok.y;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Ok.y[x];                                                                               
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Ok.y(t: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Ok.y[x] := havocValue;                                                                             
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Ok.y(u: Tid,x: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): Ok.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Ok.y.Ok.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Ok, y: Ok)          
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[y], u);                                                            
 modifies Ok.y;                                                                                     
 modifies Ok.y;                                                                                     
                                                                                                    
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
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
 var y_pre: Ok;                                                                                     
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
 var y_post: Ok;                                                                                    
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Ok.y[x] := v;                                                                                      
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Ok.y.Ok.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Ok, y: Ok)          
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[y], u);                                                            
 modifies Ok.y;                                                                                     
 modifies Ok.y;                                                                                     
                                                                                                    
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
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
 var y_pre: Ok;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Ok.y_mid: [Ok]int;                                                                             
 var y_mid: Ok;                                                                                     
 var w_mid: int;                                                                                    
 var Ok._lock_mid: [Ok]Tid;                                                                         
 var Ok._state_mid: [Ok]State;                                                                      
 var x_mid: Ok;                                                                                     
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
 var y_post: Ok;                                                                                    
                                                                                                    
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Ok.y[x];                                                                                   
 Ok.y[x] := v;                                                                                      
                                                                                                    
 assume Ok._state_mid == Ok._state && Ok.y_mid == Ok.y && Ok._lock_mid == Ok._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Ok.y[x] := tmpV;                                                                                   
 Ok.y[y] := w;                                                                                      
 _writeByTPost := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Ok.y.Ok.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Ok, y: Ok)         
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[y], u);                                                            
 modifies Ok.y;                                                                                     
 modifies Ok.y;                                                                                     
                                                                                                    
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
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
 var y_pre: Ok;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Ok.y_mid: [Ok]int;                                                                             
 var y_mid: Ok;                                                                                     
 var w_mid: int;                                                                                    
 var Ok._lock_mid: [Ok]Tid;                                                                         
 var Ok._state_mid: [Ok]State;                                                                      
 var x_mid: Ok;                                                                                     
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
 var y_post: Ok;                                                                                    
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Ok.y[x];                                                                                   
 Ok.y[x] := v;                                                                                      
 assume Ok._state_mid == Ok._state && Ok.y_mid == Ok.y && Ok._lock_mid == Ok._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Ok.y[x] := tmpV;                                                                                   
 Ok.y[y] := w;                                                                                      
 _writeByTPost := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Ok.y.Ok.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Ok, y: Ok)        
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[y], u);                                                            
 modifies Ok.y;                                                                                     
 modifies Ok.y;                                                                                     
                                                                                                    
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
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
 var y_pre: Ok;                                                                                     
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
 var y_post: Ok;                                                                                    
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Ok.y(t: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Ok.y(u: Tid,y: Ok,w: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Ok.y[y] := w;                                                                                      
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Ok.y(t: Tid,x: Ok,Ok._state,Ok.y,Ok._lock);                               
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Ok.y.Ok.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Ok, y: Ok)        
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Ok._state[x], t);                                                            
 requires isAccessible(Ok._state[y], u);                                                            
 modifies Ok.y;                                                                                     
 modifies Ok.y;                                                                                     
                                                                                                    
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
 var Ok._state_pre: [Ok]State;                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Ok.y_pre: [Ok]int;                                                                             
 var x_pre: Ok;                                                                                     
 var t_pre: Tid;                                                                                    
 var Ok._lock_pre: [Ok]Tid;                                                                         
 var y_pre: Ok;                                                                                     
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Ok.y_post: [Ok]int;                                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Ok._lock_post: [Ok]Tid;                                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Ok;                                                                                    
 var Ok._state_post: [Ok]State;                                                                     
 var u_post: Tid;                                                                                   
 var y_post: Ok;                                                                                    
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Ok.y(u: Tid,y: Ok,Ok._state,Ok.y,Ok._lock);                                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Ok.y(t: Tid,x: Ok,v: int,Ok._state,Ok.y,Ok._lock);                          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Ok.y[x] := v;                                                                                      
 assume Ok._state_post == Ok._state && Ok.y_post == Ok.y && Ok._lock_post == Ok._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Ok.y(u: Tid,y: Ok,Ok._state,Ok.y,Ok._lock);                               
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                 
requires ValidTid(tid);                                                                             
modifies Ok._state;                                                                                 
modifies Ok.y;                                                                                      
modifies Ok._lock;                                                                                  
ensures StateInvariant(Ok._state, Ok.y, Ok._lock);                                                  
ensures Y(tid , old(Ok._state), old(Ok.y), old(Ok._lock) , Ok._state, Ok.y, Ok._lock);              
                                                                                                    
// Ok.y:                                                                                            
                                                                                                    
function {:inline} Y_Ok.y(tid : Tid, this: Ok, newValue: int , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid): bool
{                                                                                                   
 ((isAccessible(Ok._state[this], tid) && leq(m#moverPath(ReadEval.Ok.y(tid: Tid,this: Ok,Ok._state,Ok.y,Ok._lock)), _R)) ==> (Ok.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Ok.y(tid : Tid, this: Ok, newValue: int , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Ok.y.Subsumes.W(tid : Tid, u : Tid, this: Ok, newValue: int , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Ok._state_yield: [Ok]State;                                                                     
var tid_yield: Tid;                                                                                 
var Ok.y_yield: [Ok]int;                                                                            
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Ok._lock_yield: [Ok]Tid;                                                                        
var this_yield: Ok;                                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
 assume isAccessible(Ok._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.Ok.y(u: Tid,this: Ok,newValue: int,Ok._state,Ok.y,Ok._lock)));
                                                                                                    
assume Ok._state_yield == Ok._state && Ok.y_yield == Ok.y && Ok._lock_yield == Ok._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ok.y(tid, this, newValue , Ok._state, Ok.y, Ok._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_Ok.y.Reflexive(tid : Tid, this: Ok , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Ok._state_yield: [Ok]State;                                                                     
var tid_yield: Tid;                                                                                 
var Ok.y_yield: [Ok]int;                                                                            
var $pc_yield: Phase;                                                                               
var Ok._lock_yield: [Ok]Tid;                                                                        
var this_yield: Ok;                                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
assume Ok._state_yield == Ok._state && Ok.y_yield == Ok.y && Ok._lock_yield == Ok._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ok.y(tid, this, Ok.y[this] , Ok._state, Ok.y, Ok._lock);                                  
}                                                                                                   
                                                                                                    
procedure Y_Ok.y.Transitive(tid : Tid, this: Ok, newValue : int , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid , Ok._state_p: [Ok]State, Ok.y_p: [Ok]int, Ok._lock_p: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires StateInvariant(Ok._state_p, Ok.y_p, Ok._lock_p);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Ok._state_pre: [Ok]State;                                                                       
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var this_pre: Ok;                                                                                   
var $pc_pre: Phase;                                                                                 
var Ok.y_pre: [Ok]int;                                                                              
var Ok._lock_pre: [Ok]Tid;                                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var Ok.y_post: [Ok]int;                                                                             
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Ok._lock_post: [Ok]Tid;                                                                         
var tid_post: Tid;                                                                                  
var this_post: Ok;                                                                                  
var Ok._state_post: [Ok]State;                                                                      
                                                                                                    
assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
 assume Y(tid , Ok._state, Ok.y, Ok._lock , Ok._state_p, Ok.y_p, Ok._lock_p);                       
 assume Y_Ok.y(tid, this, newValue , Ok._state_p, Ok.y_p, Ok._lock_p);                              
assume Ok._state_post == Ok._state_p && Ok.y_post == Ok.y_p && Ok._lock_post == Ok._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Ok.y(tid, this, newValue , Ok._state, Ok.y, Ok._lock);                                    
}                                                                                                   
// Ok._lock:                                                                                        
                                                                                                    
function {:inline} Y_Ok._lock(tid : Tid, this: Ok, newValue: Tid , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid): bool
{                                                                                                   
 ((isAccessible(Ok._state[this], tid) && leq(m#moverPath(ReadEval.Ok._lock(tid: Tid,this: Ok,Ok._state,Ok.y,Ok._lock)), _R)) ==> (Ok._lock[this] == newValue))
 &&(((Ok._lock[this]==tid)==(newValue==tid)))                                                       
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Ok._lock(tid : Tid, this: Ok, newValue: Tid , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Ok._lock.Subsumes.W(tid : Tid, u : Tid, this: Ok, newValue: Tid , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Ok._state_yield: [Ok]State;                                                                     
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var Ok.y_yield: [Ok]int;                                                                            
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Ok._lock_yield: [Ok]Tid;                                                                        
var this_yield: Ok;                                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
 assume isAccessible(Ok._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.Ok._lock(u: Tid,this: Ok,newValue: Tid,Ok._state,Ok.y,Ok._lock)));
 assume leq(m#moverPath(ReadEval.Ok._lock(tid: Tid,this: Ok,Ok._state,Ok.y,Ok._lock)), _N);         
assume Ok._state_yield == Ok._state && Ok.y_yield == Ok.y && Ok._lock_yield == Ok._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ok._lock(tid, this, newValue , Ok._state, Ok.y, Ok._lock);                                
}                                                                                                   
                                                                                                    
procedure Y_Ok._lock.Reflexive(tid : Tid, this: Ok , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Ok._state_yield: [Ok]State;                                                                     
var tid_yield: Tid;                                                                                 
var Ok.y_yield: [Ok]int;                                                                            
var $pc_yield: Phase;                                                                               
var Ok._lock_yield: [Ok]Tid;                                                                        
var this_yield: Ok;                                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
assume Ok._state_yield == Ok._state && Ok.y_yield == Ok.y && Ok._lock_yield == Ok._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ok._lock(tid, this, Ok._lock[this] , Ok._state, Ok.y, Ok._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_Ok._lock.Transitive(tid : Tid, this: Ok, newValue : Tid , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid , Ok._state_p: [Ok]State, Ok.y_p: [Ok]int, Ok._lock_p: [Ok]Tid)
 requires StateInvariant(Ok._state, Ok.y, Ok._lock);                                                
 requires StateInvariant(Ok._state_p, Ok.y_p, Ok._lock_p);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Ok._state_pre: [Ok]State;                                                                       
var $recorded.state_pre: int;                                                                       
var tid_pre: Tid;                                                                                   
var this_pre: Ok;                                                                                   
var $pc_pre: Phase;                                                                                 
var Ok.y_pre: [Ok]int;                                                                              
var newValue_pre: Tid;                                                                              
var Ok._lock_pre: [Ok]Tid;                                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var Ok.y_post: [Ok]int;                                                                             
var $pc_post: Phase;                                                                                
var Ok._lock_post: [Ok]Tid;                                                                         
var tid_post: Tid;                                                                                  
var this_post: Ok;                                                                                  
var Ok._state_post: [Ok]State;                                                                      
var newValue_post: Tid;                                                                             
                                                                                                    
assume Ok._state_pre == Ok._state && Ok.y_pre == Ok.y && Ok._lock_pre == Ok._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Ok._state[this], tid);                                                         
 assume Y(tid , Ok._state, Ok.y, Ok._lock , Ok._state_p, Ok.y_p, Ok._lock_p);                       
 assume Y_Ok._lock(tid, this, newValue , Ok._state_p, Ok.y_p, Ok._lock_p);                          
assume Ok._state_post == Ok._state_p && Ok.y_post == Ok.y_p && Ok._lock_post == Ok._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Ok._lock(tid, this, newValue , Ok._state, Ok.y, Ok._lock);                                
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Ok._state: [Ok]State, Ok.y: [Ok]int, Ok._lock: [Ok]Tid , Ok._state_p: [Ok]State, Ok.y_p: [Ok]int, Ok._lock_p: [Ok]Tid): bool
{                                                                                                   
 (forall this: Ok :: Y_Ok.y(tid : Tid, this, Ok.y_p[this] , Ok._state, Ok.y, Ok._lock))             
 && (forall this: Ok :: Y_Ok._lock(tid : Tid, this, Ok._lock_p[this] , Ok._state, Ok.y, Ok._lock))  
 && (forall _i : Ok :: isShared(Ok._state[_i]) ==> isShared(Ok._state_p[_i]))                       
 && (forall _i : Ok :: isLocal(Ok._state[_i], tid) <==> isLocal(Ok._state_p[_i], tid))              
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 446.1-568.2: (Method:4.3)
// 453.1-453.24: (4.3): Bad tid
// 454.1-454.36: (4.3): this is not global
// 501.1-501.26: (5.15): Cannot have potential null deference in left-mover part.
// 505.1-505.27: (5.15): Reduction failure
// 507.2-509.2: (class anchor.sink.VarDeclStmt:6.4)
// 510.2-512.2: (class anchor.sink.VarDeclStmt:6.4)
// 513.2-530.21: (class anchor.sink.Read:6.4)
// 525.1-525.26: (6.4): Cannot have potential null deference in left-mover part.
// 529.1-529.27: (6.4): Reduction failure
// 531.2-534.19: (class anchor.sink.Assign:6.4)
// 536.2-552.21: (class anchor.sink.Write:6.4)
// 548.1-548.26: (6.4): Cannot have potential null deference in left-mover part.
// 551.1-551.27: (6.4): Reduction failure
// 556.1-556.26: (7.2): Cannot have potential null deference in left-mover part.
// 558.1-558.31: (7.2): lock not held
// 560.1-560.27: (7.2): Reduction failure
// 562.2-567.9: (class anchor.sink.Return:4.22)
// 642.1-642.34: (3.3): Ok.y failed Write-Write Right-Mover Check
// 699.1-699.30: (3.3): Ok.y failed Write-Read Right-Mover Check
// 760.1-760.34: (3.3): Ok.y failed Write-Write Left-Mover Check
// 818.1-818.30: (3.3): Ok.y failed Write-Read Left-Mover Check
// 873.1-873.34: (3.3): Ok.y failed Read-Write Right-Mover Check
// 931.1-931.34: (3.3): Ok.y failed Read-Write Left-Mover Check
// 1000.1-1000.140: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.1)
// 1001.1-1001.101: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.2)
// 1002.1-1002.158: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case A.3)
// 1095.1-1095.140: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case C)
// 1193.1-1193.144: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case D)
// 1194.1-1194.144: (3.3): Ok.y is not Write-Write Stable with respect to Ok.y (case R)
// 1263.1-1263.136: (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case F)
// 1264.1-1264.136: (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case H)
// 1265.1-1265.146: (3.3): Ok.y is not Read-Write Stable with respect to Ok.y (case I)
// 1333.1-1333.136: (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case J)
// 1334.1-1334.136: (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case K)
// 1335.1-1335.99: (3.3): Ok.y is not Write-Read Stable with respect to Ok.y (case L)
// 1366.1-1385.2: (3.3): yields_as clause for Ok.y is not valid
// 1390.1-1404.2: (3.3): yields_as clause for Ok.y is not reflexive
// 1410.1-1438.2: (3.3): yields_as clause for Ok.y is not transitive
// 1458.1-1477.2: (7.32): yields_as clause for Ok._lock is not valid
// 1482.1-1496.2: (7.32): yields_as clause for Ok._lock is not reflexive
// 1502.1-1530.2: (7.32): yields_as clause for Ok._lock is not transitive
