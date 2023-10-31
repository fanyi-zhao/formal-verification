                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/yields_as_trans.anchor:                 
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
      volatile int m N                                                                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
       int x this.m.m == tid ? B : E                                                                
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Mutex.null;                                                                
        assume this.x == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
      volatile int m N                                                                              
                                                                                                    
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
        assume this.m == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Mutex.null;                                                                
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
      volatile int m N                                                                              
                                                                                                    
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
        assume this.m == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Mutex.null;                                                                
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
      volatile int m N                                                                              
                                                                                                    
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
        assume this.m == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Mutex.null;                                                                
        assume this.x == 0;                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Mutex ***/                                                                          
                                                                                                    
type Mutex;                                                                                         
const unique Mutex.null: Mutex;                                                                     
var Mutex._state: [Mutex]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Mutex.m: [Mutex]int;                                                                            
                                                                                                    
function {:inline} ReadEval.Mutex.m(tid: Tid,this : Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex.m(tid: Tid,this : Mutex,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test.x: [Test]int,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
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
 assert isError(_writeByU_Mover);                                                                          // (4.5): Mutex.m failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (4.5): Mutex.m failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (4.5): Mutex.m failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Mutex.m failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Mutex.m failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Mutex.m failed Read-Write Left-Mover Check
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case I)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.3)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
// 689.1-689.34: (4.5): Mutex.m failed Write-Write Right-Mover Check
// 754.1-754.30: (4.5): Mutex.m failed Write-Read Right-Mover Check
// 823.1-823.34: (4.5): Mutex.m failed Write-Write Left-Mover Check
// 889.1-889.30: (4.5): Mutex.m failed Write-Read Left-Mover Check
// 952.1-952.34: (4.5): Mutex.m failed Read-Write Right-Mover Check
// 1018.1-1018.34: (4.5): Mutex.m failed Read-Write Left-Mover Check
// 1083.1-1083.34: (9.5): Test.m failed Write-Write Right-Mover Check
// 1148.1-1148.30: (9.5): Test.m failed Write-Read Right-Mover Check
// 1217.1-1217.34: (9.5): Test.m failed Write-Write Left-Mover Check
// 1283.1-1283.30: (9.5): Test.m failed Write-Read Left-Mover Check
// 1346.1-1346.34: (9.5): Test.m failed Read-Write Right-Mover Check
// 1412.1-1412.34: (9.5): Test.m failed Read-Write Left-Mover Check
// 1477.1-1477.34: (10.5): Test.x failed Write-Write Right-Mover Check
// 1542.1-1542.30: (10.5): Test.x failed Write-Read Right-Mover Check
// 1611.1-1611.34: (10.5): Test.x failed Write-Write Left-Mover Check
// 1677.1-1677.30: (10.5): Test.x failed Write-Read Left-Mover Check
// 1740.1-1740.34: (10.5): Test.x failed Read-Write Right-Mover Check
// 1806.1-1806.34: (10.5): Test.x failed Read-Write Left-Mover Check
// 1883.1-1883.140: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 1884.1-1884.101: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 1885.1-1885.158: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 1990.1-1990.140: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2100.1-2100.144: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2101.1-2101.144: (4.5): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2178.1-2178.136: (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2179.1-2179.136: (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2180.1-2180.146: (4.5): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
// 2256.1-2256.136: (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2257.1-2257.136: (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2258.1-2258.99: (4.5): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2336.1-2336.140: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2337.1-2337.101: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2338.1-2338.156: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2443.1-2443.140: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
// 2553.1-2553.144: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
// 2554.1-2554.144: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
// 2631.1-2631.136: (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
// 2632.1-2632.136: (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
// 2633.1-2633.144: (4.5): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
// 2709.1-2709.136: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2710.1-2710.136: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2711.1-2711.99: (9.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2789.1-2789.140: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2790.1-2790.101: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2791.1-2791.156: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2896.1-2896.140: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case C)
// 3006.1-3006.144: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case D)
// 3007.1-3007.144: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case R)
// 3084.1-3084.136: (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case F)
// 3085.1-3085.136: (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case H)
// 3086.1-3086.144: (4.5): Mutex.m is not Read-Write Stable with respect to Test.x (case I)
// 3162.1-3162.136: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case J)
// 3163.1-3163.136: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case K)
// 3164.1-3164.99: (10.5): Test.x is not Write-Read Stable with respect to Mutex.m (case L)
// 3242.1-3242.140: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3243.1-3243.101: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3244.1-3244.156: (4.5): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3349.1-3349.140: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
// 3459.1-3459.144: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
// 3460.1-3460.144: (9.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
// 3537.1-3537.136: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
// 3538.1-3538.136: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
// 3539.1-3539.144: (9.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
// 3615.1-3615.136: (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
// 3616.1-3616.136: (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
// 3617.1-3617.99: (4.5): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
// 3695.1-3695.140: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3696.1-3696.101: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3697.1-3697.158: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3802.1-3802.140: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
// 3912.1-3912.144: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
// 3913.1-3913.144: (9.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
// 3990.1-3990.136: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
// 3991.1-3991.136: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
// 3992.1-3992.146: (9.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
// 4068.1-4068.136: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
// 4069.1-4069.136: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
// 4070.1-4070.99: (9.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
// 4148.1-4148.140: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.1)
// 4149.1-4149.101: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.2)
// 4150.1-4150.158: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case A.3)
// 4255.1-4255.140: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case C)
// 4365.1-4365.144: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case D)
// 4366.1-4366.144: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case R)
// 4443.1-4443.136: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case F)
// 4444.1-4444.136: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case H)
// 4445.1-4445.146: (9.5): Test.m is not Read-Write Stable with respect to Test.x (case I)
// 4521.1-4521.136: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case J)
// 4522.1-4522.136: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case K)
// 4523.1-4523.99: (10.5): Test.x is not Write-Read Stable with respect to Test.m (case L)
// 4601.1-4601.140: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.1)
// 4602.1-4602.101: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.2)
// 4603.1-4603.156: (4.5): Mutex.m is not Write-Write Stable with respect to Test.x (case A.3)
// 4708.1-4708.140: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case C)
// 4818.1-4818.144: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case D)
// 4819.1-4819.144: (10.5): Test.x is not Write-Write Stable with respect to Mutex.m (case R)
// 4896.1-4896.136: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case F)
// 4897.1-4897.136: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case H)
// 4898.1-4898.144: (10.5): Test.x is not Read-Write Stable with respect to Mutex.m (case I)
// 4974.1-4974.136: (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case J)
// 4975.1-4975.136: (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case K)
// 4976.1-4976.99: (4.5): Mutex.m is not Write-Read Stable with respect to Test.x (case L)
// 5054.1-5054.140: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.1)
// 5055.1-5055.101: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.2)
// 5056.1-5056.158: (9.5): Test.m is not Write-Write Stable with respect to Test.x (case A.3)
// 5161.1-5161.140: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case C)
// 5271.1-5271.144: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case D)
// 5272.1-5272.144: (10.5): Test.x is not Write-Write Stable with respect to Test.m (case R)
// 5349.1-5349.136: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case F)
// 5350.1-5350.136: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case H)
// 5351.1-5351.146: (10.5): Test.x is not Read-Write Stable with respect to Test.m (case I)
// 5427.1-5427.136: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case J)
// 5428.1-5428.136: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case K)
// 5429.1-5429.99: (9.5): Test.m is not Write-Read Stable with respect to Test.x (case L)
// 5507.1-5507.140: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.1)
// 5508.1-5508.101: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.2)
// 5509.1-5509.158: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case A.3)
// 5614.1-5614.140: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case C)
// 5724.1-5724.144: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case D)
// 5725.1-5725.144: (10.5): Test.x is not Write-Write Stable with respect to Test.x (case R)
// 5802.1-5802.136: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case F)
// 5803.1-5803.136: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case H)
// 5804.1-5804.146: (10.5): Test.x is not Read-Write Stable with respect to Test.x (case I)
// 5880.1-5880.136: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case J)
// 5881.1-5881.136: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case K)
// 5882.1-5882.99: (10.5): Test.x is not Write-Read Stable with respect to Test.x (case L)
// 5917.1-5940.2: (4.5): yields_as clause for Mutex.m is not valid
// 5945.1-5963.2: (4.5): yields_as clause for Mutex.m is not reflexive
// 5969.1-6005.2: (4.5): yields_as clause for Mutex.m is not transitive
// 6025.1-6048.2: (7.32): yields_as clause for Mutex._lock is not valid
// 6053.1-6071.2: (7.32): yields_as clause for Mutex._lock is not reflexive
// 6077.1-6113.2: (7.32): yields_as clause for Mutex._lock is not transitive
// 6132.1-6155.2: (9.5): yields_as clause for Test.m is not valid
// 6160.1-6178.2: (9.5): yields_as clause for Test.m is not reflexive
// 6184.1-6220.2: (9.5): yields_as clause for Test.m is not transitive
// 6239.1-6262.2: (10.5): yields_as clause for Test.x is not valid
// 6267.1-6285.2: (10.5): yields_as clause for Test.x is not reflexive
// 6291.1-6327.2: (10.5): yields_as clause for Test.x is not transitive
// 6347.1-6370.2: (7.32): yields_as clause for Test._lock is not valid
// 6375.1-6393.2: (7.32): yields_as clause for Test._lock is not reflexive
// 6399.1-6435.2: (7.32): yields_as clause for Test._lock is not transitive
