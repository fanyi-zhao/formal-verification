                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/cormac.anchor:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile boolean b N                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.b == false;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures $result;                                                                            
      }                                                                                             
      public boolean f() {                                                                          
        assume this.b;                                                                              
        yield;                                                                                      
        boolean tmp1;                                                                               
        tmp1 := this.b;                                                                             
         return tmp1;                                                                               
        // return false;                                                                            
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile boolean b N                                                                          
                                                                                                    
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
        assume this.b == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures $result;                                                                            
      }                                                                                             
      public boolean f() {                                                                          
        assume this.b;                                                                              
        yield;                                                                                      
        boolean tmp1;                                                                               
        tmp1 := this.b;                                                                             
        {                                                                                           
           return tmp1;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile boolean b N                                                                          
                                                                                                    
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
        assume this.b == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures $result;                                                                            
      }                                                                                             
      public boolean f() {                                                                          
        assume this.b;                                                                              
        yield;                                                                                      
        boolean tmp1;                                                                               
        tmp1 := this.b;                                                                             
        {                                                                                           
           return tmp1;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile boolean b N                                                                          
                                                                                                    
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
        assume this.b == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures $result;                                                                            
      }                                                                                             
      public boolean f() {                                                                          
        assume this.b;                                                                              
        yield;                                                                                      
        boolean tmp1;                                                                               
        tmp1 := this.b;                                                                             
        {                                                                                           
           return tmp1;                                                                             
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
                                                                                                    
                                                                                                    
/*** Class Decl A ***/                                                                              
                                                                                                    
type A;                                                                                             
const unique A.null: A;                                                                             
var A._state: [A]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var A.b: [A]bool;                                                                                   
                                                                                                    
function {:inline} ReadEval.A.b(tid: Tid,this : A,A._state: [A]State,A.b: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.b(tid: Tid,this : A,newValue: bool,A._state: [A]State,A.b: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A.b: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A.b: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
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
returns ($result : bool)                                                                            
modifies A._state;                                                                                  
modifies A.b;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (5.3): Bad tid
requires isShared(A._state[this]);                                                                         // (5.3): this is not global
                                                                                                    
requires StateInvariant(A._state, A.b, A._lock);                                                    
                                                                                                    
ensures StateInvariant(A._state, A.b, A._lock);                                                     
{                                                                                                   
 var $pc1105571_post: Phase;                                                                        
 var A._lock1105579: [A]Tid;                                                                        
 var A.b1105579: [A]bool;                                                                           
 var A._state1105583: [A]State;                                                                     
 var moverPath1105577: MoverPath;                                                                   
 var tmp11105579: bool;                                                                             
 var tid1105583: Tid;                                                                               
 var $result1105583: bool;                                                                          
 var tmp1: bool;                                                                                    
 var A._state1105577: [A]State;                                                                     
 var $result1105577: bool;                                                                          
 var tid1105577: Tid;                                                                               
 var A._lock1105571_post: [A]Tid;                                                                   
 var A._state1105579: [A]State;                                                                     
 var $recorded.state1105583: int;                                                                   
 var $pc1105577: Phase;                                                                             
 var this1105577: A;                                                                                
 var $pc1105571: Phase;                                                                             
 var $result1105579: bool;                                                                          
 var tmp11105577: bool;                                                                             
 var this1105571_post: A;                                                                           
 var $result1105571: bool;                                                                          
 var $recorded.state1105579: int;                                                                   
 var A.b1105571_post: [A]bool;                                                                      
 var $result1105571_post: bool;                                                                     
 var tid1105571: Tid;                                                                               
 var $recorded.state1105571: int;                                                                   
 var this1105579: A;                                                                                
 var A._lock1105571: [A]Tid;                                                                        
 var tid1105579: Tid;                                                                               
 var A.b1105583: [A]bool;                                                                           
 var A._lock1105583: [A]Tid;                                                                        
 var $pc1105583: Phase;                                                                             
 var A._state1105571_post: [A]State;                                                                
 var tid1105571_post: Tid;                                                                          
 var path1105577: int;                                                                              
 var this1105571: A;                                                                                
 var mover1105577: Mover;                                                                           
 var $pc1105579: Phase;                                                                             
 var A._state1105571: [A]State;                                                                     
 var A._lock1105577: [A]Tid;                                                                        
 var A.b1105577: [A]bool;                                                                           
 var tmp11105583: bool;                                                                             
 var $recorded.state1105571_post: int;                                                              
 var A.b1105571: [A]bool;                                                                           
 var $recorded.state1105577: int;                                                                   
 var this1105583: A;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.6: assume this.b;                                                                             
                                                                                                    
 assume A.b[this];                                                                                  
                                                                                                    
 // 8.6: yield;                                                                                     
                                                                                                    
 assume A._state1105571 == A._state && A.b1105571 == A.b && A._lock1105571 == A._lock && $result1105571 == $result && this1105571 == this && tid1105571 == tid;
 assume $recorded.state1105571 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state1105571_post == A._state && A.b1105571_post == A.b && A._lock1105571_post == A._lock && $result1105571_post == $result && this1105571_post == this && tid1105571_post == tid;
 assume $recorded.state1105571_post == 1;                                                           
                                                                                                    
 // 9.6: boolean tmp1;                                                                              
                                                                                                    
                                                                                                    
 // 9.6: tmp1 := this.b;                                                                            
                                                                                                    
                                                                                                    
 moverPath1105577 := ReadEval.A.b(tid: Tid,this: A,A._state,A.b,A._lock);                           
 mover1105577 := m#moverPath(moverPath1105577);                                                     
 path1105577 := p#moverPath(moverPath1105577);                                                      
 assume A._state1105577 == A._state && A.b1105577 == A.b && A._lock1105577 == A._lock && tmp11105577 == tmp1 && $result1105577 == $result && this1105577 == this && tid1105577 == tid && $pc1105577 == $pc;
 assume $recorded.state1105577 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (9.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1105577);                                                              
 assert $pc != PhaseError;                                                                                 // (9.6): Reduction failure
 tmp1 := A.b[this];                                                                                 
                                                                                                    
 // 9.6:  return tmp1;                                                                              
                                                                                                    
 assume A._state1105579 == A._state && A.b1105579 == A.b && A._lock1105579 == A._lock && tmp11105579 == tmp1 && $result1105579 == $result && this1105579 == this && tid1105579 == tid;
 assume $recorded.state1105579 == 1;                                                                
 $result := tmp1;                                                                                   
 return;                                                                                            
                                                                                                    
 // 6.22: // return false;                                                                          
                                                                                                    
 assume A._state1105583 == A._state && A.b1105583 == A.b && A._lock1105583 == A._lock && tmp11105583 == tmp1 && $result1105583 == $result && this1105583 == this && tid1105583 == tid;
 assume $recorded.state1105583 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A.b: [A]bool,A._lock: [A]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                  
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.b failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.b(u: Tid,x: A,A._state,A.b,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.3): A.b failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.b[x];                                                                                
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.b[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.b failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                    
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.b[x];                                                                                
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.A.b(u: Tid,x: A,A._state,A.b,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.3): A.b failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                        
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.b,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.b failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                         
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == A.b[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.b,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.b[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.b failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                          
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.b_mid == A.b && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                          
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_mid == A._state && A.b_mid == A.b && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                          
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                          
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.b is not Write-Write Stable with respect to A.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.b,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.b,A._lock);                              
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[y] := w;                                                                                       
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.b(t: Tid,x: A,A._state,A.b,A._lock);                                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.b is not Read-Write Stable with respect to A.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.b is not Read-Write Stable with respect to A.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.b is not Read-Write Stable with respect to A.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.b(u: Tid,y: A,A._state,A.b,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.b,A._lock);                              
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.b_post == A.b && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.b(u: Tid,y: A,A._state,A.b,A._lock);                                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): A.b is not Write-Read Stable with respect to A.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): A.b is not Write-Read Stable with respect to A.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): A.b is not Write-Read Stable with respect to A.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(A._state, A.b, A._lock);                                                    
requires ValidTid(tid);                                                                             
modifies A._state;                                                                                  
modifies A.b;                                                                                       
modifies A._lock;                                                                                   
ensures StateInvariant(A._state, A.b, A._lock);                                                     
ensures Y(tid , old(A._state), old(A.b), old(A._lock) , A._state, A.b, A._lock);                    
                                                                                                    
// A.b:                                                                                             
                                                                                                    
function {:inline} Y_A.b(tid : Tid, this: A, newValue: bool , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.b(tid: Tid,this: A,A._state,A.b,A._lock)), _R)) ==> (A.b[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A.b(tid : Tid, this: A, newValue: bool , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.b.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: bool , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.b(u: Tid,this: A,newValue: bool,A._state,A.b,A._lock)));   
                                                                                                    
assume A._state_yield == A._state && A.b_yield == A.b && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.b(tid, this, newValue , A._state, A.b, A._lock);                                        
}                                                                                                   
                                                                                                    
procedure Y_A.b.Reflexive(tid : Tid, this: A , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid)   
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.b_yield == A.b && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.b(tid, this, A.b[this] , A._state, A.b, A._lock);                                       
}                                                                                                   
                                                                                                    
procedure Y_A.b.Transitive(tid : Tid, this: A, newValue : bool , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.b_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires StateInvariant(A._state_p, A.b_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var newValue_pre: bool;                                                                             
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var $pc_pre: Phase;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: bool;                                                                            
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.b, A._lock , A._state_p, A.b_p, A._lock_p);                             
 assume Y_A.b(tid, this, newValue , A._state_p, A.b_p, A._lock_p);                                  
assume A._state_post == A._state_p && A.b_post == A.b_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.b(tid, this, newValue , A._state, A.b, A._lock);                                        
}                                                                                                   
// A._lock:                                                                                         
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.b,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.b, A._lock);                                                   
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
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A.b,A._lock)));
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.b,A._lock)), _N);              
assume A._state_yield == A._state && A.b_yield == A.b && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A.b, A._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.b_yield == A.b && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A.b, A._lock);                               
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.b_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.b, A._lock);                                                   
 requires StateInvariant(A._state_p, A.b_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.b_pre == A.b && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.b, A._lock , A._state_p, A.b_p, A._lock_p);                             
 assume Y_A._lock(tid, this, newValue , A._state_p, A.b_p, A._lock_p);                              
assume A._state_post == A._state_p && A.b_post == A.b_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A._lock(tid, this, newValue , A._state, A.b, A._lock);                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A.b: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.b_p: [A]bool, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A.b(tid : Tid, this, A.b_p[this] , A._state, A.b, A._lock))                   
 && (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A.b, A._lock))        
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 450.1-565.2: (Method:5.3)
// 458.1-458.24: (5.3): Bad tid
// 459.1-459.35: (5.3): this is not global
// 517.2-520.19: (class anchor.sink.Assume:7.6)
// 521.2-529.42: (class anchor.sink.Yield:8.6)
// 530.2-532.2: (class anchor.sink.VarDeclStmt:9.6)
// 533.2-550.20: (class anchor.sink.Read:9.6)
// 545.1-545.25: (9.6): Cannot have potential null deference in left-mover part.
// 549.1-549.27: (9.6): Reduction failure
// 551.2-557.9: (class anchor.sink.Return:9.6)
// 558.2-564.9: (class anchor.sink.Return:6.22)
// 639.1-639.34: (3.3): A.b failed Write-Write Right-Mover Check
// 696.1-696.30: (3.3): A.b failed Write-Read Right-Mover Check
// 757.1-757.34: (3.3): A.b failed Write-Write Left-Mover Check
// 815.1-815.30: (3.3): A.b failed Write-Read Left-Mover Check
// 870.1-870.34: (3.3): A.b failed Read-Write Right-Mover Check
// 928.1-928.34: (3.3): A.b failed Read-Write Left-Mover Check
// 997.1-997.140: (3.3): A.b is not Write-Write Stable with respect to A.b (case A.1)
// 998.1-998.101: (3.3): A.b is not Write-Write Stable with respect to A.b (case A.2)
// 999.1-999.158: (3.3): A.b is not Write-Write Stable with respect to A.b (case A.3)
// 1092.1-1092.140: (3.3): A.b is not Write-Write Stable with respect to A.b (case C)
// 1190.1-1190.144: (3.3): A.b is not Write-Write Stable with respect to A.b (case D)
// 1191.1-1191.144: (3.3): A.b is not Write-Write Stable with respect to A.b (case R)
// 1260.1-1260.136: (3.3): A.b is not Read-Write Stable with respect to A.b (case F)
// 1261.1-1261.136: (3.3): A.b is not Read-Write Stable with respect to A.b (case H)
// 1262.1-1262.146: (3.3): A.b is not Read-Write Stable with respect to A.b (case I)
// 1330.1-1330.136: (3.3): A.b is not Write-Read Stable with respect to A.b (case J)
// 1331.1-1331.136: (3.3): A.b is not Write-Read Stable with respect to A.b (case K)
// 1332.1-1332.99: (3.3): A.b is not Write-Read Stable with respect to A.b (case L)
// 1363.1-1382.2: (3.3): yields_as clause for A.b is not valid
// 1387.1-1401.2: (3.3): yields_as clause for A.b is not reflexive
// 1407.1-1435.2: (3.3): yields_as clause for A.b is not transitive
// 1455.1-1474.2: (7.32): yields_as clause for A._lock is not valid
// 1479.1-1493.2: (7.32): yields_as clause for A._lock is not reflexive
// 1499.1-1527.2: (7.32): yields_as clause for A._lock is not transitive
