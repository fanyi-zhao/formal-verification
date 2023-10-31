                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/bug1.sink:                               
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead ? N : N                                                                         
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead ? N : N                                                                         
                                                                                                    
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
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead ? N : N                                                                         
                                                                                                    
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
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead ? N : N                                                                         
                                                                                                    
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
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
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
                                                                                                    
                                                                                                    
/*** Class Decl Mutex ***/                                                                          
                                                                                                    
type Mutex;                                                                                         
const unique Mutex.null: Mutex;                                                                     
var Mutex._state: [Mutex]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Mutex.m: [Mutex]int;                                                                            
                                                                                                    
function {:inline} ReadEval.Mutex.m(tid: Tid,this : Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex.m(tid: Tid,this : Mutex,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Mutex._lock: [Mutex]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Mutex._lock(tid: Tid,this : Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Mutex._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Mutex._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Mutex._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Mutex._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex._lock(tid: Tid,this : Mutex,newValue: Tid,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Mutex._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Mutex._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Mutex._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Mutex._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Test ***/                                                                           
                                                                                                    
type Test;                                                                                          
const unique Test.null: Test;                                                                       
var Test._state: [Test]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Test.m: [Test]Mutex;                                                                            
                                                                                                    
function {:inline} ReadEval.Test.m(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Mutex.null;                                                                       
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Test.m(tid: Tid,this : Test,newValue: Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Test.x: [Test]int;                                                                              
                                                                                                    
function {:inline} ReadEval.Test.x(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((Mutex.m[Test.m[this]]==tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Test.x(tid: Tid,this : Test,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((Mutex.m[Test.m[this]]==tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Test._lock: [Test]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Test._lock(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Test._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Test._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Test._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Test._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Test._lock(tid: Tid,this : Test,newValue: Tid,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Test._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Test._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Test._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Test._lock[this]==tid)&&(newValue==Tid.null))) then                                       
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
                                                                                                    
 function {:inline} StateInvariant(Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Mutex  :: _i == Mutex.null <==> isNull(Mutex._state[_i])) &&                          
  (forall _i: Test  :: _i == Test.null <==> isNull(Test._state[_i])) &&                             
  (forall _i: Test ::  (isShared(Test._state[_i]) ==> isSharedAssignable(Mutex._state[Test.m[_i]]))) &&
  (forall _i: Test ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Test._state[_i],_t) ==> isLocalAssignable(Mutex._state[Test.m[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)            
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Mutex.m failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)             
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Mutex.m(u: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.2): Mutex.m failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)             
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Mutex.m[x];                                                                            
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Mutex.m[x] := havocValue;                                                                          
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Mutex.m failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)              
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Mutex.m[x];                                                                            
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Mutex.m(u: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.2): Mutex.m failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)                  
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Mutex.m failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)                   
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[x], u);                                                         
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Mutex.m[x];                                                                            
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Mutex.m[x] := havocValue;                                                                          
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Mutex.m failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)          
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Test.m failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)           
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Test.m(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (9.5): Test.m failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)           
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Mutex;                                                                            
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.m[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Test.m[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Test.m failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)            
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Mutex;                                                                            
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.m[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Test.m(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (9.5): Test.m failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)                
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Test.m failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)                 
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Mutex;                                                                            
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Test.m[x];                                                                             
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Test.m[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Test.m failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)              
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.x(u: Tid,x: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (10.5): Test.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)               
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Test.x(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (10.5): Test.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)               
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.x[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Test.x[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.x(u: Tid,x: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (10.5): Test.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)                
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.x[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Test.x(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (10.5): Test.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)                    
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Test.x(u: Tid,x: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (10.5): Test.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Test.x(t: Tid, u: Tid, v: int, w: int, x: Test)                     
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[x], u);                                                          
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Test.x[x];                                                                             
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Test.x[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Test.x(u: Tid,x: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (10.5): Test.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Mutex.m;                                                                                  
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Mutex.m;                                                                                  
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Mutex.m;                                                                                  
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Mutex.m;                                                                                  
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[y] := w;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Mutex.m;                                                                                  
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Mutex.m.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Mutex.m.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Mutex.m.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var x_mid: Mutex;                                                                                  
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Mutex.m.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Mutex.m.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Mutex._state[x], t);                                                         
 requires isAccessible(Test._state[y], u);                                                          
 modifies Mutex.m;                                                                                  
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
 var x_pre: Mutex;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.m;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.m;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.m;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.m;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[y] := w;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.m;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: Mutex;                                                                                  
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.m.Test.x(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.m.Test.x(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.m.Test.x(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Mutex;                                                                                  
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: Mutex;                                                                                  
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.m.Test.x(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Test.m is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.m.Test.x(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.m;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var y_pre: Test;                                                                                   
 var v_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var v_post: Mutex;                                                                                 
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): Test.x is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.x.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.x;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.x.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.x;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.x.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.x;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var y_mid: Mutex;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.x.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.x;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[y] := w;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.x.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Mutex._state[y], u);                                                         
 modifies Test.x;                                                                                   
 modifies Mutex.m;                                                                                  
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Mutex;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Mutex;                                                                                 
 var $pc_post: Phase;                                                                               
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.x.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.x.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.x.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w0_mid: Mutex;                                                                                 
 var w_mid: Mutex;                                                                                  
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.x.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.x.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.m;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var w0_pre: Mutex;                                                                                 
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var w_pre: Mutex;                                                                                  
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w0_post: Mutex;                                                                                
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Test.m is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): Test.m is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.x.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Test)  
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.x.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Test)  
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.x.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Test) 
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var x_mid: Test;                                                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Mutex._state_mid: [Mutex]State;                                                                
 var Mutex._lock_mid: [Mutex]Tid;                                                                   
 var $recorded.state_mid: int;                                                                      
 var Test.x_mid: [Test]int;                                                                         
 var Test._lock_mid: [Test]Tid;                                                                     
 var w_mid: int;                                                                                    
 var Mutex.m_mid: [Mutex]int;                                                                       
 var y_mid: Test;                                                                                   
 var v_mid: int;                                                                                    
 var Test._state_mid: [Test]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Test.m_mid: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.x[x];                                                                                 
 Test.x[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test.x_mid == Test.x && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.x[x] := tmpV;                                                                                 
 Test.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): Test.x is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.x.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.x(u: Tid,y: Test,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.x(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): Test.x is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.x.Test.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Test._state[x], t);                                                          
 requires isAccessible(Test._state[y], u);                                                          
 modifies Test.x;                                                                                   
 modifies Test.x;                                                                                   
                                                                                                    
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
 var Test.x_pre: [Test]int;                                                                         
 var v_pre: int;                                                                                    
 var y_pre: Test;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Test;                                                                                   
 var Mutex._state_pre: [Mutex]State;                                                                
 var Mutex._lock_pre: [Mutex]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Test._lock_pre: [Test]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var Test._state_pre: [Test]State;                                                                  
 var Mutex.m_pre: [Mutex]int;                                                                       
 var t_pre: Tid;                                                                                    
 var Test.m_pre: [Test]Mutex;                                                                       
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Mutex._lock_post: [Mutex]Tid;                                                                  
 var w0_post: int;                                                                                  
 var x_post: Test;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Test;                                                                                  
 var Test._state_post: [Test]State;                                                                 
 var Mutex._state_post: [Mutex]State;                                                               
 var w_post: int;                                                                                   
 var Test._lock_post: [Test]Tid;                                                                    
 var v_post: int;                                                                                   
 var Test.x_post: [Test]int;                                                                        
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.x(t: Tid,x: Test,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.x[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test.x_post == Test.x && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.x(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): Test.x is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): Test.x is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
requires ValidTid(tid);                                                                             
modifies Mutex._state;                                                                              
modifies Mutex.m;                                                                                   
modifies Mutex._lock;                                                                               
modifies Test._state;                                                                               
modifies Test.m;                                                                                    
modifies Test.x;                                                                                    
modifies Test._lock;                                                                                
ensures StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
ensures Y(tid , old(Mutex._state), old(Mutex.m), old(Mutex._lock), old(Test._state), old(Test.m), old(Test.x), old(Test._lock) , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
                                                                                                    
// Mutex.m:                                                                                         
                                                                                                    
function {:inline} Y_Mutex.m(tid : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Mutex._state[this], tid) && leq(m#moverPath(ReadEval.Mutex.m(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _R)) ==> (Mutex.m[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Mutex.m(tid : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Subsumes.W(tid : Tid, u : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var newValue_yield: int;                                                                            
var Test.x_yield: [Test]int;                                                                        
var u_yield: Tid;                                                                                   
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume isAccessible(Mutex._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Mutex.m(u: Tid,this: Mutex,newValue: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)));
                                                                                                    
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Reflexive(tid : Tid, this: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex.m(tid, this, Mutex.m[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Transitive(tid : Tid, this: Mutex, newValue : int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test.x_pre: [Test]int;                                                                          
var this_pre: Mutex;                                                                                
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Mutex._state_pre: [Mutex]State;                                                                 
var Mutex._lock_pre: [Mutex]Tid;                                                                    
var Test._lock_pre: [Test]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Test._state_pre: [Test]State;                                                                   
var Mutex.m_pre: [Mutex]int;                                                                        
var Test.m_pre: [Test]Mutex;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var Mutex._lock_post: [Mutex]Tid;                                                                   
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Test._state_post: [Test]State;                                                                  
var Mutex._state_post: [Mutex]State;                                                                
var tid_post: Tid;                                                                                  
var this_post: Mutex;                                                                               
var Test._lock_post: [Test]Tid;                                                                     
var Test.x_post: [Test]int;                                                                         
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 assume Y_Mutex.m(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test.x_post == Test.x_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Mutex.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
// Mutex._lock:                                                                                     
                                                                                                    
function {:inline} Y_Mutex._lock(tid : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Mutex._state[this], tid) && leq(m#moverPath(ReadEval.Mutex._lock(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _R)) ==> (Mutex._lock[this] == newValue))
 &&(((Mutex._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Mutex._lock(tid : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Subsumes.W(tid : Tid, u : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var u_yield: Tid;                                                                                   
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume isAccessible(Mutex._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Mutex._lock(u: Tid,this: Mutex,newValue: Tid,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)));
 assume leq(m#moverPath(ReadEval.Mutex._lock(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _N);
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Reflexive(tid : Tid, this: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex._lock(tid, this, Mutex._lock[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Transitive(tid : Tid, this: Mutex, newValue : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test.x_pre: [Test]int;                                                                          
var this_pre: Mutex;                                                                                
var $recorded.state_pre: int;                                                                       
var Mutex._state_pre: [Mutex]State;                                                                 
var Mutex._lock_pre: [Mutex]Tid;                                                                    
var Test._lock_pre: [Test]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Test._state_pre: [Test]State;                                                                   
var Mutex.m_pre: [Mutex]int;                                                                        
var newValue_pre: Tid;                                                                              
var Test.m_pre: [Test]Mutex;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var Mutex._lock_post: [Mutex]Tid;                                                                   
var $pc_post: Phase;                                                                                
var Test._state_post: [Test]State;                                                                  
var Mutex._state_post: [Mutex]State;                                                                
var tid_post: Tid;                                                                                  
var this_post: Mutex;                                                                               
var Test._lock_post: [Test]Tid;                                                                     
var Test.x_post: [Test]int;                                                                         
var newValue_post: Tid;                                                                             
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 assume Y_Mutex._lock(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test.x_post == Test.x_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Mutex._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
// Test.m:                                                                                          
                                                                                                    
function {:inline} Y_Test.m(tid : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Test._state[this], tid) && leq(m#moverPath(ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _R)) ==> (Test.m[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Test.m(tid : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Subsumes.W(tid : Tid, u : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var u_yield: Tid;                                                                                   
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
var newValue_yield: Mutex;                                                                          
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume isAccessible(Test._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Test.m(u: Tid,this: Test,newValue: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)));
                                                                                                    
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Reflexive(tid : Tid, this: Test , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.m(tid, this, Test.m[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Transitive(tid : Tid, this: Test, newValue : Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test.x_pre: [Test]int;                                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: Mutex;                                                                            
var Mutex._state_pre: [Mutex]State;                                                                 
var Mutex._lock_pre: [Mutex]Tid;                                                                    
var Test._lock_pre: [Test]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var this_pre: Test;                                                                                 
var $pc_pre: Phase;                                                                                 
var Test._state_pre: [Test]State;                                                                   
var Mutex.m_pre: [Mutex]int;                                                                        
var Test.m_pre: [Test]Mutex;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var this_post: Test;                                                                                
var Mutex._lock_post: [Mutex]Tid;                                                                   
var $pc_post: Phase;                                                                                
var Test._state_post: [Test]State;                                                                  
var newValue_post: Mutex;                                                                           
var Mutex._state_post: [Mutex]State;                                                                
var tid_post: Tid;                                                                                  
var Test._lock_post: [Test]Tid;                                                                     
var Test.x_post: [Test]int;                                                                         
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 assume Y_Test.m(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test.x_post == Test.x_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Test.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
// Test.x:                                                                                          
                                                                                                    
function {:inline} Y_Test.x(tid : Tid, this: Test, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Test._state[this], tid) && leq(m#moverPath(ReadEval.Test.x(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _R)) ==> (Test.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Test.x(tid : Tid, this: Test, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Test.x.Subsumes.W(tid : Tid, u : Tid, this: Test, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var newValue_yield: int;                                                                            
var Test.x_yield: [Test]int;                                                                        
var u_yield: Tid;                                                                                   
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume isAccessible(Test._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Test.x(u: Tid,this: Test,newValue: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)));
                                                                                                    
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.x(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.x.Reflexive(tid : Tid, this: Test , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.x(tid, this, Test.x[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.x.Transitive(tid : Tid, this: Test, newValue : int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test.x_pre: [Test]int;                                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Mutex._state_pre: [Mutex]State;                                                                 
var Mutex._lock_pre: [Mutex]Tid;                                                                    
var Test._lock_pre: [Test]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var this_pre: Test;                                                                                 
var $pc_pre: Phase;                                                                                 
var Test._state_pre: [Test]State;                                                                   
var Mutex.m_pre: [Mutex]int;                                                                        
var Test.m_pre: [Test]Mutex;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var this_post: Test;                                                                                
var Mutex._lock_post: [Mutex]Tid;                                                                   
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Test._state_post: [Test]State;                                                                  
var Mutex._state_post: [Mutex]State;                                                                
var tid_post: Tid;                                                                                  
var Test._lock_post: [Test]Tid;                                                                     
var Test.x_post: [Test]int;                                                                         
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 assume Y_Test.x(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test.x_post == Test.x_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Test.x(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
// Test._lock:                                                                                      
                                                                                                    
function {:inline} Y_Test._lock(tid : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Test._state[this], tid) && leq(m#moverPath(ReadEval.Test._lock(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _R)) ==> (Test._lock[this] == newValue))
 &&(((Test._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Test._lock(tid : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Subsumes.W(tid : Tid, u : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var u_yield: Tid;                                                                                   
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume isAccessible(Test._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Test._lock(u: Tid,this: Test,newValue: Tid,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)));
 assume leq(m#moverPath(ReadEval.Test._lock(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _N);
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Reflexive(tid : Tid, this: Test , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Test.x_yield: [Test]int;                                                                        
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test.x_yield == Test.x && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test._lock(tid, this, Test._lock[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Transitive(tid : Tid, this: Test, newValue : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test.x_pre: [Test]int;                                                                          
var $recorded.state_pre: int;                                                                       
var Mutex._state_pre: [Mutex]State;                                                                 
var Mutex._lock_pre: [Mutex]Tid;                                                                    
var Test._lock_pre: [Test]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var this_pre: Test;                                                                                 
var $pc_pre: Phase;                                                                                 
var Test._state_pre: [Test]State;                                                                   
var Mutex.m_pre: [Mutex]int;                                                                        
var newValue_pre: Tid;                                                                              
var Test.m_pre: [Test]Mutex;                                                                        
                                                                                                    
var $recorded.state_post: int;                                                                      
var this_post: Test;                                                                                
var Mutex._lock_post: [Mutex]Tid;                                                                   
var $pc_post: Phase;                                                                                
var Test._state_post: [Test]State;                                                                  
var Mutex._state_post: [Mutex]State;                                                                
var tid_post: Tid;                                                                                  
var Test._lock_post: [Test]Tid;                                                                     
var Test.x_post: [Test]int;                                                                         
var newValue_post: Tid;                                                                             
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test.x_pre == Test.x && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
 assume Y_Test._lock(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test.x_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test.x_post == Test.x_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Test._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test.x: [Test]int, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test.x_p: [Test]int, Test._lock_p: [Test]Tid): bool
{                                                                                                   
 (forall this: Mutex :: Y_Mutex.m(tid : Tid, this, Mutex.m_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock))
 && (forall this: Mutex :: Y_Mutex._lock(tid : Tid, this, Mutex._lock_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock))
 && (forall this: Test :: Y_Test.m(tid : Tid, this, Test.m_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock))
 && (forall this: Test :: Y_Test.x(tid : Tid, this, Test.x_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock))
 && (forall this: Test :: Y_Test._lock(tid : Tid, this, Test._lock_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock))
 && (forall _i : Mutex :: isShared(Mutex._state[_i]) ==> isShared(Mutex._state_p[_i]))              
 && (forall _i : Mutex :: isLocal(Mutex._state[_i], tid) <==> isLocal(Mutex._state_p[_i], tid))     
 && (forall _i : Test :: isShared(Test._state[_i]) ==> isShared(Test._state_p[_i]))                 
 && (forall _i : Test :: isLocal(Test._state[_i], tid) <==> isLocal(Test._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 599.1-599.34: (4.2): Mutex.m failed Write-Write Right-Mover Check
// 664.1-664.30: (4.2): Mutex.m failed Write-Read Right-Mover Check
// 733.1-733.34: (4.2): Mutex.m failed Write-Write Left-Mover Check
// 799.1-799.30: (4.2): Mutex.m failed Write-Read Left-Mover Check
// 862.1-862.34: (4.2): Mutex.m failed Read-Write Right-Mover Check
// 928.1-928.34: (4.2): Mutex.m failed Read-Write Left-Mover Check
// 993.1-993.34: (9.5): Test.m failed Write-Write Right-Mover Check
// 1058.1-1058.30: (9.5): Test.m failed Write-Read Right-Mover Check
// 1127.1-1127.34: (9.5): Test.m failed Write-Write Left-Mover Check
// 1193.1-1193.30: (9.5): Test.m failed Write-Read Left-Mover Check
// 1256.1-1256.34: (9.5): Test.m failed Read-Write Right-Mover Check
// 1322.1-1322.34: (9.5): Test.m failed Read-Write Left-Mover Check
// 1387.1-1387.34: (10.5): Test.x failed Write-Write Right-Mover Check
// 1452.1-1452.30: (10.5): Test.x failed Write-Read Right-Mover Check
// 1521.1-1521.34: (10.5): Test.x failed Write-Write Left-Mover Check
// 1587.1-1587.30: (10.5): Test.x failed Write-Read Left-Mover Check
// 1650.1-1650.34: (10.5): Test.x failed Read-Write Right-Mover Check
// 1716.1-1716.34: (10.5): Test.x failed Read-Write Left-Mover Check
// 1793.1-1793.140: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 1794.1-1794.101: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 1795.1-1795.158: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 1900.1-1900.140: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2010.1-2010.144: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2011.1-2011.144: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2088.1-2088.136: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2089.1-2089.136: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2090.1-2090.146: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
// 2166.1-2166.136: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2167.1-2167.136: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2168.1-2168.99: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2246.1-2246.140: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2247.1-2247.101: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2248.1-2248.156: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2353.1-2353.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
// 2463.1-2463.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
// 2464.1-2464.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
// 2541.1-2541.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
// 2542.1-2542.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
// 2543.1-2543.144: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
// 2619.1-2619.136: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2620.1-2620.136: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2621.1-2621.99: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2699.1-2699.140: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2700.1-2700.101: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2701.1-2701.156: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2806.1-2806.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case C)
// 2916.1-2916.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case D)
// 2917.1-2917.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case R)
// 2994.1-2994.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case F)
// 2995.1-2995.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case H)
// 2996.1-2996.144: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case I)
// 3072.1-3072.136: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case J)
// 3073.1-3073.136: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case K)
// 3074.1-3074.99: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case L)
// 3152.1-3152.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3153.1-3153.101: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3154.1-3154.156: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3259.1-3259.140: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
// 3369.1-3369.144: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
// 3370.1-3370.144: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
// 3447.1-3447.136: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
// 3448.1-3448.136: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
// 3449.1-3449.144: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
// 3525.1-3525.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
// 3526.1-3526.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
// 3527.1-3527.99: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
// 3605.1-3605.140: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3606.1-3606.101: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3607.1-3607.158: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3712.1-3712.140: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
// 3822.1-3822.144: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
// 3823.1-3823.144: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
// 3900.1-3900.136: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
// 3901.1-3901.136: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
// 3902.1-3902.146: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
// 3978.1-3978.136: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
// 3979.1-3979.136: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
// 3980.1-3980.99: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
// 4058.1-4058.140: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.1)
// 4059.1-4059.101: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.2)
// 4060.1-4060.158: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.3)
// 4165.1-4165.140: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case C)
// 4275.1-4275.144: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case D)
// 4276.1-4276.144: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case R)
// 4353.1-4353.136: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case F)
// 4354.1-4354.136: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case H)
// 4355.1-4355.146: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case I)
// 4431.1-4431.136: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case J)
// 4432.1-4432.136: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case K)
// 4433.1-4433.99: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case L)
// 4511.1-4511.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.1)
// 4512.1-4512.101: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.2)
// 4513.1-4513.156: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.3)
// 4618.1-4618.140: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case C)
// 4728.1-4728.144: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case D)
// 4729.1-4729.144: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case R)
// 4806.1-4806.136: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case F)
// 4807.1-4807.136: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case H)
// 4808.1-4808.144: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case I)
// 4884.1-4884.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case J)
// 4885.1-4885.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case K)
// 4886.1-4886.99: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case L)
// 4964.1-4964.140: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.1)
// 4965.1-4965.101: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.2)
// 4966.1-4966.158: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.3)
// 5071.1-5071.140: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case C)
// 5181.1-5181.144: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case D)
// 5182.1-5182.144: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case R)
// 5259.1-5259.136: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case F)
// 5260.1-5260.136: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case H)
// 5261.1-5261.146: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case I)
// 5337.1-5337.136: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case J)
// 5338.1-5338.136: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case K)
// 5339.1-5339.99: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case L)
// 5417.1-5417.140: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.1)
// 5418.1-5418.101: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.2)
// 5419.1-5419.158: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.3)
// 5524.1-5524.140: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case C)
// 5634.1-5634.144: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case D)
// 5635.1-5635.144: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case R)
// 5712.1-5712.136: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case F)
// 5713.1-5713.136: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case H)
// 5714.1-5714.146: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case I)
// 5790.1-5790.136: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case J)
// 5791.1-5791.136: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case K)
// 5792.1-5792.99: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case L)
// 5827.1-5850.2: (4.2): yields_as clause for Mutex.m is not valid
// 5855.1-5873.2: (4.2): yields_as clause for Mutex.m is not reflexive
// 5879.1-5915.2: (4.2): yields_as clause for Mutex.m is not transitive
// 5935.1-5958.2: (7.32): yields_as clause for Mutex._lock is not valid
// 5963.1-5981.2: (7.32): yields_as clause for Mutex._lock is not reflexive
// 5987.1-6023.2: (7.32): yields_as clause for Mutex._lock is not transitive
// 6042.1-6065.2: (9.5): yields_as clause for Test.m is not valid
// 6070.1-6088.2: (9.5): yields_as clause for Test.m is not reflexive
// 6094.1-6130.2: (9.5): yields_as clause for Test.m is not transitive
// 6149.1-6172.2: (10.5): yields_as clause for Test.x is not valid
// 6177.1-6195.2: (10.5): yields_as clause for Test.x is not reflexive
// 6201.1-6237.2: (10.5): yields_as clause for Test.x is not transitive
// 6257.1-6280.2: (7.32): yields_as clause for Test._lock is not valid
// 6285.1-6303.2: (7.32): yields_as clause for Test._lock is not reflexive
// 6309.1-6345.2: (7.32): yields_as clause for Test._lock is not transitive
