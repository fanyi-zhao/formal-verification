                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/tid-axiom.anchor:                       
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        tmp2 = tid == 0;                                                                            
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = tid == 1;                                                                          
        }                                                                                           
        assert tmp1 /* == tid == 0 || tid == 1 */;                                                  
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        tmp2 = tid == 0;                                                                            
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = tid == 1;                                                                          
        }                                                                                           
        assert tmp1 /* == tid == 0 || tid == 1 */;                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        tmp2 = tid == 0;                                                                            
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = tid == 1;                                                                          
        }                                                                                           
        assert tmp1 /* == tid == 0 || tid == 1 */;                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        tmp2 = tid == 0;                                                                            
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = tid == 1;                                                                          
        }                                                                                           
        assert tmp1 /* == tid == 0 || tid == 1 */;                                                  
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
  tid != Tid.null && tid >= 0  && tid <= 1                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl A ***/                                                                              
                                                                                                    
type A;                                                                                             
const unique A.null: A;                                                                             
var A._state: [A]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  A.f(tid:Tid, this : A)                                                                   
modifies A._state;                                                                                  
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (5.3): Bad tid
requires isShared(A._state[this]);                                                                         // (5.3): this is not global
                                                                                                    
requires StateInvariant(A._state, A._lock);                                                         
                                                                                                    
ensures StateInvariant(A._state, A._lock);                                                          
{                                                                                                   
 var $recorded.state4602999: int;                                                                   
 var tmp24602999: bool;                                                                             
 var tmp14602998: bool;                                                                             
 var A._lock4602999: [A]Tid;                                                                        
 var A._state4602999: [A]State;                                                                     
 var this4602998: A;                                                                                
 var tmp1: bool;                                                                                    
 var tid4602999: Tid;                                                                               
 var tmp2: bool;                                                                                    
 var tid4602998: Tid;                                                                               
 var A._state4602998: [A]State;                                                                     
 var this4602999: A;                                                                                
 var $pc4602999: Phase;                                                                             
 var tmp24602998: bool;                                                                             
 var $recorded.state4602998: int;                                                                   
 var tmp14602999: bool;                                                                             
 var A._lock4602998: [A]Tid;                                                                        
 var $pc4602998: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 6.7: boolean tmp1;                                                                              
                                                                                                    
                                                                                                    
 // 6.7: boolean tmp2;                                                                              
                                                                                                    
                                                                                                    
 // 6.7: tmp2 = tid == 0;                                                                           
                                                                                                    
 tmp2 := (tid==0);                                                                                  
 if (tmp2) {                                                                                        
                                                                                                    
  // <undefined position>: tmp1 = true;                                                             
                                                                                                    
  tmp1 := true;                                                                                     
 } else {                                                                                           
                                                                                                    
  // 6.30: tmp1 = tid == 1;                                                                         
                                                                                                    
  tmp1 := (tid==1);                                                                                 
 }                                                                                                  
                                                                                                    
 // 6.7: assert tmp1 /* == tid == 0 || tid == 1 */;                                                 
                                                                                                    
 assume A._state4602998 == A._state && A._lock4602998 == A._lock && tmp24602998 == tmp2 && tmp14602998 == tmp1 && this4602998 == this && tid4602998 == tid;
 assume $recorded.state4602998 == 1;                                                                
 assert tmp1 /* lowered ((tid==0)||(tid==1)) */;                                                           // (6.7): This assertion may not hold.
                                                                                                    
 // 5.19: // return;                                                                                
                                                                                                    
 assume A._state4602999 == A._state && A._lock4602999 == A._lock && tmp24602999 == tmp2 && tmp14602999 == tmp1 && this4602999 == this && tid4602999 == tid;
 assume $recorded.state4602999 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A._lock: [A]Tid) returns (bool) {             
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(A._state, A._lock);                                                         
requires ValidTid(tid);                                                                             
modifies A._state;                                                                                  
modifies A._lock;                                                                                   
ensures StateInvariant(A._state, A._lock);                                                          
ensures Y(tid , old(A._state), old(A._lock) , A._state, A._lock);                                   
                                                                                                    
// A._lock:                                                                                         
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A._lock: [A]Tid)
 requires StateInvariant(A._state, A._lock);                                                        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A._lock)));    
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A._lock)), _N);                  
assume A._state_yield == A._state && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A._lock);                                         
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A._lock: [A]Tid)             
 requires StateInvariant(A._state, A._lock);                                                        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A._lock: [A]Tid , A._state_p: [A]State, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A._lock);                                                        
 requires StateInvariant(A._state_p, A._lock_p);                                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A._lock , A._state_p, A._lock_p);                                         
 assume Y_A._lock(tid, this, newValue , A._state_p, A._lock_p);                                     
assume A._state_post == A._state_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A._lock(tid, this, newValue , A._state, A._lock);                                         
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A._lock: [A]Tid , A._state_p: [A]State, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A._lock))                
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 396.1-465.2: (Method:5.3)
// 402.1-402.24: (5.3): Bad tid
// 403.1-403.35: (5.3): this is not global
// 432.2-434.2: (class anchor.sink.VarDeclStmt:6.7)
// 435.2-437.2: (class anchor.sink.VarDeclStmt:6.7)
// 438.2-441.19: (class anchor.sink.Assign:6.7)
// 443.3-446.16: (class anchor.sink.Assign:<undefined position>)
// 448.3-451.20: (class anchor.sink.Assign:6.30)
// 453.2-458.49: (class anchor.sink.Assert:6.7)
// 458.1-458.49: (6.7): This assertion may not hold.
// 459.2-464.9: (class anchor.sink.Return:5.19)
// 512.1-530.2: (7.32): yields_as clause for A._lock is not valid
// 535.1-548.2: (7.32): yields_as clause for A._lock is not reflexive
// 554.1-580.2: (7.32): yields_as clause for A._lock is not transitive
