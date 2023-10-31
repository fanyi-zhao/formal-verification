                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/parser-bug-1.sink:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class D {                                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f() {                                                                                    
         return;                                                                                    
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class D {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f() {                                                                                    
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class D {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f() {                                                                                    
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class D {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f() {                                                                                    
        {                                                                                           
           return;                                                                                  
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
                                                                                                    
                                                                                                    
/*** Class Decl D ***/                                                                              
                                                                                                    
type D;                                                                                             
const unique D.null: D;                                                                             
var D._state: [D]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var D._lock: [D]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.D._lock(tid: Tid,this : D,D._state: [D]State,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(D._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((D._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((D._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((D._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.D._lock(tid: Tid,this : D,newValue: Tid,D._state: [D]State,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(D._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((D._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((D._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((D._lock[this]==tid)&&(newValue==Tid.null))) then                                          
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
                                                                                                    
 function {:inline} StateInvariant(D._state: [D]State,D._lock: [D]Tid) returns (bool) {             
  true &&                                                                                           
  (forall _i: D  :: _i == D.null <==> isNull(D._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(D._state, D._lock);                                                         
requires ValidTid(tid);                                                                             
modifies D._state;                                                                                  
modifies D._lock;                                                                                   
ensures StateInvariant(D._state, D._lock);                                                          
ensures Y(tid , old(D._state), old(D._lock) , D._state, D._lock);                                   
                                                                                                    
// D._lock:                                                                                         
                                                                                                    
function {:inline} Y_D._lock(tid : Tid, this: D, newValue: Tid , D._state: [D]State, D._lock: [D]Tid): bool
{                                                                                                   
 ((isAccessible(D._state[this], tid) && leq(m#moverPath(ReadEval.D._lock(tid: Tid,this: D,D._state,D._lock)), _R)) ==> (D._lock[this] == newValue))
 &&(((D._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_D._lock(tid : Tid, this: D, newValue: Tid , D._state: [D]State, D._lock: [D]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Subsumes.W(tid : Tid, u : Tid, this: D, newValue: Tid , D._state: [D]State, D._lock: [D]Tid)
 requires StateInvariant(D._state, D._lock);                                                        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var newValue_yield: Tid;                                                                            
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume isAccessible(D._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.D._lock(u: Tid,this: D,newValue: Tid,D._state,D._lock)));    
 assume leq(m#moverPath(ReadEval.D._lock(tid: Tid,this: D,D._state,D._lock)), _N);                  
assume D._state_yield == D._state && D._lock_yield == D._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D._lock(tid, this, newValue , D._state, D._lock);                                         
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Reflexive(tid : Tid, this: D , D._state: [D]State, D._lock: [D]Tid)             
 requires StateInvariant(D._state, D._lock);                                                        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
assume D._state_yield == D._state && D._lock_yield == D._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D._lock(tid, this, D._lock[this] , D._state, D._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Transitive(tid : Tid, this: D, newValue : Tid , D._state: [D]State, D._lock: [D]Tid , D._state_p: [D]State, D._lock_p: [D]Tid)
 requires StateInvariant(D._state, D._lock);                                                        
 requires StateInvariant(D._state_p, D._lock_p);                                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var D._lock_pre: [D]Tid;                                                                            
var $recorded.state_pre: int;                                                                       
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var this_pre: D;                                                                                    
                                                                                                    
var $recorded.state_post: int;                                                                      
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var this_post: D;                                                                                   
                                                                                                    
assume D._state_pre == D._state && D._lock_pre == D._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume Y(tid , D._state, D._lock , D._state_p, D._lock_p);                                         
 assume Y_D._lock(tid, this, newValue , D._state_p, D._lock_p);                                     
assume D._state_post == D._state_p && D._lock_post == D._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_D._lock(tid, this, newValue , D._state, D._lock);                                         
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , D._state: [D]State, D._lock: [D]Tid , D._state_p: [D]State, D._lock_p: [D]Tid): bool
{                                                                                                   
 (forall this: D :: Y_D._lock(tid : Tid, this, D._lock_p[this] , D._state, D._lock))                
 && (forall _i : D :: isShared(D._state[_i]) ==> isShared(D._state_p[_i]))                          
 && (forall _i : D :: isLocal(D._state[_i], tid) <==> isLocal(D._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 390.1-408.2: (7.32): yields_as clause for D._lock is not valid
// 413.1-426.2: (7.32): yields_as clause for D._lock is not reflexive
// 432.1-458.2: (7.32): yields_as clause for D._lock is not transitive
