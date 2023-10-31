                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/bug1-fixed.sink:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead                                                                                 
       ? this.m == tid ? B : E                                                                      
       : this.m == tid && newValue == Tid.null                                                      
         ? L                                                                                        
         : this.m == Tid.null && newValue == tid ? R : E !                                          
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
      invariant  this.m != Mutex.null;                                                              
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead                                                                                 
       ? this.m == tid ? B : E                                                                      
       : this.m == tid && newValue == Tid.null                                                      
         ? L                                                                                        
         : this.m == Tid.null && newValue == tid ? R : E !                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m != Mutex.null;                                                              
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead                                                                                 
       ? this.m == tid ? B : E                                                                      
       : this.m == tid && newValue == Tid.null                                                      
         ? L                                                                                        
         : this.m == Tid.null && newValue == tid ? R : E !                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m != Mutex.null;                                                              
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead                                                                                 
       ? this.m == tid ? B : E                                                                      
       : this.m == tid && newValue == Tid.null                                                      
         ? L                                                                                        
         : this.m == Tid.null && newValue == tid ? R : E !                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m != Mutex.null;                                                              
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
  if ((Mutex.m[this]==tid)) then                                                                    
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((Mutex.m[this]==tid)&&(newValue==Tid.null))) then                                            
   moverPath(_L, 2)                                                                                 
  else                                                                                              
   if (((Mutex.m[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex.m(tid: Tid,this : Mutex,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((Mutex.m[this]==tid)) then                                                                    
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((Mutex.m[this]==tid)&&(newValue==Tid.null))) then                                            
   moverPath(_L, 2)                                                                                 
  else                                                                                              
   if (((Mutex.m[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
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
                                                                                                    
function {:inline} Invariant.Test.460520(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (bool) {
 (Test.m[this]!=Mutex.null)                                                                         
}                                                                                                   
                                                                                                    
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
 assert isError(_writeByU_Mover);                                                                          // (11.5): Test.m failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (11.5): Test.m failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (11.5): Test.m failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (11.5): Test.m failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.5): Test.m failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.5): Test.m failed Read-Write Left-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (12.5): Test.x failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (12.5): Test.x failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (12.5): Test.x failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): Test.x failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Test.x failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Test.x failed Read-Write Left-Mover Check
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
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
 assume _writeByU_Mover != _E;  // will block until it can go...                                    
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
                                                                                                    
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
                                                                                                    
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
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
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
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
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
 assume _writeByU_Mover != _E;  // will block until it can go...                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): Test.m is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Test.x is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
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
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
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
 assume _writeByU_Mover != _E;  // will block until it can go...                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): Test.m is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): Test.m is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Test.x is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Test.x is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Test.x is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Test.x is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
requires ValidTid(tid);                                                                             
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (<undefined position>): Object invariant may not hold.
modifies Mutex._state;                                                                              
modifies Mutex.m;                                                                                   
modifies Mutex._lock;                                                                               
modifies Test._state;                                                                               
modifies Test.m;                                                                                    
modifies Test.x;                                                                                    
modifies Test._lock;                                                                                
ensures StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
ensures Y(tid , old(Mutex._state), old(Mutex.m), old(Mutex._lock), old(Test._state), old(Test.m), old(Test.x), old(Test._lock) , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test.x, Test._lock);
ensures  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
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
 assume leq(m#moverPath(ReadEval.Mutex.m(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock)), _N);
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
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (4.12): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (3.1): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (11.14): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (12.14): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Test ::  { Test._state[_this] } isAccessible(Test._state[_this], tid) && true ==> Invariant.Test.460520(tid: Tid,_this : Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test.x,Test._lock));       // (10.1): Object invariant may not hold.
                                                                                                    
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
                                                                                                    
                                                                                                    
// 641.1-641.34: (4.2): Mutex.m failed Write-Write Right-Mover Check
// 706.1-706.30: (4.2): Mutex.m failed Write-Read Right-Mover Check
// 775.1-775.34: (4.2): Mutex.m failed Write-Write Left-Mover Check
// 841.1-841.30: (4.2): Mutex.m failed Write-Read Left-Mover Check
// 904.1-904.34: (4.2): Mutex.m failed Read-Write Right-Mover Check
// 970.1-970.34: (4.2): Mutex.m failed Read-Write Left-Mover Check
// 1035.1-1035.34: (11.5): Test.m failed Write-Write Right-Mover Check
// 1100.1-1100.30: (11.5): Test.m failed Write-Read Right-Mover Check
// 1169.1-1169.34: (11.5): Test.m failed Write-Write Left-Mover Check
// 1235.1-1235.30: (11.5): Test.m failed Write-Read Left-Mover Check
// 1298.1-1298.34: (11.5): Test.m failed Read-Write Right-Mover Check
// 1364.1-1364.34: (11.5): Test.m failed Read-Write Left-Mover Check
// 1429.1-1429.34: (12.5): Test.x failed Write-Write Right-Mover Check
// 1494.1-1494.30: (12.5): Test.x failed Write-Read Right-Mover Check
// 1563.1-1563.34: (12.5): Test.x failed Write-Write Left-Mover Check
// 1629.1-1629.30: (12.5): Test.x failed Write-Read Left-Mover Check
// 1692.1-1692.34: (12.5): Test.x failed Read-Write Right-Mover Check
// 1758.1-1758.34: (12.5): Test.x failed Read-Write Left-Mover Check
// 1835.1-1835.140: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 1836.1-1836.101: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 1837.1-1837.158: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 1942.1-1942.140: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2052.1-2052.144: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2053.1-2053.144: (4.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2130.1-2130.136: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2131.1-2131.136: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2132.1-2132.146: (4.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
// 2208.1-2208.136: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2209.1-2209.136: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2210.1-2210.99: (4.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2288.1-2288.140: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2289.1-2289.101: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2290.1-2290.156: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2395.1-2395.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
// 2505.1-2505.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
// 2506.1-2506.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
// 2583.1-2583.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
// 2584.1-2584.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
// 2585.1-2585.144: (4.2): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
// 2661.1-2661.136: (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2662.1-2662.136: (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2663.1-2663.99: (11.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2741.1-2741.140: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2742.1-2742.101: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2743.1-2743.156: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2848.1-2848.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case C)
// 2958.1-2958.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case D)
// 2959.1-2959.144: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case R)
// 3036.1-3036.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case F)
// 3037.1-3037.136: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case H)
// 3038.1-3038.144: (4.2): Mutex.m is not Read-Write Stable with respect to Test.x (case I)
// 3114.1-3114.136: (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case J)
// 3115.1-3115.136: (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case K)
// 3116.1-3116.99: (12.5): Test.x is not Write-Read Stable with respect to Mutex.m (case L)
// 3194.1-3194.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3195.1-3195.101: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3196.1-3196.156: (4.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3301.1-3301.140: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
// 3411.1-3411.144: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
// 3412.1-3412.144: (11.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
// 3489.1-3489.136: (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
// 3490.1-3490.136: (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
// 3491.1-3491.144: (11.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
// 3567.1-3567.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
// 3568.1-3568.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
// 3569.1-3569.99: (4.2): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
// 3647.1-3647.140: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3648.1-3648.101: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3649.1-3649.158: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3754.1-3754.140: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
// 3864.1-3864.144: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
// 3865.1-3865.144: (11.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
// 3942.1-3942.136: (11.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
// 3943.1-3943.136: (11.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
// 3944.1-3944.146: (11.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
// 4020.1-4020.136: (11.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
// 4021.1-4021.136: (11.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
// 4022.1-4022.99: (11.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
// 4100.1-4100.140: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.1)
// 4101.1-4101.101: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.2)
// 4102.1-4102.158: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case A.3)
// 4207.1-4207.140: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case C)
// 4317.1-4317.144: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case D)
// 4318.1-4318.144: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case R)
// 4395.1-4395.136: (11.5): Test.m is not Read-Write Stable with respect to Test.x (case F)
// 4396.1-4396.136: (11.5): Test.m is not Read-Write Stable with respect to Test.x (case H)
// 4397.1-4397.146: (11.5): Test.m is not Read-Write Stable with respect to Test.x (case I)
// 4473.1-4473.136: (12.5): Test.x is not Write-Read Stable with respect to Test.m (case J)
// 4474.1-4474.136: (12.5): Test.x is not Write-Read Stable with respect to Test.m (case K)
// 4475.1-4475.99: (12.5): Test.x is not Write-Read Stable with respect to Test.m (case L)
// 4553.1-4553.140: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.1)
// 4554.1-4554.101: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.2)
// 4555.1-4555.156: (4.2): Mutex.m is not Write-Write Stable with respect to Test.x (case A.3)
// 4660.1-4660.140: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case C)
// 4770.1-4770.144: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case D)
// 4771.1-4771.144: (12.5): Test.x is not Write-Write Stable with respect to Mutex.m (case R)
// 4848.1-4848.136: (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case F)
// 4849.1-4849.136: (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case H)
// 4850.1-4850.144: (12.5): Test.x is not Read-Write Stable with respect to Mutex.m (case I)
// 4926.1-4926.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case J)
// 4927.1-4927.136: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case K)
// 4928.1-4928.99: (4.2): Mutex.m is not Write-Read Stable with respect to Test.x (case L)
// 5006.1-5006.140: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.1)
// 5007.1-5007.101: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.2)
// 5008.1-5008.158: (11.5): Test.m is not Write-Write Stable with respect to Test.x (case A.3)
// 5113.1-5113.140: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case C)
// 5223.1-5223.144: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case D)
// 5224.1-5224.144: (12.5): Test.x is not Write-Write Stable with respect to Test.m (case R)
// 5301.1-5301.136: (12.5): Test.x is not Read-Write Stable with respect to Test.m (case F)
// 5302.1-5302.136: (12.5): Test.x is not Read-Write Stable with respect to Test.m (case H)
// 5303.1-5303.146: (12.5): Test.x is not Read-Write Stable with respect to Test.m (case I)
// 5379.1-5379.136: (11.5): Test.m is not Write-Read Stable with respect to Test.x (case J)
// 5380.1-5380.136: (11.5): Test.m is not Write-Read Stable with respect to Test.x (case K)
// 5381.1-5381.99: (11.5): Test.m is not Write-Read Stable with respect to Test.x (case L)
// 5459.1-5459.140: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.1)
// 5460.1-5460.101: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.2)
// 5461.1-5461.158: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case A.3)
// 5566.1-5566.140: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case C)
// 5676.1-5676.144: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case D)
// 5677.1-5677.144: (12.5): Test.x is not Write-Write Stable with respect to Test.x (case R)
// 5754.1-5754.136: (12.5): Test.x is not Read-Write Stable with respect to Test.x (case F)
// 5755.1-5755.136: (12.5): Test.x is not Read-Write Stable with respect to Test.x (case H)
// 5756.1-5756.146: (12.5): Test.x is not Read-Write Stable with respect to Test.x (case I)
// 5832.1-5832.136: (12.5): Test.x is not Write-Read Stable with respect to Test.x (case J)
// 5833.1-5833.136: (12.5): Test.x is not Write-Read Stable with respect to Test.x (case K)
// 5834.1-5834.99: (12.5): Test.x is not Write-Read Stable with respect to Test.x (case L)
// 5841.1-5841.225: (<undefined position>): Object invariant may not hold.
// 5851.1-5851.224: (<undefined position>): Object invariant may not hold.
// 5871.1-5894.2: (4.2): yields_as clause for Mutex.m is not valid
// 5899.1-5917.2: (4.2): yields_as clause for Mutex.m is not reflexive
// 5923.1-5923.225: (4.12): Object invariant may not hold.
// 5924.1-5960.2: (4.2): yields_as clause for Mutex.m is not transitive
// 5980.1-6003.2: (7.32): yields_as clause for Mutex._lock is not valid
// 6008.1-6026.2: (7.32): yields_as clause for Mutex._lock is not reflexive
// 6032.1-6032.225: (3.1): Object invariant may not hold.
// 6033.1-6069.2: (7.32): yields_as clause for Mutex._lock is not transitive
// 6088.1-6111.2: (11.5): yields_as clause for Test.m is not valid
// 6116.1-6134.2: (11.5): yields_as clause for Test.m is not reflexive
// 6140.1-6140.225: (11.14): Object invariant may not hold.
// 6141.1-6177.2: (11.5): yields_as clause for Test.m is not transitive
// 6196.1-6219.2: (12.5): yields_as clause for Test.x is not valid
// 6224.1-6242.2: (12.5): yields_as clause for Test.x is not reflexive
// 6248.1-6248.225: (12.14): Object invariant may not hold.
// 6249.1-6285.2: (12.5): yields_as clause for Test.x is not transitive
// 6305.1-6328.2: (7.32): yields_as clause for Test._lock is not valid
// 6333.1-6351.2: (7.32): yields_as clause for Test._lock is not reflexive
// 6357.1-6357.225: (10.1): Object invariant may not hold.
// 6358.1-6394.2: (7.32): yields_as clause for Test._lock is not transitive
