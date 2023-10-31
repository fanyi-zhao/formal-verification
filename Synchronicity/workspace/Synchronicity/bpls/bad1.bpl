                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/bad1.anchor:                             
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Bad {                                                                                     
      volatile int y isLocal(this, tid) ? B : N                                                     
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.y == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        int tmp1;                                                                                   
        int tmp2;                                                                                   
        tmp2 := this.y;                                                                             
        tmp1 = tmp2 + 1;                                                                            
        this.y := tmp1;                                                                             
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Bad {                                                                                     
      volatile int y isLocal(this, tid) ? B : N                                                     
                                                                                                    
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
        int tmp1;                                                                                   
        int tmp2;                                                                                   
        tmp2 := this.y;                                                                             
        tmp1 = tmp2 + 1;                                                                            
        this.y := tmp1;                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Bad {                                                                                     
      volatile int y isLocal(this, tid) ? B : N                                                     
                                                                                                    
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
        int tmp1;                                                                                   
        int tmp2;                                                                                   
        tmp2 := this.y;                                                                             
        tmp1 = tmp2 + 1;                                                                            
        this.y := tmp1;                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Bad {                                                                                     
      volatile int y isLocal(this, tid) ? B : N                                                     
                                                                                                    
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
        int tmp1;                                                                                   
        int tmp2;                                                                                   
        tmp2 := this.y;                                                                             
        tmp1 = tmp2 + 1;                                                                            
        this.y := tmp1;                                                                             
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
                                                                                                    
                                                                                                    
/*** Class Decl Bad ***/                                                                            
                                                                                                    
type Bad;                                                                                           
const unique Bad.null: Bad;                                                                         
var Bad._state: [Bad]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Bad.y: [Bad]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Bad.y(tid: Tid,this : Bad,Bad._state: [Bad]State,Bad.y: [Bad]int,Bad._lock: [Bad]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Bad._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Bad.y(tid: Tid,this : Bad,newValue: int,Bad._state: [Bad]State,Bad.y: [Bad]int,Bad._lock: [Bad]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Bad._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Bad._lock: [Bad]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Bad._lock(tid: Tid,this : Bad,Bad._state: [Bad]State,Bad.y: [Bad]int,Bad._lock: [Bad]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Bad._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Bad._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Bad._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Bad._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Bad._lock(tid: Tid,this : Bad,newValue: Tid,Bad._state: [Bad]State,Bad.y: [Bad]int,Bad._lock: [Bad]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Bad._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Bad._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Bad._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Bad._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Bad.inc(tid:Tid, this : Bad)                                                             
modifies Bad._state;                                                                                
modifies Bad.y;                                                                                     
modifies Bad._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (5.2): Bad tid
requires isShared(Bad._state[this]);                                                                       // (5.2): this is not global
                                                                                                    
requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                              
                                                                                                    
ensures StateInvariant(Bad._state, Bad.y, Bad._lock);                                               
{                                                                                                   
 var tid413453: Tid;                                                                                
 var $recorded.state413464: int;                                                                    
 var $pc413463: Phase;                                                                              
 var $recorded.state413463: int;                                                                    
 var Bad._lock413463: [Bad]Tid;                                                                     
 var tmp1413464: int;                                                                               
 var Bad.y413453: [Bad]int;                                                                         
 var Bad.y413464: [Bad]int;                                                                         
 var Bad._state413463: [Bad]State;                                                                  
 var Bad._lock413453: [Bad]Tid;                                                                     
 var path413453: int;                                                                               
 var tid413463: Tid;                                                                                
 var mover413453: Mover;                                                                            
 var mover413463: Mover;                                                                            
 var moverPath413453: MoverPath;                                                                    
 var tid413464: Tid;                                                                                
 var tmp1: int;                                                                                     
 var tmp2413464: int;                                                                               
 var tmp2413463: int;                                                                               
 var path413463: int;                                                                               
 var this413453: Bad;                                                                               
 var this413464: Bad;                                                                               
 var Bad.y413463: [Bad]int;                                                                         
 var this413463: Bad;                                                                               
 var $pc413453: Phase;                                                                              
 var Bad._state413453: [Bad]State;                                                                  
 var moverPath413463: MoverPath;                                                                    
 var tmp2413453: int;                                                                               
 var tmp1413463: int;                                                                               
 var Bad._lock413464: [Bad]Tid;                                                                     
 var tmp1413453: int;                                                                               
 var tmp2: int;                                                                                     
 var $recorded.state413453: int;                                                                    
 var Bad._state413464: [Bad]State;                                                                  
 var $pc413464: Phase;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 6.3: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 6.3: int tmp2;                                                                                  
                                                                                                    
                                                                                                    
 // 6.3: tmp2 := this.y;                                                                            
                                                                                                    
                                                                                                    
 moverPath413453 := ReadEval.Bad.y(tid: Tid,this: Bad,Bad._state,Bad.y,Bad._lock);                  
 mover413453 := m#moverPath(moverPath413453);                                                       
 path413453 := p#moverPath(moverPath413453);                                                        
 assume Bad._state413453 == Bad._state && Bad.y413453 == Bad.y && Bad._lock413453 == Bad._lock && tmp2413453 == tmp2 && tmp1413453 == tmp1 && this413453 == this && tid413453 == tid && $pc413453 == $pc;
 assume $recorded.state413453 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Bad.null;                                                                          
 } else {                                                                                           
  assert this != Bad.null;                                                                                 // (6.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover413453);                                                               
 assert $pc != PhaseError;                                                                                 // (6.3): Reduction failure
 tmp2 := Bad.y[this];                                                                               
                                                                                                    
 // 6.3: tmp1 = tmp2 + 1;                                                                           
                                                                                                    
 tmp1 := (tmp2+1);                                                                                  
                                                                                                    
                                                                                                    
 // 6.3: this.y := tmp1;                                                                            
                                                                                                    
                                                                                                    
 moverPath413463 := WriteEval.Bad.y(tid: Tid,this: Bad,tmp1: int,Bad._state,Bad.y,Bad._lock);       
 mover413463 := m#moverPath(moverPath413463);                                                       
 path413463 := p#moverPath(moverPath413463);                                                        
 assume Bad._state413463 == Bad._state && Bad.y413463 == Bad.y && Bad._lock413463 == Bad._lock && tmp2413463 == tmp2 && tmp1413463 == tmp1 && this413463 == this && tid413463 == tid && $pc413463 == $pc;
 assume $recorded.state413463 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Bad.null;                                                                          
 } else {                                                                                           
  assert this != Bad.null;                                                                                 // (6.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover413463);                                                               
 assert $pc != PhaseError;                                                                                 // (6.3): Reduction failure
 Bad.y[this] := tmp1;                                                                               
                                                                                                    
 // 5.21: // return;                                                                                
                                                                                                    
 assume Bad._state413464 == Bad._state && Bad.y413464 == Bad.y && Bad._lock413464 == Bad._lock && tmp2413464 == tmp2 && tmp1413464 == tmp1 && this413464 == this && tid413464 == tid;
 assume $recorded.state413464 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Bad._state: [Bad]State,Bad.y: [Bad]int,Bad._lock: [Bad]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Bad  :: _i == Bad.null <==> isNull(Bad._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Bad.y[x] := v;                                                                                     
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Bad.y(u: Tid,x: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Bad.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                 
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Bad.y[x] := v;                                                                                     
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Bad.y(u: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.2): Bad.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                 
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Bad.y[x];                                                                              
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Bad.y[x] := havocValue;                                                                            
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Bad.y(u: Tid,x: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Bad.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                  
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Bad.y[x];                                                                              
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Bad.y(u: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.2): Bad.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                      
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Bad.y(t: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Bad.y(u: Tid,x: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Bad.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Bad.y(t: Tid, u: Tid, v: int, w: int, x: Bad)                       
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[x], u);                                                           
 modifies Bad.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Bad.y[x];                                                                              
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Bad.y(t: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Bad.y[x] := havocValue;                                                                            
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Bad.y(u: Tid,x: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Bad.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Bad.y.Bad.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Bad, y: Bad)      
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[y], u);                                                           
 modifies Bad.y;                                                                                    
 modifies Bad.y;                                                                                    
                                                                                                    
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
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: Bad;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Bad;                                                                                   
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Bad.y[x] := v;                                                                                     
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Bad.y.Bad.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Bad, y: Bad)      
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[y], u);                                                           
 modifies Bad.y;                                                                                    
 modifies Bad.y;                                                                                    
                                                                                                    
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
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: Bad;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Bad._state_mid: [Bad]State;                                                                    
 var y_mid: Bad;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Bad._lock_mid: [Bad]Tid;                                                                       
 var Bad.y_mid: [Bad]int;                                                                           
 var v_mid: int;                                                                                    
 var x_mid: Bad;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Bad;                                                                                   
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Bad.y[x];                                                                                  
 Bad.y[x] := v;                                                                                     
                                                                                                    
 assume Bad._state_mid == Bad._state && Bad.y_mid == Bad.y && Bad._lock_mid == Bad._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Bad.y[x] := tmpV;                                                                                  
 Bad.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Bad.y.Bad.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Bad, y: Bad)     
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[y], u);                                                           
 modifies Bad.y;                                                                                    
 modifies Bad.y;                                                                                    
                                                                                                    
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
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: Bad;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Bad._state_mid: [Bad]State;                                                                    
 var y_mid: Bad;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Bad._lock_mid: [Bad]Tid;                                                                       
 var Bad.y_mid: [Bad]int;                                                                           
 var v_mid: int;                                                                                    
 var x_mid: Bad;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Bad;                                                                                   
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Bad.y[x];                                                                                  
 Bad.y[x] := v;                                                                                     
 assume Bad._state_mid == Bad._state && Bad.y_mid == Bad.y && Bad._lock_mid == Bad._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Bad.y[x] := tmpV;                                                                                  
 Bad.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Bad.y.Bad.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Bad, y: Bad)    
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[y], u);                                                           
 modifies Bad.y;                                                                                    
 modifies Bad.y;                                                                                    
                                                                                                    
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
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: Bad;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Bad;                                                                                   
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Bad.y(t: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Bad.y(u: Tid,y: Bad,w: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Bad.y[y] := w;                                                                                     
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Bad.y(t: Tid,x: Bad,Bad._state,Bad.y,Bad._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Bad.y.Bad.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Bad, y: Bad)    
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Bad._state[x], t);                                                           
 requires isAccessible(Bad._state[y], u);                                                           
 modifies Bad.y;                                                                                    
 modifies Bad.y;                                                                                    
                                                                                                    
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
 var Bad._state_pre: [Bad]State;                                                                    
 var Bad.y_pre: [Bad]int;                                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Bad;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Bad._lock_pre: [Bad]Tid;                                                                       
 var t_pre: Tid;                                                                                    
 var y_pre: Bad;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Bad._state_post: [Bad]State;                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Bad;                                                                                   
 var Bad._lock_post: [Bad]Tid;                                                                      
 var Bad.y_post: [Bad]int;                                                                          
 var x_post: Bad;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Bad.y(u: Tid,y: Bad,Bad._state,Bad.y,Bad._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Bad.y(t: Tid,x: Bad,v: int,Bad._state,Bad.y,Bad._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Bad.y[x] := v;                                                                                     
 assume Bad._state_post == Bad._state && Bad.y_post == Bad.y && Bad._lock_post == Bad._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Bad.y(u: Tid,y: Bad,Bad._state,Bad.y,Bad._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                              
requires ValidTid(tid);                                                                             
modifies Bad._state;                                                                                
modifies Bad.y;                                                                                     
modifies Bad._lock;                                                                                 
ensures StateInvariant(Bad._state, Bad.y, Bad._lock);                                               
ensures Y(tid , old(Bad._state), old(Bad.y), old(Bad._lock) , Bad._state, Bad.y, Bad._lock);        
                                                                                                    
// Bad.y:                                                                                           
                                                                                                    
function {:inline} Y_Bad.y(tid : Tid, this: Bad, newValue: int , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid): bool
{                                                                                                   
 ((isAccessible(Bad._state[this], tid) && leq(m#moverPath(ReadEval.Bad.y(tid: Tid,this: Bad,Bad._state,Bad.y,Bad._lock)), _R)) ==> (Bad.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Bad.y(tid : Tid, this: Bad, newValue: int , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Bad.y.Subsumes.W(tid : Tid, u : Tid, this: Bad, newValue: int , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Bad._state_yield: [Bad]State;                                                                   
var tid_yield: Tid;                                                                                 
var Bad.y_yield: [Bad]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var this_yield: Bad;                                                                                
var Bad._lock_yield: [Bad]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
 assume isAccessible(Bad._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Bad.y(u: Tid,this: Bad,newValue: int,Bad._state,Bad.y,Bad._lock)));
                                                                                                    
assume Bad._state_yield == Bad._state && Bad.y_yield == Bad.y && Bad._lock_yield == Bad._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Bad.y(tid, this, newValue , Bad._state, Bad.y, Bad._lock);                                
}                                                                                                   
                                                                                                    
procedure Y_Bad.y.Reflexive(tid : Tid, this: Bad , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Bad._state_yield: [Bad]State;                                                                   
var tid_yield: Tid;                                                                                 
var Bad.y_yield: [Bad]int;                                                                          
var $pc_yield: Phase;                                                                               
var this_yield: Bad;                                                                                
var Bad._lock_yield: [Bad]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
assume Bad._state_yield == Bad._state && Bad.y_yield == Bad.y && Bad._lock_yield == Bad._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Bad.y(tid, this, Bad.y[this] , Bad._state, Bad.y, Bad._lock);                             
}                                                                                                   
                                                                                                    
procedure Y_Bad.y.Transitive(tid : Tid, this: Bad, newValue : int , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid , Bad._state_p: [Bad]State, Bad.y_p: [Bad]int, Bad._lock_p: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires StateInvariant(Bad._state_p, Bad.y_p, Bad._lock_p);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Bad._state_pre: [Bad]State;                                                                     
var Bad.y_pre: [Bad]int;                                                                            
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Bad;                                                                                  
var Bad._lock_pre: [Bad]Tid;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var Bad._state_post: [Bad]State;                                                                    
var $pc_post: Phase;                                                                                
var Bad._lock_post: [Bad]Tid;                                                                       
var tid_post: Tid;                                                                                  
var Bad.y_post: [Bad]int;                                                                           
var this_post: Bad;                                                                                 
                                                                                                    
assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
 assume Y(tid , Bad._state, Bad.y, Bad._lock , Bad._state_p, Bad.y_p, Bad._lock_p);                 
 assume Y_Bad.y(tid, this, newValue , Bad._state_p, Bad.y_p, Bad._lock_p);                          
assume Bad._state_post == Bad._state_p && Bad.y_post == Bad.y_p && Bad._lock_post == Bad._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Bad.y(tid, this, newValue , Bad._state, Bad.y, Bad._lock);                                
}                                                                                                   
// Bad._lock:                                                                                       
                                                                                                    
function {:inline} Y_Bad._lock(tid : Tid, this: Bad, newValue: Tid , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid): bool
{                                                                                                   
 ((isAccessible(Bad._state[this], tid) && leq(m#moverPath(ReadEval.Bad._lock(tid: Tid,this: Bad,Bad._state,Bad.y,Bad._lock)), _R)) ==> (Bad._lock[this] == newValue))
 &&(((Bad._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Bad._lock(tid : Tid, this: Bad, newValue: Tid , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Bad._lock.Subsumes.W(tid : Tid, u : Tid, this: Bad, newValue: Tid , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Bad._state_yield: [Bad]State;                                                                   
var tid_yield: Tid;                                                                                 
var Bad.y_yield: [Bad]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var this_yield: Bad;                                                                                
var Bad._lock_yield: [Bad]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
 assume isAccessible(Bad._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Bad._lock(u: Tid,this: Bad,newValue: Tid,Bad._state,Bad.y,Bad._lock)));
 assume leq(m#moverPath(ReadEval.Bad._lock(tid: Tid,this: Bad,Bad._state,Bad.y,Bad._lock)), _N);    
assume Bad._state_yield == Bad._state && Bad.y_yield == Bad.y && Bad._lock_yield == Bad._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Bad._lock(tid, this, newValue , Bad._state, Bad.y, Bad._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_Bad._lock.Reflexive(tid : Tid, this: Bad , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Bad._state_yield: [Bad]State;                                                                   
var tid_yield: Tid;                                                                                 
var Bad.y_yield: [Bad]int;                                                                          
var $pc_yield: Phase;                                                                               
var this_yield: Bad;                                                                                
var Bad._lock_yield: [Bad]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
assume Bad._state_yield == Bad._state && Bad.y_yield == Bad.y && Bad._lock_yield == Bad._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Bad._lock(tid, this, Bad._lock[this] , Bad._state, Bad.y, Bad._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Bad._lock.Transitive(tid : Tid, this: Bad, newValue : Tid , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid , Bad._state_p: [Bad]State, Bad.y_p: [Bad]int, Bad._lock_p: [Bad]Tid)
 requires StateInvariant(Bad._state, Bad.y, Bad._lock);                                             
 requires StateInvariant(Bad._state_p, Bad.y_p, Bad._lock_p);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Bad._state_pre: [Bad]State;                                                                     
var Bad.y_pre: [Bad]int;                                                                            
var $recorded.state_pre: int;                                                                       
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Bad;                                                                                  
var Bad._lock_pre: [Bad]Tid;                                                                        
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Bad._state_post: [Bad]State;                                                                    
var $pc_post: Phase;                                                                                
var Bad._lock_post: [Bad]Tid;                                                                       
var tid_post: Tid;                                                                                  
var Bad.y_post: [Bad]int;                                                                           
var this_post: Bad;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Bad._state_pre == Bad._state && Bad.y_pre == Bad.y && Bad._lock_pre == Bad._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Bad._state[this], tid);                                                        
 assume Y(tid , Bad._state, Bad.y, Bad._lock , Bad._state_p, Bad.y_p, Bad._lock_p);                 
 assume Y_Bad._lock(tid, this, newValue , Bad._state_p, Bad.y_p, Bad._lock_p);                      
assume Bad._state_post == Bad._state_p && Bad.y_post == Bad.y_p && Bad._lock_post == Bad._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Bad._lock(tid, this, newValue , Bad._state, Bad.y, Bad._lock);                            
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Bad._state: [Bad]State, Bad.y: [Bad]int, Bad._lock: [Bad]Tid , Bad._state_p: [Bad]State, Bad.y_p: [Bad]int, Bad._lock_p: [Bad]Tid): bool
{                                                                                                   
 (forall this: Bad :: Y_Bad.y(tid : Tid, this, Bad.y_p[this] , Bad._state, Bad.y, Bad._lock))       
 && (forall this: Bad :: Y_Bad._lock(tid : Tid, this, Bad._lock_p[this] , Bad._state, Bad.y, Bad._lock))
 && (forall _i : Bad :: isShared(Bad._state[_i]) ==> isShared(Bad._state_p[_i]))                    
 && (forall _i : Bad :: isLocal(Bad._state[_i], tid) <==> isLocal(Bad._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 426.1-532.2: (Method:5.2)
// 433.1-433.24: (5.2): Bad tid
// 434.1-434.37: (5.2): this is not global
// 480.2-482.2: (class anchor.sink.VarDeclStmt:6.3)
// 483.2-485.2: (class anchor.sink.VarDeclStmt:6.3)
// 486.2-503.22: (class anchor.sink.Read:6.3)
// 498.1-498.27: (6.3): Cannot have potential null deference in left-mover part.
// 502.1-502.27: (6.3): Reduction failure
// 504.2-507.19: (class anchor.sink.Assign:6.3)
// 509.2-525.22: (class anchor.sink.Write:6.3)
// 521.1-521.27: (6.3): Cannot have potential null deference in left-mover part.
// 524.1-524.27: (6.3): Reduction failure
// 526.2-531.9: (class anchor.sink.Return:5.21)
// 606.1-606.34: (4.2): Bad.y failed Write-Write Right-Mover Check
// 663.1-663.30: (4.2): Bad.y failed Write-Read Right-Mover Check
// 724.1-724.34: (4.2): Bad.y failed Write-Write Left-Mover Check
// 782.1-782.30: (4.2): Bad.y failed Write-Read Left-Mover Check
// 837.1-837.34: (4.2): Bad.y failed Read-Write Right-Mover Check
// 895.1-895.34: (4.2): Bad.y failed Read-Write Left-Mover Check
// 964.1-964.140: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.1)
// 965.1-965.101: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.2)
// 966.1-966.158: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case A.3)
// 1059.1-1059.140: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case C)
// 1157.1-1157.144: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case D)
// 1158.1-1158.144: (4.2): Bad.y is not Write-Write Stable with respect to Bad.y (case R)
// 1227.1-1227.136: (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case F)
// 1228.1-1228.136: (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case H)
// 1229.1-1229.146: (4.2): Bad.y is not Read-Write Stable with respect to Bad.y (case I)
// 1297.1-1297.136: (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case J)
// 1298.1-1298.136: (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case K)
// 1299.1-1299.99: (4.2): Bad.y is not Write-Read Stable with respect to Bad.y (case L)
// 1330.1-1349.2: (4.2): yields_as clause for Bad.y is not valid
// 1354.1-1368.2: (4.2): yields_as clause for Bad.y is not reflexive
// 1374.1-1402.2: (4.2): yields_as clause for Bad.y is not transitive
// 1422.1-1441.2: (7.32): yields_as clause for Bad._lock is not valid
// 1446.1-1460.2: (7.32): yields_as clause for Bad._lock is not reflexive
// 1466.1-1494.2: (7.32): yields_as clause for Bad._lock is not transitive
