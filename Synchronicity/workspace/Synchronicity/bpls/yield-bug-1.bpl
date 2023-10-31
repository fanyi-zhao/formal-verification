                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/yield-bug-1.sink:                       
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f1() {                                                                            
        synchronized (this) {                                                                       
          this.x := 3;                                                                              
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int this_x;                                                                               
          this_x := this.x;                                                                         
          assert this_x == 3;                                                                       
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        synchronized (this) {                                                                       
          this.x := 3;                                                                              
        }                                                                                           
        yield;                                                                                      
        yield;                                                                                      
        synchronized (this) {                                                                       
          int this_x;                                                                               
          this_x := this.x;                                                                         
          assert this_x == 3;                                                                       
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 3;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x == 3;                                                                     
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
                                                                                                    
                                                                                                    
/*** Class Decl A ***/                                                                              
                                                                                                    
type A;                                                                                             
const unique A.null: A;                                                                             
var A._state: [A]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var A.x: [A]int;                                                                                    
                                                                                                    
function {:inline} ReadEval.A.x(tid: Tid,this : A,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(A._state[this], tid) && A._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.x(tid: Tid,this : A,newValue: int,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(A._state[this], tid) && A._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  A.f1(tid:Tid, this : A)                                                                  
modifies A._state;                                                                                  
modifies A.x;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.3): Bad tid
requires isShared(A._state[this]);                                                                         // (7.3): this is not global
                                                                                                    
requires StateInvariant(A._state, A.x, A._lock);                                                    
                                                                                                    
ensures StateInvariant(A._state, A.x, A._lock);                                                     
{                                                                                                   
 var $pc4705521: Phase;                                                                             
 var this4705513: A;                                                                                
 var mover4705521: Mover;                                                                           
 var this_x4705527: int;                                                                            
 var A.x4705521: [A]int;                                                                            
 var $recorded.state4705513_post: int;                                                              
 var moverPath4705508: MoverPath;                                                                   
 var this_x: int;                                                                                   
 var this4705508: A;                                                                                
 var A._state4705513: [A]State;                                                                     
 var $pc4705513: Phase;                                                                             
 var A.x4705513: [A]int;                                                                            
 var $recorded.state4705527: int;                                                                   
 var $pc4705532: Phase;                                                                             
 var this_x4705521: int;                                                                            
 var A._lock4705532: [A]Tid;                                                                        
 var A._lock4705513_post: [A]Tid;                                                                   
 var A.x4705513_post: [A]int;                                                                       
 var A._lock4705521: [A]Tid;                                                                        
 var A._state4705513_post: [A]State;                                                                
 var A._state4705532: [A]State;                                                                     
 var this4705527: A;                                                                                
 var A.x4705532: [A]int;                                                                            
 var $recorded.state4705508: int;                                                                   
 var A._lock4705508: [A]Tid;                                                                        
 var A._lock4705527: [A]Tid;                                                                        
 var moverPath4705521: MoverPath;                                                                   
 var A._state4705508: [A]State;                                                                     
 var tid4705527: Tid;                                                                               
 var $pc4705508: Phase;                                                                             
 var path4705521: int;                                                                              
 var $recorded.state4705513: int;                                                                   
 var $recorded.state4705532: int;                                                                   
 var A.x4705527: [A]int;                                                                            
 var mover4705508: Mover;                                                                           
 var tid4705513_post: Tid;                                                                          
 var $pc4705513_post: Phase;                                                                        
 var A._lock4705513: [A]Tid;                                                                        
 var tid4705532: Tid;                                                                               
 var A._state4705521: [A]State;                                                                     
 var tid4705521: Tid;                                                                               
 var A.x4705508: [A]int;                                                                            
 var this4705521: A;                                                                                
 var this4705513_post: A;                                                                           
 var tid4705508: Tid;                                                                               
 var this4705532: A;                                                                                
 var $recorded.state4705521: int;                                                                   
 var A._state4705527: [A]State;                                                                     
 var path4705508: int;                                                                              
 var $pc4705527: Phase;                                                                             
 var tid4705513: Tid;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (9.19): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume A._lock[this] == Tid.null;                                                                  
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (9.19): Reduction failure
 A._lock[this] := tid;                                                                              
                                                                                                    
                                                                                                    
 // 11.7: this.x := 3;                                                                              
                                                                                                    
                                                                                                    
 moverPath4705508 := WriteEval.A.x(tid: Tid,this: A,3: int,A._state,A.x,A._lock);                   
 mover4705508 := m#moverPath(moverPath4705508);                                                     
 path4705508 := p#moverPath(moverPath4705508);                                                      
 assume A._state4705508 == A._state && A.x4705508 == A.x && A._lock4705508 == A._lock && this4705508 == this && tid4705508 == tid && $pc4705508 == $pc;
 assume $recorded.state4705508 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (11.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4705508);                                                              
 assert $pc != PhaseError;                                                                                 // (11.7): Reduction failure
 A.x[this] := 3;                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (13.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert A._lock[this] == tid;                                                                              // (13.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (13.5): Reduction failure
 A._lock[this] := Tid.null;                                                                         
                                                                                                    
 // 15.5: yield;                                                                                    
                                                                                                    
 assume A._state4705513 == A._state && A.x4705513 == A.x && A._lock4705513 == A._lock && this4705513 == this && tid4705513 == tid;
 assume $recorded.state4705513 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state4705513_post == A._state && A.x4705513_post == A.x && A._lock4705513_post == A._lock && this4705513_post == this && tid4705513_post == tid;
 assume $recorded.state4705513_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (16.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume A._lock[this] == Tid.null;                                                                  
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (16.18): Reduction failure
 A._lock[this] := tid;                                                                              
                                                                                                    
 // 17.7: int this_x;                                                                               
                                                                                                    
                                                                                                    
 // 17.7: this_x := this.x;                                                                         
                                                                                                    
                                                                                                    
 moverPath4705521 := ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock);                           
 mover4705521 := m#moverPath(moverPath4705521);                                                     
 path4705521 := p#moverPath(moverPath4705521);                                                      
 assume A._state4705521 == A._state && A.x4705521 == A.x && A._lock4705521 == A._lock && this_x4705521 == this_x && this4705521 == this && tid4705521 == tid && $pc4705521 == $pc;
 assume $recorded.state4705521 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (17.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4705521);                                                              
 assert $pc != PhaseError;                                                                                 // (17.7): Reduction failure
 this_x := A.x[this];                                                                               
                                                                                                    
 // 18.7: assert this_x == 3;                                                                       
                                                                                                    
 assume A._state4705527 == A._state && A.x4705527 == A.x && A._lock4705527 == A._lock && this_x4705527 == this_x && this4705527 == this && tid4705527 == tid;
 assume $recorded.state4705527 == 1;                                                                
 assert (this_x==3);                                                                                       // (18.7): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (19.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert A._lock[this] == tid;                                                                              // (19.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (19.5): Reduction failure
 A._lock[this] := Tid.null;                                                                         
                                                                                                    
 // 7.20: // return;                                                                                
                                                                                                    
 assume A._state4705532 == A._state && A.x4705532 == A.x && A._lock4705532 == A._lock && this4705532 == this && tid4705532 == tid;
 assume $recorded.state4705532 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  A.f2(tid:Tid, this : A)                                                                  
modifies A._state;                                                                                  
modifies A.x;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (24.3): Bad tid
requires isShared(A._state[this]);                                                                         // (24.3): this is not global
                                                                                                    
requires StateInvariant(A._state, A.x, A._lock);                                                    
                                                                                                    
ensures StateInvariant(A._state, A.x, A._lock);                                                     
{                                                                                                   
 var A._state4705566: [A]State;                                                                     
 var $pc4705546_post: Phase;                                                                        
 var A.x4705547: [A]int;                                                                            
 var tid4705547: Tid;                                                                               
 var A.x4705541: [A]int;                                                                            
 var mover4705541: Mover;                                                                           
 var A._lock4705547: [A]Tid;                                                                        
 var A._state4705547_post: [A]State;                                                                
 var $recorded.state4705547_post: int;                                                              
 var $pc4705547_post: Phase;                                                                        
 var $pc4705555: Phase;                                                                             
 var $recorded.state4705566: int;                                                                   
 var A._lock4705541: [A]Tid;                                                                        
 var $pc4705546: Phase;                                                                             
 var $recorded.state4705555: int;                                                                   
 var this_x: int;                                                                                   
 var $pc4705541: Phase;                                                                             
 var tid4705546_post: Tid;                                                                          
 var $pc4705547: Phase;                                                                             
 var A._state4705541: [A]State;                                                                     
 var A._state4705547: [A]State;                                                                     
 var A._lock4705555: [A]Tid;                                                                        
 var tid4705547_post: Tid;                                                                          
 var this4705546_post: A;                                                                           
 var A._state4705561: [A]State;                                                                     
 var this4705541: A;                                                                                
 var A.x4705561: [A]int;                                                                            
 var tid4705555: Tid;                                                                               
 var tid4705566: Tid;                                                                               
 var this4705561: A;                                                                                
 var this4705546: A;                                                                                
 var mover4705555: Mover;                                                                           
 var A._lock4705566: [A]Tid;                                                                        
 var path4705555: int;                                                                              
 var this_x4705555: int;                                                                            
 var this4705547: A;                                                                                
 var A.x4705555: [A]int;                                                                            
 var tid4705561: Tid;                                                                               
 var A._lock4705546: [A]Tid;                                                                        
 var $pc4705561: Phase;                                                                             
 var A.x4705547_post: [A]int;                                                                       
 var $recorded.state4705541: int;                                                                   
 var A._lock4705547_post: [A]Tid;                                                                   
 var $recorded.state4705561: int;                                                                   
 var path4705541: int;                                                                              
 var A._state4705546: [A]State;                                                                     
 var A._state4705555: [A]State;                                                                     
 var A._lock4705561: [A]Tid;                                                                        
 var this4705555: A;                                                                                
 var tid4705546: Tid;                                                                               
 var moverPath4705555: MoverPath;                                                                   
 var $recorded.state4705546_post: int;                                                              
 var this4705566: A;                                                                                
 var A.x4705546_post: [A]int;                                                                       
 var A._lock4705546_post: [A]Tid;                                                                   
 var this_x4705561: int;                                                                            
 var this4705547_post: A;                                                                           
 var tid4705541: Tid;                                                                               
 var A._state4705546_post: [A]State;                                                                
 var $recorded.state4705547: int;                                                                   
 var moverPath4705541: MoverPath;                                                                   
 var $recorded.state4705546: int;                                                                   
 var A.x4705566: [A]int;                                                                            
 var $pc4705566: Phase;                                                                             
 var A.x4705546: [A]int;                                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (26.19): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume A._lock[this] == Tid.null;                                                                  
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (26.19): Reduction failure
 A._lock[this] := tid;                                                                              
                                                                                                    
                                                                                                    
 // 28.7: this.x := 3;                                                                              
                                                                                                    
                                                                                                    
 moverPath4705541 := WriteEval.A.x(tid: Tid,this: A,3: int,A._state,A.x,A._lock);                   
 mover4705541 := m#moverPath(moverPath4705541);                                                     
 path4705541 := p#moverPath(moverPath4705541);                                                      
 assume A._state4705541 == A._state && A.x4705541 == A.x && A._lock4705541 == A._lock && this4705541 == this && tid4705541 == tid && $pc4705541 == $pc;
 assume $recorded.state4705541 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (28.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4705541);                                                              
 assert $pc != PhaseError;                                                                                 // (28.7): Reduction failure
 A.x[this] := 3;                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (30.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert A._lock[this] == tid;                                                                              // (30.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (30.5): Reduction failure
 A._lock[this] := Tid.null;                                                                         
                                                                                                    
 // 32.5: yield;                                                                                    
                                                                                                    
 assume A._state4705546 == A._state && A.x4705546 == A.x && A._lock4705546 == A._lock && this4705546 == this && tid4705546 == tid;
 assume $recorded.state4705546 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state4705546_post == A._state && A.x4705546_post == A.x && A._lock4705546_post == A._lock && this4705546_post == this && tid4705546_post == tid;
 assume $recorded.state4705546_post == 1;                                                           
                                                                                                    
 // 34.5: yield;                                                                                    
                                                                                                    
 assume A._state4705547 == A._state && A.x4705547 == A.x && A._lock4705547 == A._lock && this4705547 == this && tid4705547 == tid;
 assume $recorded.state4705547 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state4705547_post == A._state && A.x4705547_post == A.x && A._lock4705547_post == A._lock && this4705547_post == this && tid4705547_post == tid;
 assume $recorded.state4705547_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (35.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume A._lock[this] == Tid.null;                                                                  
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (35.18): Reduction failure
 A._lock[this] := tid;                                                                              
                                                                                                    
 // 36.7: int this_x;                                                                               
                                                                                                    
                                                                                                    
 // 36.7: this_x := this.x;                                                                         
                                                                                                    
                                                                                                    
 moverPath4705555 := ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock);                           
 mover4705555 := m#moverPath(moverPath4705555);                                                     
 path4705555 := p#moverPath(moverPath4705555);                                                      
 assume A._state4705555 == A._state && A.x4705555 == A.x && A._lock4705555 == A._lock && this_x4705555 == this_x && this4705555 == this && tid4705555 == tid && $pc4705555 == $pc;
 assume $recorded.state4705555 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (36.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4705555);                                                              
 assert $pc != PhaseError;                                                                                 // (36.7): Reduction failure
 this_x := A.x[this];                                                                               
                                                                                                    
 // 37.7: assert this_x == 3;                                                                       
                                                                                                    
 assume A._state4705561 == A._state && A.x4705561 == A.x && A._lock4705561 == A._lock && this_x4705561 == this_x && this4705561 == this && tid4705561 == tid;
 assume $recorded.state4705561 == 1;                                                                
 assert (this_x==3);                                                                                       // (37.7): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (38.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert A._lock[this] == tid;                                                                              // (38.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (38.5): Reduction failure
 A._lock[this] := Tid.null;                                                                         
                                                                                                    
 // 24.20: // return;                                                                               
                                                                                                    
 assume A._state4705566 == A._state && A.x4705566 == A.x && A._lock4705566 == A._lock && this4705566 == this && tid4705566 == tid;
 assume $recorded.state4705566 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (bool) { 
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                    
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): A.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                     
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.x(u: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): A.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                     
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.x[x];                                                                                
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.x[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): A.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                      
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.x[x];                                                                                
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.A.x(u: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): A.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                          
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): A.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                           
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == A.x[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.x[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): A.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)              
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)              
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var A.x_mid: [A]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var w_mid: int;                                                                                    
 var y_mid: A;                                                                                      
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)             
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var A.x_mid: [A]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var w_mid: int;                                                                                    
 var y_mid: A;                                                                                      
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): A.x is not Write-Write Stable with respect to A.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)            
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[y] := w;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): A.x is not Read-Write Stable with respect to A.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): A.x is not Read-Write Stable with respect to A.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): A.x is not Read-Write Stable with respect to A.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)            
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.x(u: Tid,y: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.x(u: Tid,y: A,A._state,A.x,A._lock);                                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): A.x is not Write-Read Stable with respect to A.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): A.x is not Write-Read Stable with respect to A.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): A.x is not Write-Read Stable with respect to A.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(A._state, A.x, A._lock);                                                    
requires ValidTid(tid);                                                                             
modifies A._state;                                                                                  
modifies A.x;                                                                                       
modifies A._lock;                                                                                   
ensures StateInvariant(A._state, A.x, A._lock);                                                     
ensures Y(tid , old(A._state), old(A.x), old(A._lock) , A._state, A.x, A._lock);                    
                                                                                                    
// A.x:                                                                                             
                                                                                                    
function {:inline} Y_A.x(tid : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A.x(tid : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.x.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.x(u: Tid,this: A,newValue: int,A._state,A.x,A._lock)));    
                                                                                                    
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, newValue , A._state, A.x, A._lock);                                        
}                                                                                                   
                                                                                                    
procedure Y_A.x.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)    
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, A.x[this] , A._state, A.x, A._lock);                                       
}                                                                                                   
                                                                                                    
procedure Y_A.x.Transitive(tid : Tid, this: A, newValue : int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]int;                                                                                
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var newValue_pre: int;                                                                              
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]int;                                                                               
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.x, A._lock , A._state_p, A.x_p, A._lock_p);                             
 assume Y_A.x(tid, this, newValue , A._state_p, A.x_p, A._lock_p);                                  
assume A._state_post == A._state_p && A.x_post == A.x_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.x(tid, this, newValue , A._state, A.x, A._lock);                                        
}                                                                                                   
// A._lock:                                                                                         
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
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
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A.x,A._lock)));
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _N);              
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A.x, A._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A.x, A._lock);                               
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]int;                                                                                
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]int;                                                                               
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.x, A._lock , A._state_p, A.x_p, A._lock_p);                             
 assume Y_A._lock(tid, this, newValue , A._state_p, A.x_p, A._lock_p);                              
assume A._state_post == A._state_p && A.x_post == A.x_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A._lock(tid, this, newValue , A._state, A.x, A._lock);                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A.x(tid : Tid, this, A.x_p[this] , A._state, A.x, A._lock))                   
 && (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A.x, A._lock))        
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 534.1-700.2: (Method:7.3)
// 541.1-541.24: (7.3): Bad tid
// 542.1-542.35: (7.3): this is not global
// 607.1-607.25: (9.19): Cannot have potential null deference in left-mover part.
// 611.1-611.27: (9.19): Reduction failure
// 614.2-630.17: (class anchor.sink.Write:11.7)
// 626.1-626.25: (11.7): Cannot have potential null deference in left-mover part.
// 629.1-629.27: (11.7): Reduction failure
// 634.1-634.25: (13.5): Cannot have potential null deference in left-mover part.
// 636.1-636.30: (13.5): lock not held
// 638.1-638.27: (13.5): Reduction failure
// 640.2-648.42: (class anchor.sink.Yield:15.5)
// 652.1-652.25: (16.18): Cannot have potential null deference in left-mover part.
// 656.1-656.27: (16.18): Reduction failure
// 658.2-660.2: (class anchor.sink.VarDeclStmt:17.7)
// 661.2-678.22: (class anchor.sink.Read:17.7)
// 673.1-673.25: (17.7): Cannot have potential null deference in left-mover part.
// 677.1-677.27: (17.7): Reduction failure
// 679.2-684.21: (class anchor.sink.Assert:18.7)
// 684.1-684.21: (18.7): This assertion may not hold.
// 688.1-688.25: (19.5): Cannot have potential null deference in left-mover part.
// 690.1-690.30: (19.5): lock not held
// 692.1-692.27: (19.5): Reduction failure
// 694.2-699.9: (class anchor.sink.Return:7.20)
// 701.1-890.2: (Method:24.3)
// 708.1-708.24: (24.3): Bad tid
// 709.1-709.35: (24.3): this is not global
// 788.1-788.25: (26.19): Cannot have potential null deference in left-mover part.
// 792.1-792.27: (26.19): Reduction failure
// 795.2-811.17: (class anchor.sink.Write:28.7)
// 807.1-807.25: (28.7): Cannot have potential null deference in left-mover part.
// 810.1-810.27: (28.7): Reduction failure
// 815.1-815.25: (30.5): Cannot have potential null deference in left-mover part.
// 817.1-817.30: (30.5): lock not held
// 819.1-819.27: (30.5): Reduction failure
// 821.2-829.42: (class anchor.sink.Yield:32.5)
// 830.2-838.42: (class anchor.sink.Yield:34.5)
// 842.1-842.25: (35.18): Cannot have potential null deference in left-mover part.
// 846.1-846.27: (35.18): Reduction failure
// 848.2-850.2: (class anchor.sink.VarDeclStmt:36.7)
// 851.2-868.22: (class anchor.sink.Read:36.7)
// 863.1-863.25: (36.7): Cannot have potential null deference in left-mover part.
// 867.1-867.27: (36.7): Reduction failure
// 869.2-874.21: (class anchor.sink.Assert:37.7)
// 874.1-874.21: (37.7): This assertion may not hold.
// 878.1-878.25: (38.5): Cannot have potential null deference in left-mover part.
// 880.1-880.30: (38.5): lock not held
// 882.1-882.27: (38.5): Reduction failure
// 884.2-889.9: (class anchor.sink.Return:24.20)
// 964.1-964.34: (4.3): A.x failed Write-Write Right-Mover Check
// 1021.1-1021.30: (4.3): A.x failed Write-Read Right-Mover Check
// 1082.1-1082.34: (4.3): A.x failed Write-Write Left-Mover Check
// 1140.1-1140.30: (4.3): A.x failed Write-Read Left-Mover Check
// 1195.1-1195.34: (4.3): A.x failed Read-Write Right-Mover Check
// 1253.1-1253.34: (4.3): A.x failed Read-Write Left-Mover Check
// 1322.1-1322.140: (4.3): A.x is not Write-Write Stable with respect to A.x (case A.1)
// 1323.1-1323.101: (4.3): A.x is not Write-Write Stable with respect to A.x (case A.2)
// 1324.1-1324.158: (4.3): A.x is not Write-Write Stable with respect to A.x (case A.3)
// 1417.1-1417.140: (4.3): A.x is not Write-Write Stable with respect to A.x (case C)
// 1515.1-1515.144: (4.3): A.x is not Write-Write Stable with respect to A.x (case D)
// 1516.1-1516.144: (4.3): A.x is not Write-Write Stable with respect to A.x (case R)
// 1585.1-1585.136: (4.3): A.x is not Read-Write Stable with respect to A.x (case F)
// 1586.1-1586.136: (4.3): A.x is not Read-Write Stable with respect to A.x (case H)
// 1587.1-1587.146: (4.3): A.x is not Read-Write Stable with respect to A.x (case I)
// 1655.1-1655.136: (4.3): A.x is not Write-Read Stable with respect to A.x (case J)
// 1656.1-1656.136: (4.3): A.x is not Write-Read Stable with respect to A.x (case K)
// 1657.1-1657.99: (4.3): A.x is not Write-Read Stable with respect to A.x (case L)
// 1688.1-1707.2: (4.3): yields_as clause for A.x is not valid
// 1712.1-1726.2: (4.3): yields_as clause for A.x is not reflexive
// 1732.1-1760.2: (4.3): yields_as clause for A.x is not transitive
// 1780.1-1799.2: (7.32): yields_as clause for A._lock is not valid
// 1804.1-1818.2: (7.32): yields_as clause for A._lock is not reflexive
// 1824.1-1852.2: (7.32): yields_as clause for A._lock is not transitive
