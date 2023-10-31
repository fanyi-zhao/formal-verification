                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/or.anchor:                              
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Or {                                                                                      
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      boolean f() {                                                                                 
        boolean a;                                                                                  
        boolean b;                                                                                  
        boolean c;                                                                                  
        boolean w;                                                                                  
        if (a) {                                                                                    
          w = true;                                                                                 
        } else {                                                                                    
          if (b) {                                                                                  
            w = c;                                                                                  
          } else {                                                                                  
            w = false;                                                                              
          }                                                                                         
        }                                                                                           
         return false;                                                                              
        // return false;                                                                            
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Or {                                                                                      
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      boolean f() {                                                                                 
        boolean a;                                                                                  
        boolean b;                                                                                  
        boolean c;                                                                                  
        boolean w;                                                                                  
        if (a) {                                                                                    
          w = true;                                                                                 
        } else {                                                                                    
          if (b) {                                                                                  
            w = c;                                                                                  
          } else {                                                                                  
            w = false;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Or {                                                                                      
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      boolean f() {                                                                                 
        boolean a;                                                                                  
        boolean b;                                                                                  
        boolean c;                                                                                  
        boolean w;                                                                                  
        if (a) {                                                                                    
          w = true;                                                                                 
        } else {                                                                                    
          if (b) {                                                                                  
            w = c;                                                                                  
          } else {                                                                                  
            w = false;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Or {                                                                                      
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      boolean f() {                                                                                 
        boolean a;                                                                                  
        boolean b;                                                                                  
        boolean c;                                                                                  
        boolean w;                                                                                  
        if (a) {                                                                                    
          w = true;                                                                                 
        } else {                                                                                    
          if (b) {                                                                                  
            w = c;                                                                                  
          } else {                                                                                  
            w = false;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl Or ***/                                                                             
                                                                                                    
type Or;                                                                                            
const unique Or.null: Or;                                                                           
var Or._state: [Or]State;                                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Or._lock: [Or]Tid;                                                                              
                                                                                                    
function {:inline} ReadEval.Or._lock(tid: Tid,this : Or,Or._state: [Or]State,Or._lock: [Or]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Or._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Or._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Or._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Or._lock[this]==tid)&&(newValue==Tid.null))) then                                         
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Or._lock(tid: Tid,this : Or,newValue: Tid,Or._state: [Or]State,Or._lock: [Or]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Or._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Or._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Or._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Or._lock[this]==tid)&&(newValue==Tid.null))) then                                         
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
                                                                                                    
 function {:inline} StateInvariant(Or._state: [Or]State,Or._lock: [Or]Tid) returns (bool) {         
  true &&                                                                                           
  (forall _i: Or  :: _i == Or.null <==> isNull(Or._state[_i])) &&                                   
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Or._state, Or._lock);                                                       
requires ValidTid(tid);                                                                             
modifies Or._state;                                                                                 
modifies Or._lock;                                                                                  
ensures StateInvariant(Or._state, Or._lock);                                                        
ensures Y(tid , old(Or._state), old(Or._lock) , Or._state, Or._lock);                               
                                                                                                    
// Or._lock:                                                                                        
                                                                                                    
function {:inline} Y_Or._lock(tid : Tid, this: Or, newValue: Tid , Or._state: [Or]State, Or._lock: [Or]Tid): bool
{                                                                                                   
 ((isAccessible(Or._state[this], tid) && leq(m#moverPath(ReadEval.Or._lock(tid: Tid,this: Or,Or._state,Or._lock)), _R)) ==> (Or._lock[this] == newValue))
 &&(((Or._lock[this]==tid)==(newValue==tid)))                                                       
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Or._lock(tid : Tid, this: Or, newValue: Tid , Or._state: [Or]State, Or._lock: [Or]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Or._lock.Subsumes.W(tid : Tid, u : Tid, this: Or, newValue: Tid , Or._state: [Or]State, Or._lock: [Or]Tid)
 requires StateInvariant(Or._state, Or._lock);                                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Or._state_yield: [Or]State;                                                                     
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Or._lock_yield: [Or]Tid;                                                                        
var this_yield: Or;                                                                                 
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Or._state[this], tid);                                                         
 assume isAccessible(Or._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.Or._lock(u: Tid,this: Or,newValue: Tid,Or._state,Or._lock)));
 assume leq(m#moverPath(ReadEval.Or._lock(tid: Tid,this: Or,Or._state,Or._lock)), _N);              
assume Or._state_yield == Or._state && Or._lock_yield == Or._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Or._lock(tid, this, newValue , Or._state, Or._lock);                                      
}                                                                                                   
                                                                                                    
procedure Y_Or._lock.Reflexive(tid : Tid, this: Or , Or._state: [Or]State, Or._lock: [Or]Tid)       
 requires StateInvariant(Or._state, Or._lock);                                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Or._state_yield: [Or]State;                                                                     
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Or._lock_yield: [Or]Tid;                                                                        
var this_yield: Or;                                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Or._state[this], tid);                                                         
assume Or._state_yield == Or._state && Or._lock_yield == Or._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Or._lock(tid, this, Or._lock[this] , Or._state, Or._lock);                                
}                                                                                                   
                                                                                                    
procedure Y_Or._lock.Transitive(tid : Tid, this: Or, newValue : Tid , Or._state: [Or]State, Or._lock: [Or]Tid , Or._state_p: [Or]State, Or._lock_p: [Or]Tid)
 requires StateInvariant(Or._state, Or._lock);                                                      
 requires StateInvariant(Or._state_p, Or._lock_p);                                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Or._lock_pre: [Or]Tid;                                                                          
var Or._state_pre: [Or]State;                                                                       
var $recorded.state_pre: int;                                                                       
var this_pre: Or;                                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Or._lock_post: [Or]Tid;                                                                         
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var this_post: Or;                                                                                  
var Or._state_post: [Or]State;                                                                      
var newValue_post: Tid;                                                                             
                                                                                                    
assume Or._state_pre == Or._state && Or._lock_pre == Or._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Or._state[this], tid);                                                         
 assume Y(tid , Or._state, Or._lock , Or._state_p, Or._lock_p);                                     
 assume Y_Or._lock(tid, this, newValue , Or._state_p, Or._lock_p);                                  
assume Or._state_post == Or._state_p && Or._lock_post == Or._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Or._lock(tid, this, newValue , Or._state, Or._lock);                                      
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Or._state: [Or]State, Or._lock: [Or]Tid , Or._state_p: [Or]State, Or._lock_p: [Or]Tid): bool
{                                                                                                   
 (forall this: Or :: Y_Or._lock(tid : Tid, this, Or._lock_p[this] , Or._state, Or._lock))           
 && (forall _i : Or :: isShared(Or._state[_i]) ==> isShared(Or._state_p[_i]))                       
 && (forall _i : Or :: isLocal(Or._state[_i], tid) <==> isLocal(Or._state_p[_i], tid))              
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 468.1-486.2: (7.32): yields_as clause for Or._lock is not valid
// 491.1-504.2: (7.32): yields_as clause for Or._lock is not reflexive
// 510.1-536.2: (7.32): yields_as clause for Or._lock is not transitive
