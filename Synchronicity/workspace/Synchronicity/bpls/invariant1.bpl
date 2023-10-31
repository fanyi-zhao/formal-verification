                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/invariant1.sink:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m N                                                                                      
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void acq() {                                                                                  
        yield;                                                                                      
        while (true)   {                                                                            
          yield;                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        Mutex m;                                                                                    
        m := this.m;                                                                                
        invariant m == this.m;                                                                      
        m.acq()                                                                                     
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m N                                                                                      
                                                                                                    
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
      void acq() {                                                                                  
        yield;                                                                                      
        while (true)   {                                                                            
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
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
      public void f() {                                                                             
        Mutex m;                                                                                    
        m := this.m;                                                                                
        invariant m == this.m;                                                                      
        m.acq()                                                                                     
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m N                                                                                      
                                                                                                    
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
      void acq() {                                                                                  
        yield;                                                                                      
        while (true)   {                                                                            
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
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
      public void f() {                                                                             
        Mutex m;                                                                                    
        m := this.m;                                                                                
        invariant m == this.m;                                                                      
        {                                                                                           
          inlined m.acq();                                                                          
          exit$208: {                                                                               
            Mutex this$208;                                                                         
            this$208 = m;                                                                           
            {                                                                                       
              yield;                                                                                
              while (true)   {                                                                      
                yield;                                                                              
              }                                                                                     
              {                                                                                     
                break exit$208;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m N                                                                                      
                                                                                                    
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
      void acq() {                                                                                  
        yield;                                                                                      
        while (true)   {                                                                            
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
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
      public void f() {                                                                             
        Mutex m;                                                                                    
        m := this.m;                                                                                
        invariant m == this.m;                                                                      
        {                                                                                           
          inlined m.acq();                                                                          
          exit$208: {                                                                               
            Mutex this$208;                                                                         
            this$208 = m;                                                                           
            {                                                                                       
              yield;                                                                                
              while (true)   {                                                                      
                yield;                                                                              
              }                                                                                     
              {                                                                                     
                break exit$208;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Mutex ***/                                                                          
                                                                                                    
type Mutex;                                                                                         
const unique Mutex.null: Mutex;                                                                     
var Mutex._state: [Mutex]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Mutex.m: [Mutex]int;                                                                            
                                                                                                    
function {:inline} ReadEval.Mutex.m(tid: Tid,this : Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex.m(tid: Tid,this : Mutex,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Mutex._lock: [Mutex]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Mutex._lock(tid: Tid,this : Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Mutex._lock(tid: Tid,this : Mutex,newValue: Tid,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Test.m(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Mutex.null;                                                                       
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Test.m(tid: Tid,this : Test,newValue: Mutex,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Test._lock: [Test]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Test._lock(tid: Tid,this : Test,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Test._lock(tid: Tid,this : Test,newValue: Tid,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Test.f(tid:Tid, this : Test)                                                             
modifies Mutex._state;                                                                              
modifies Mutex.m;                                                                                   
modifies Mutex._lock;                                                                               
modifies Test._state;                                                                               
modifies Test.m;                                                                                    
modifies Test._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (21.5): Bad tid
requires isShared(Test._state[this]);                                                                      // (21.5): this is not global
                                                                                                    
requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);       
                                                                                                    
ensures StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);        
{                                                                                                   
 var path2314319: int;                                                                              
 var Test.m2314338_bottom: [Test]Mutex;                                                             
 var this_m: Mutex;                                                                                 
 var m2314319: Mutex;                                                                               
 var Mutex._lock2314333: [Mutex]Tid;                                                                
 var Mutex._state2314338: [Mutex]State;                                                             
 var moverPath2314353: MoverPath;                                                                   
 var Mutex._state2314353: [Mutex]State;                                                             
 var m: Mutex;                                                                                      
 var Mutex.m2314319: [Mutex]int;                                                                    
 var Test.m2314336_post: [Test]Mutex;                                                               
 var $pc2314336_post: Phase;                                                                        
 var this2314338_bottom: Test;                                                                      
 var m2314333: Mutex;                                                                               
 var this$2082314338_bottom: Mutex;                                                                 
 var m2314333_post: Mutex;                                                                          
 var Test._lock2314353: [Test]Tid;                                                                  
 var tid2314338_bottom: Tid;                                                                        
 var Mutex.m2314333_post: [Mutex]int;                                                               
 var this2314353: Test;                                                                             
 var $pc2314338: Phase;                                                                             
 var $pc2314358: Phase;                                                                             
 var $recorded.state2314338_bottom: int;                                                            
 var Mutex.m2314338: [Mutex]int;                                                                    
 var Mutex.m2314333: [Mutex]int;                                                                    
 var this$2082314338: Mutex;                                                                        
 var Mutex.m2314338_bottom: [Mutex]int;                                                             
 var this2314338: Test;                                                                             
 var Mutex._state2314319: [Mutex]State;                                                             
 var $pc2314353: Phase;                                                                             
 var this2314336: Test;                                                                             
 var this$2082314333: Mutex;                                                                        
 var $recorded.state2314336_post: int;                                                              
 var m2314353: Mutex;                                                                               
 var Test._state2314359: [Test]State;                                                               
 var moverPath2314319: MoverPath;                                                                   
 var Mutex.m2314359: [Mutex]int;                                                                    
 var m2314359: Mutex;                                                                               
 var $pc2314319: Phase;                                                                             
 var Mutex._lock2314319: [Mutex]Tid;                                                                
 var $recorded.state2314333_post: int;                                                              
 var Mutex._lock2314338_bottom: [Mutex]Tid;                                                         
 var Test._state2314338: [Test]State;                                                               
 var Test.m2314333_post: [Test]Mutex;                                                               
 var this_m2314359: Mutex;                                                                          
 var Test._lock2314319: [Test]Tid;                                                                  
 var $pc2314333: Phase;                                                                             
 var Mutex._lock2314359: [Mutex]Tid;                                                                
 var tid2314333: Tid;                                                                               
 var m2314358: Mutex;                                                                               
 var tid2314336: Tid;                                                                               
 var phase2314338: Phase;                                                                           
 var Test.m2314353: [Test]Mutex;                                                                    
 var Test._state2314358: [Test]State;                                                               
 var Test._lock2314338: [Test]Tid;                                                                  
 var $recorded.state2314319: int;                                                                   
 var Test.m2314358: [Test]Mutex;                                                                    
 var tid2314353: Tid;                                                                               
 var Mutex._state2314359: [Mutex]State;                                                             
 var Test._state2314338_bottom: [Test]State;                                                        
 var this_m2314358: Mutex;                                                                          
 var Test._lock2314338_bottom: [Test]Tid;                                                           
 var Test._state2314336: [Test]State;                                                               
 var this2314359: Test;                                                                             
 var Test._lock2314336: [Test]Tid;                                                                  
 var Test._lock2314333_post: [Test]Tid;                                                             
 var this2314333_post: Test;                                                                        
 var tid2314333_post: Tid;                                                                          
 var Test._state2314336_post: [Test]State;                                                          
 var $recorded.state2314333: int;                                                                   
 var Test._lock2314333: [Test]Tid;                                                                  
 var Mutex._lock2314336_post: [Mutex]Tid;                                                           
 var Test._state2314353: [Test]State;                                                               
 var this$208: Mutex;                                                                               
 var Test._lock2314336_post: [Test]Tid;                                                             
 var Mutex.m2314336: [Mutex]int;                                                                    
 var Test.m2314319: [Test]Mutex;                                                                    
 var Mutex._state2314333: [Mutex]State;                                                             
 var Mutex._state2314338_bottom: [Mutex]State;                                                      
 var $recorded.state2314358: int;                                                                   
 var Mutex.m2314353: [Mutex]int;                                                                    
 var Mutex._state2314336: [Mutex]State;                                                             
 var m2314336: Mutex;                                                                               
 var $recorded.state2314338: int;                                                                   
 var path2314353: int;                                                                              
 var mover2314353: Mover;                                                                           
 var $recorded.state2314336: int;                                                                   
 var tid2314338: Tid;                                                                               
 var this$2082314333_post: Mutex;                                                                   
 var Test._state2314333_post: [Test]State;                                                          
 var mover2314319: Mover;                                                                           
 var this2314336_post: Test;                                                                        
 var m2314338: Mutex;                                                                               
 var $pc2314333_post: Phase;                                                                        
 var this$2082314336_post: Mutex;                                                                   
 var Mutex.m2314336_post: [Mutex]int;                                                               
 var tid2314358: Tid;                                                                               
 var Mutex._lock2314336: [Mutex]Tid;                                                                
 var Test._state2314319: [Test]State;                                                               
 var Test.m2314336: [Test]Mutex;                                                                    
 var Mutex._state2314358: [Mutex]State;                                                             
 var $pc2314336: Phase;                                                                             
 var Test._state2314333: [Test]State;                                                               
 var Test.m2314359: [Test]Mutex;                                                                    
 var this2314358: Test;                                                                             
 var $recorded.state2314353: int;                                                                   
 var tid2314359: Tid;                                                                               
 var this$2082314336: Mutex;                                                                        
 var this2314333: Test;                                                                             
 var this2314319: Test;                                                                             
 var Test.m2314338: [Test]Mutex;                                                                    
 var $recorded.state2314359: int;                                                                   
 var Mutex._lock2314358: [Mutex]Tid;                                                                
 var tid2314319: Tid;                                                                               
 var $pc2314338_bottom: Phase;                                                                      
 var $pc2314359: Phase;                                                                             
 var m2314338_bottom: Mutex;                                                                        
 var Mutex._lock2314338: [Mutex]Tid;                                                                
 var Mutex.m2314358: [Mutex]int;                                                                    
 var Test._lock2314358: [Test]Tid;                                                                  
 var this_m2314353: Mutex;                                                                          
 var m2314336_post: Mutex;                                                                          
 var Mutex._state2314336_post: [Mutex]State;                                                        
 var Test.m2314333: [Test]Mutex;                                                                    
 var tid2314336_post: Tid;                                                                          
 var Test._lock2314359: [Test]Tid;                                                                  
 var Mutex._lock2314353: [Mutex]Tid;                                                                
 var Mutex._state2314333_post: [Mutex]State;                                                        
 var Mutex._lock2314333_post: [Mutex]Tid;                                                           
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 22.9: Mutex m;                                                                                  
                                                                                                    
                                                                                                    
 // 22.9: m := this.m;                                                                              
                                                                                                    
                                                                                                    
 moverPath2314319 := ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 mover2314319 := m#moverPath(moverPath2314319);                                                     
 path2314319 := p#moverPath(moverPath2314319);                                                      
 assume Mutex._state2314319 == Mutex._state && Mutex.m2314319 == Mutex.m && Mutex._lock2314319 == Mutex._lock && Test._state2314319 == Test._state && Test.m2314319 == Test.m && Test._lock2314319 == Test._lock && m2314319 == m && this2314319 == this && tid2314319 == tid && $pc2314319 == $pc;
 assume $recorded.state2314319 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Test.null;                                                                         
 } else {                                                                                           
  assert this != Test.null;                                                                                // (22.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2314319);                                                              
 assert $pc != PhaseError;                                                                                 // (22.9): Reduction failure
 m := Test.m[this];                                                                                 
 assert (m==Test.m[this]);                                                                          
 // inlined: m.acq()}                                                                               
 exit$208_top:                                                                                      
                                                                                                    
 // 24.9: Mutex this$208;                                                                           
                                                                                                    
                                                                                                    
 // 24.9: this$208 = m;                                                                             
                                                                                                    
 this$208 := m;                                                                                     
                                                                                                    
 // 8.9: yield;                                                                                     
                                                                                                    
 assume Mutex._state2314333 == Mutex._state && Mutex.m2314333 == Mutex.m && Mutex._lock2314333 == Mutex._lock && Test._state2314333 == Test._state && Test.m2314333 == Test.m && Test._lock2314333 == Test._lock && this$2082314333 == this$208 && m2314333 == m && this2314333 == this && tid2314333 == tid;
 assume $recorded.state2314333 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Mutex._state2314333_post == Mutex._state && Mutex.m2314333_post == Mutex.m && Mutex._lock2314333_post == Mutex._lock && Test._state2314333_post == Test._state && Test.m2314333_post == Test.m && Test._lock2314333_post == Test._lock && this$2082314333_post == this$208 && m2314333_post == m && this2314333_post == this && tid2314333_post == tid;
 assume $recorded.state2314333_post == 1;                                                           
 assert (m==Test.m[this]);                                                                                 // (8.9): Invariant may not hold.
 assume Mutex._state2314338 == Mutex._state && Mutex.m2314338 == Mutex.m && Mutex._lock2314338 == Mutex._lock && Test._state2314338 == Test._state && Test.m2314338 == Test.m && Test._lock2314338 == Test._lock && this$2082314338 == this$208 && m2314338 == m && this2314338 == this && tid2314338 == tid;
 assume $recorded.state2314338 == 1;                                                                
                                                                                                    
 // 9.9: while (true)   {                                                                           
                                                                                                    
 phase2314338 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (21.5): Bad tid
  invariant isShared(Test._state[this]);                                                                   // (21.5): this is not global
                                                                                                    
  invariant StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);    
  invariant (m==Test.m[this]);                                                                      
  invariant (forall _this : Mutex :: Invariant.Y_Mutex.m(tid : Tid, _this, Mutex.m[_this] ,Mutex._state2314338,Mutex.m2314338,Mutex._lock2314338,Test._state2314338,Test.m2314338,Test._lock2314338));       // (9.9): Loop does not preserve yields_as annotation for field m
  invariant (forall _this : Test :: Invariant.Y_Test.m(tid : Tid, _this, Test.m[_this] ,Mutex._state2314338,Mutex.m2314338,Mutex._lock2314338,Test._state2314338,Test.m2314338,Test._lock2314338));       // (9.9): Loop does not preserve yields_as annotation for field m
  invariant phase2314338 == $pc;                                                                           // (9.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (9.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 10.13: yield;                                                                                  
                                                                                                    
  assume Mutex._state2314336 == Mutex._state && Mutex.m2314336 == Mutex.m && Mutex._lock2314336 == Mutex._lock && Test._state2314336 == Test._state && Test.m2314336 == Test.m && Test._lock2314336 == Test._lock && this$2082314336 == this$208 && m2314336 == m && this2314336 == this && tid2314336 == tid;
  assume $recorded.state2314336 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Mutex._state2314336_post == Mutex._state && Mutex.m2314336_post == Mutex.m && Mutex._lock2314336_post == Mutex._lock && Test._state2314336_post == Test._state && Test.m2314336_post == Test.m && Test._lock2314336_post == Test._lock && this$2082314336_post == this$208 && m2314336_post == m && this2314336_post == this && tid2314336_post == tid;
  assume $recorded.state2314336_post == 1;                                                          
  assert (m==Test.m[this]);                                                                                // (10.13): Invariant may not hold.
  assume Mutex._state2314338_bottom == Mutex._state && Mutex.m2314338_bottom == Mutex.m && Mutex._lock2314338_bottom == Mutex._lock && Test._state2314338_bottom == Test._state && Test.m2314338_bottom == Test.m && Test._lock2314338_bottom == Test._lock && this$2082314338_bottom == this$208 && m2314338_bottom == m && this2314338_bottom == this && tid2314338_bottom == tid;
  assume $recorded.state2314338_bottom == 1;                                                        
  assert phase2314338 == $pc;                                                                              // (9.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 7.16: break exit$208;                                                                           
                                                                                                    
 goto exit$208_bottom;                                                                              
 exit$208_bottom:                                                                                   
                                                                                                    
 // 25.9: Mutex this_m;                                                                             
                                                                                                    
                                                                                                    
 // 25.9: this_m := this.m;                                                                         
                                                                                                    
                                                                                                    
 moverPath2314353 := ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 mover2314353 := m#moverPath(moverPath2314353);                                                     
 path2314353 := p#moverPath(moverPath2314353);                                                      
 assume Mutex._state2314353 == Mutex._state && Mutex.m2314353 == Mutex.m && Mutex._lock2314353 == Mutex._lock && Test._state2314353 == Test._state && Test.m2314353 == Test.m && Test._lock2314353 == Test._lock && this_m2314353 == this_m && m2314353 == m && this2314353 == this && tid2314353 == tid && $pc2314353 == $pc;
 assume $recorded.state2314353 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Test.null;                                                                         
 } else {                                                                                           
  assert this != Test.null;                                                                                // (25.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2314353);                                                              
 assert $pc != PhaseError;                                                                                 // (25.9): Reduction failure
 this_m := Test.m[this];                                                                            
                                                                                                    
 // 26.9: assert this_m == m;                                                                       
                                                                                                    
 assume Mutex._state2314358 == Mutex._state && Mutex.m2314358 == Mutex.m && Mutex._lock2314358 == Mutex._lock && Test._state2314358 == Test._state && Test.m2314358 == Test.m && Test._lock2314358 == Test._lock && this_m2314358 == this_m && m2314358 == m && this2314358 == this && tid2314358 == tid;
 assume $recorded.state2314358 == 1;                                                                
 assert (this_m==m);                                                                                       // (26.9): This assertion may not hold.
                                                                                                    
 // 21.21: // return;                                                                               
                                                                                                    
 assume Mutex._state2314359 == Mutex._state && Mutex.m2314359 == Mutex.m && Mutex._lock2314359 == Mutex._lock && Test._state2314359 == Test._state && Test.m2314359 == Test.m && Test._lock2314359 == Test._lock && this_m2314359 == this_m && m2314359 == m && this2314359 == this && tid2314359 == tid;
 assume $recorded.state2314359 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (bool) {
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
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Mutex.m failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)             
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Mutex.m(u: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.2): Mutex.m failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)             
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Mutex.m[x];                                                                            
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Mutex.m[x] := havocValue;                                                                          
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Mutex.m failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)              
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Mutex.m[x];                                                                            
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Mutex.m(u: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.2): Mutex.m failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)                  
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Mutex.m failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Mutex.m(t: Tid, u: Tid, v: int, w: int, x: Mutex)                   
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Mutex.m[x];                                                                            
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Mutex.m[x] := havocValue;                                                                          
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,x: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Mutex.m failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)          
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (19.5): Test.m failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)           
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Test.m(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (19.5): Test.m failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)           
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.m[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Test.m[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (19.5): Test.m failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)            
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Test.m[x];                                                                             
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Test.m(u: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (19.5): Test.m failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)                
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (19.5): Test.m failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, x: Test)                 
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Test.m[x];                                                                             
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Test.m[x] := havocValue;                                                                           
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Test.m(u: Tid,x: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (19.5): Test.m failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[y] := w;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Mutex.m.Mutex.m(t: Tid, u: Tid, v: int, w: int, w0: int, x: Mutex, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Mutex.m[x];                                                                                
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Mutex.m[x] := tmpV;                                                                                
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Mutex.m(t: Tid,x: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Mutex.m.Test.m(t: Tid, u: Tid, v: int, w: Mutex, w0: Mutex, x: Mutex, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Mutex.m(t: Tid,x: Mutex,v: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[x] := v;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Mutex.m[y] := w;                                                                                   
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Mutex.m(u: Tid,y: Mutex,w: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Mutex.m[y] := w;                                                                                   
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.m.Mutex.m(t: Tid, u: Tid, v: Mutex, w: int, w0: int, x: Test, y: Mutex)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Mutex.m(u: Tid,y: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
                                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Test.m[x];                                                                                 
 Test.m[x] := v;                                                                                    
 assume Mutex._state_mid == Mutex._state && Mutex.m_mid == Mutex.m && Mutex._lock_mid == Mutex._lock && Test._state_mid == Test._state && Test.m_mid == Test.m && Test._lock_mid == Test._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Test.m[x] := tmpV;                                                                                 
 Test.m[y] := w;                                                                                    
 _writeByTPost := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (19.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Test.m(u: Tid,y: Test,w: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[y] := w;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Test.m(t: Tid,x: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (19.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Test.m.Test.m(t: Tid, u: Tid, v: Mutex, w: Mutex, w0: Mutex, x: Test, y: Test)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
 var Mutex.m_post: [Mutex]int;                                                                      
 var w_post: Mutex;                                                                                 
 var Test.m_post: [Test]Mutex;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Test.m(t: Tid,x: Test,v: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Test.m[x] := v;                                                                                    
 assume Mutex._state_post == Mutex._state && Mutex.m_post == Mutex.m && Mutex._lock_post == Mutex._lock && Test._state_post == Test._state && Test.m_post == Test.m && Test._lock_post == Test._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Test.m(u: Tid,y: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (19.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (19.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (19.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);       
requires ValidTid(tid);                                                                             
modifies Mutex._state;                                                                              
modifies Mutex.m;                                                                                   
modifies Mutex._lock;                                                                               
modifies Test._state;                                                                               
modifies Test.m;                                                                                    
modifies Test._lock;                                                                                
ensures StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);        
ensures Y(tid , old(Mutex._state), old(Mutex.m), old(Mutex._lock), old(Test._state), old(Test.m), old(Test._lock) , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
                                                                                                    
// Mutex.m:                                                                                         
                                                                                                    
function {:inline} Y_Mutex.m(tid : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Mutex._state[this], tid) && leq(m#moverPath(ReadEval.Mutex.m(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _R)) ==> (Mutex.m[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Mutex.m(tid : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Subsumes.W(tid : Tid, u : Tid, this: Mutex, newValue: int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
var u_yield: Tid;                                                                                   
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume isAccessible(Mutex._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Mutex.m(u: Tid,this: Mutex,newValue: int,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)));
                                                                                                    
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Reflexive(tid : Tid, this: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex.m(tid, this, Mutex.m[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex.m.Transitive(tid : Tid, this: Mutex, newValue : int , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 assume Y_Mutex.m(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Mutex.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
// Mutex._lock:                                                                                     
                                                                                                    
function {:inline} Y_Mutex._lock(tid : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Mutex._state[this], tid) && leq(m#moverPath(ReadEval.Mutex._lock(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _R)) ==> (Mutex._lock[this] == newValue))
 &&(((Mutex._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Mutex._lock(tid : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Subsumes.W(tid : Tid, u : Tid, this: Mutex, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
var u_yield: Tid;                                                                                   
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume isAccessible(Mutex._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Mutex._lock(u: Tid,this: Mutex,newValue: Tid,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)));
 assume leq(m#moverPath(ReadEval.Mutex._lock(tid: Tid,this: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _N);
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Reflexive(tid : Tid, this: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var this_yield: Mutex;                                                                              
var Mutex._state_yield: [Mutex]State;                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Mutex._lock(tid, this, Mutex._lock[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Mutex._lock.Transitive(tid : Tid, this: Mutex, newValue : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var newValue_post: Tid;                                                                             
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Mutex._state[this], tid);                                                      
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 assume Y_Mutex._lock(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Mutex._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
// Test.m:                                                                                          
                                                                                                    
function {:inline} Y_Test.m(tid : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Test._state[this], tid) && leq(m#moverPath(ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _R)) ==> (Test.m[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Test.m(tid : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Subsumes.W(tid : Tid, u : Tid, this: Test, newValue: Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var u_yield: Tid;                                                                                   
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
var newValue_yield: Mutex;                                                                          
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume isAccessible(Test._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Test.m(u: Tid,this: Test,newValue: Mutex,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)));
                                                                                                    
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Reflexive(tid : Tid, this: Test , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test.m(tid, this, Test.m[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test.m.Transitive(tid : Tid, this: Test, newValue : Mutex , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 assume Y_Test.m(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Test.m(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
// Test._lock:                                                                                      
                                                                                                    
function {:inline} Y_Test._lock(tid : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 ((isAccessible(Test._state[this], tid) && leq(m#moverPath(ReadEval.Test._lock(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _R)) ==> (Test._lock[this] == newValue))
 &&(((Test._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Test._lock(tid : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Subsumes.W(tid : Tid, u : Tid, this: Test, newValue: Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
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
var u_yield: Tid;                                                                                   
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume isAccessible(Test._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Test._lock(u: Tid,this: Test,newValue: Tid,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)));
 assume leq(m#moverPath(ReadEval.Test._lock(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock)), _N);
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Reflexive(tid : Tid, this: Test , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Test._lock_yield: [Test]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Mutex._lock_yield: [Mutex]Tid;                                                                  
var Mutex.m_yield: [Mutex]int;                                                                      
var $pc_yield: Phase;                                                                               
var Test._state_yield: [Test]State;                                                                 
var Mutex._state_yield: [Mutex]State;                                                               
var this_yield: Test;                                                                               
var $recorded.state_yield: int;                                                                     
var Test.m_yield: [Test]Mutex;                                                                      
                                                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
assume Mutex._state_yield == Mutex._state && Mutex.m_yield == Mutex.m && Mutex._lock_yield == Mutex._lock && Test._state_yield == Test._state && Test.m_yield == Test.m && Test._lock_yield == Test._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Test._lock(tid, this, Test._lock[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
procedure Y_Test._lock.Transitive(tid : Tid, this: Test, newValue : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test._lock_p: [Test]Tid)
 requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);      
 requires StateInvariant(Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var newValue_post: Tid;                                                                             
var Mutex.m_post: [Mutex]int;                                                                       
var Test.m_post: [Test]Mutex;                                                                       
                                                                                                    
assume Mutex._state_pre == Mutex._state && Mutex.m_pre == Mutex.m && Mutex._lock_pre == Mutex._lock && Test._state_pre == Test._state && Test.m_pre == Test.m && Test._lock_pre == Test._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Test._state[this], tid);                                                       
 assume Y(tid , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
 assume Y_Test._lock(tid, this, newValue , Mutex._state_p, Mutex.m_p, Mutex._lock_p, Test._state_p, Test.m_p, Test._lock_p);
assume Mutex._state_post == Mutex._state_p && Mutex.m_post == Mutex.m_p && Mutex._lock_post == Mutex._lock_p && Test._state_post == Test._state_p && Test.m_post == Test.m_p && Test._lock_post == Test._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Test._lock(tid, this, newValue , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Mutex._state: [Mutex]State, Mutex.m: [Mutex]int, Mutex._lock: [Mutex]Tid, Test._state: [Test]State, Test.m: [Test]Mutex, Test._lock: [Test]Tid , Mutex._state_p: [Mutex]State, Mutex.m_p: [Mutex]int, Mutex._lock_p: [Mutex]Tid, Test._state_p: [Test]State, Test.m_p: [Test]Mutex, Test._lock_p: [Test]Tid): bool
{                                                                                                   
 (forall this: Mutex :: Y_Mutex.m(tid : Tid, this, Mutex.m_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock))
 && (forall this: Mutex :: Y_Mutex._lock(tid : Tid, this, Mutex._lock_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock))
 && (forall this: Test :: Y_Test.m(tid : Tid, this, Test.m_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock))
 && (forall this: Test :: Y_Test._lock(tid : Tid, this, Test._lock_p[this] , Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock))
 && (forall _i : Mutex :: isShared(Mutex._state[_i]) ==> isShared(Mutex._state_p[_i]))              
 && (forall _i : Mutex :: isLocal(Mutex._state[_i], tid) <==> isLocal(Mutex._state_p[_i], tid))     
 && (forall _i : Test :: isShared(Test._state[_i]) ==> isShared(Test._state_p[_i]))                 
 && (forall _i : Test :: isLocal(Test._state[_i], tid) <==> isLocal(Test._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 635.1-897.2: (Method:21.5)
// 645.1-645.24: (21.5): Bad tid
// 646.1-646.38: (21.5): this is not global
// 786.2-788.2: (class anchor.sink.VarDeclStmt:22.9)
// 789.2-806.20: (class anchor.sink.Read:22.9)
// 801.1-801.28: (22.9): Cannot have potential null deference in left-mover part.
// 805.1-805.27: (22.9): Reduction failure
// 806.20-807.27: (23.9): invariant may not hold
// 810.2-812.2: (class anchor.sink.VarDeclStmt:24.9)
// 813.2-816.16: (class anchor.sink.Assign:24.9)
// 817.2-825.42: (class anchor.sink.Yield:8.9)
// 826.1-826.27: (8.9): Invariant may not hold.
// 829.2-833.14: (class anchor.sink.While:9.9)
// 835.1-835.27: (21.5): Bad tid
// 836.1-836.41: (21.5): this is not global
// 838.97-839.31: (9.9): invariant m == this.m may not hold
// 840.1-840.199: (9.9): Loop does not preserve yields_as annotation for field m
// 841.1-841.196: (9.9): Loop does not preserve yields_as annotation for field m
// 842.1-842.33: (9.9): Phase must be invariant at loop head
// 843.1-843.30: (9.9): Potentially infinite loop cannot be in post-commit phase.
// 845.3-853.43: (class anchor.sink.Yield:10.13)
// 854.1-854.28: (10.13): Invariant may not hold.
// 857.1-857.30: (9.9): Phase must be invariant at loop head
// 859.2-862.23: (class anchor.sink.Break:7.16)
// 864.2-866.2: (class anchor.sink.VarDeclStmt:25.9)
// 867.2-884.25: (class anchor.sink.Read:25.9)
// 879.1-879.28: (25.9): Cannot have potential null deference in left-mover part.
// 883.1-883.27: (25.9): Reduction failure
// 885.2-890.21: (class anchor.sink.Assert:26.9)
// 890.1-890.21: (26.9): This assertion may not hold.
// 891.2-896.9: (class anchor.sink.Return:21.21)
// 980.1-980.34: (5.2): Mutex.m failed Write-Write Right-Mover Check
// 1043.1-1043.30: (5.2): Mutex.m failed Write-Read Right-Mover Check
// 1110.1-1110.34: (5.2): Mutex.m failed Write-Write Left-Mover Check
// 1174.1-1174.30: (5.2): Mutex.m failed Write-Read Left-Mover Check
// 1235.1-1235.34: (5.2): Mutex.m failed Read-Write Right-Mover Check
// 1299.1-1299.34: (5.2): Mutex.m failed Read-Write Left-Mover Check
// 1362.1-1362.34: (19.5): Test.m failed Write-Write Right-Mover Check
// 1425.1-1425.30: (19.5): Test.m failed Write-Read Right-Mover Check
// 1492.1-1492.34: (19.5): Test.m failed Write-Write Left-Mover Check
// 1556.1-1556.30: (19.5): Test.m failed Write-Read Left-Mover Check
// 1617.1-1617.34: (19.5): Test.m failed Read-Write Right-Mover Check
// 1681.1-1681.34: (19.5): Test.m failed Read-Write Left-Mover Check
// 1756.1-1756.140: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 1757.1-1757.101: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 1758.1-1758.158: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 1860.1-1860.140: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
// 1967.1-1967.144: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
// 1968.1-1968.144: (5.2): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2043.1-2043.136: (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2044.1-2044.136: (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2045.1-2045.146: (5.2): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
// 2119.1-2119.136: (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2120.1-2120.136: (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2121.1-2121.99: (5.2): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2197.1-2197.140: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2198.1-2198.101: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2199.1-2199.156: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2301.1-2301.140: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
// 2408.1-2408.144: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
// 2409.1-2409.144: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
// 2484.1-2484.136: (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
// 2485.1-2485.136: (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
// 2486.1-2486.144: (5.2): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
// 2560.1-2560.136: (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2561.1-2561.136: (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2562.1-2562.99: (19.5): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2638.1-2638.140: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
// 2639.1-2639.101: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
// 2640.1-2640.156: (5.2): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
// 2742.1-2742.140: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2849.1-2849.144: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2850.1-2850.144: (19.5): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2925.1-2925.136: (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2926.1-2926.136: (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2927.1-2927.144: (19.5): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
// 3001.1-3001.136: (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
// 3002.1-3002.136: (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
// 3003.1-3003.99: (5.2): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
// 3079.1-3079.140: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3080.1-3080.101: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3081.1-3081.158: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3183.1-3183.140: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case C)
// 3290.1-3290.144: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case D)
// 3291.1-3291.144: (19.5): Test.m is not Write-Write Stable with respect to Test.m (case R)
// 3366.1-3366.136: (19.5): Test.m is not Read-Write Stable with respect to Test.m (case F)
// 3367.1-3367.136: (19.5): Test.m is not Read-Write Stable with respect to Test.m (case H)
// 3368.1-3368.146: (19.5): Test.m is not Read-Write Stable with respect to Test.m (case I)
// 3442.1-3442.136: (19.5): Test.m is not Write-Read Stable with respect to Test.m (case J)
// 3443.1-3443.136: (19.5): Test.m is not Write-Read Stable with respect to Test.m (case K)
// 3444.1-3444.99: (19.5): Test.m is not Write-Read Stable with respect to Test.m (case L)
// 3478.1-3500.2: (5.2): yields_as clause for Mutex.m is not valid
// 3505.1-3522.2: (5.2): yields_as clause for Mutex.m is not reflexive
// 3528.1-3562.2: (5.2): yields_as clause for Mutex.m is not transitive
// 3582.1-3604.2: (7.32): yields_as clause for Mutex._lock is not valid
// 3609.1-3626.2: (7.32): yields_as clause for Mutex._lock is not reflexive
// 3632.1-3666.2: (7.32): yields_as clause for Mutex._lock is not transitive
// 3685.1-3707.2: (19.5): yields_as clause for Test.m is not valid
// 3712.1-3729.2: (19.5): yields_as clause for Test.m is not reflexive
// 3735.1-3769.2: (19.5): yields_as clause for Test.m is not transitive
// 3789.1-3811.2: (7.32): yields_as clause for Test._lock is not valid
// 3816.1-3833.2: (7.32): yields_as clause for Test._lock is not reflexive
// 3839.1-3873.2: (7.32): yields_as clause for Test._lock is not transitive
