                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/bug4.sink:                               
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Mutex {                                                                                   
       int m isRead ? N : N                                                                         
                                                                                                    
    }                                                                                               
    class Test {                                                                                    
       Mutex m isRead ? B : E                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public Mutex f() {                                                                            
        Mutex m;                                                                                    
        m := this.m;                                                                                
        int i;                                                                                      
        i = 0;                                                                                      
        boolean z;                                                                                  
        z = i < 10;                                                                                 
        while (z)   {                                                                               
          invariant this.m == m;                                                                    
          yield;                                                                                    
          i = i + 1;                                                                                
          z = i < 10;                                                                               
        }                                                                                           
        z = i < 20;                                                                                 
        while (z)   {                                                                               
          yield;                                                                                    
          i = i + 1;                                                                                
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
         return m;                                                                                  
        // return Mutex.null;                                                                       
      }                                                                                             
                                                                                                    
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
      public Mutex f() {                                                                            
        Mutex m;                                                                                    
        m := this.m;                                                                                
        int i;                                                                                      
        i = 0;                                                                                      
        boolean z;                                                                                  
        z = i < 10;                                                                                 
        while (z)   {                                                                               
          invariant this.m == m;                                                                    
          yield;                                                                                    
          i = i + 1;                                                                                
          z = i < 10;                                                                               
        }                                                                                           
        z = i < 20;                                                                                 
        while (z)   {                                                                               
          yield;                                                                                    
          i = i + 1;                                                                                
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        {                                                                                           
           return m;                                                                                
        }                                                                                           
        {                                                                                           
          // return Mutex.null;                                                                     
        }                                                                                           
      }                                                                                             
                                                                                                    
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
      public Mutex f() {                                                                            
        Mutex m;                                                                                    
        m := this.m;                                                                                
        int i;                                                                                      
        i = 0;                                                                                      
        boolean z;                                                                                  
        z = i < 10;                                                                                 
        while (z)   {                                                                               
          invariant this.m == m;                                                                    
          yield;                                                                                    
          i = i + 1;                                                                                
          z = i < 10;                                                                               
        }                                                                                           
        z = i < 20;                                                                                 
        while (z)   {                                                                               
          yield;                                                                                    
          i = i + 1;                                                                                
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        {                                                                                           
           return m;                                                                                
        }                                                                                           
        {                                                                                           
          // return Mutex.null;                                                                     
        }                                                                                           
      }                                                                                             
                                                                                                    
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
      public Mutex f() {                                                                            
        Mutex m;                                                                                    
        m := this.m;                                                                                
        int i;                                                                                      
        i = 0;                                                                                      
        boolean z;                                                                                  
        z = i < 10;                                                                                 
        while (z)   {                                                                               
          invariant this.m == m;                                                                    
          yield;                                                                                    
          i = i + 1;                                                                                
          z = i < 10;                                                                               
        }                                                                                           
        z = i < 20;                                                                                 
        while (z)   {                                                                               
          yield;                                                                                    
          i = i + 1;                                                                                
        }                                                                                           
        Mutex this_m;                                                                               
        this_m := this.m;                                                                           
        assert this_m == m;                                                                         
        {                                                                                           
           return m;                                                                                
        }                                                                                           
        {                                                                                           
          // return Mutex.null;                                                                     
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
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Mutex.m(tid: Tid,this : Mutex,newValue: int,Mutex._state: [Mutex]State,Mutex.m: [Mutex]int,Mutex._lock: [Mutex]Tid,Test._state: [Test]State,Test.m: [Test]Mutex,Test._lock: [Test]Tid) returns (MoverPath) {
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
returns ($result : Mutex)                                                                           
modifies Mutex._state;                                                                              
modifies Mutex.m;                                                                                   
modifies Mutex._lock;                                                                               
modifies Test._state;                                                                               
modifies Test.m;                                                                                    
modifies Test._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.3): Bad tid
requires isShared(Test._state[this]);                                                                      // (8.3): this is not global
                                                                                                    
requires StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);       
                                                                                                    
ensures StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);        
{                                                                                                   
 var Test.m473275: [Test]Mutex;                                                                     
 var z473282: bool;                                                                                 
 var $pc473252: Phase;                                                                              
 var Mutex.m473287: [Mutex]int;                                                                     
 var this_m: Mutex;                                                                                 
 var Test._state473236_post: [Test]State;                                                           
 var Test.m473282: [Test]Mutex;                                                                     
 var Test._state473269_bottom: [Test]State;                                                         
 var $recorded.state473252: int;                                                                    
 var Mutex._lock473280: [Mutex]Tid;                                                                 
 var i473252_bottom: int;                                                                           
 var tid473236: Tid;                                                                                
 var Mutex._state473252_bottom: [Mutex]State;                                                       
 var Test._lock473236: [Test]Tid;                                                                   
 var tid473212: Tid;                                                                                
 var i473269_bottom: int;                                                                           
 var tid473287: Tid;                                                                                
 var $recorded.state473282: int;                                                                    
 var m: Mutex;                                                                                      
 var $recorded.state473280: int;                                                                    
 var Mutex.m473282: [Mutex]int;                                                                     
 var m473252_bottom: Mutex;                                                                         
 var z473236_post: bool;                                                                            
 var Test.m473236: [Test]Mutex;                                                                     
 var Mutex._lock473252_bottom: [Mutex]Tid;                                                          
 var Test._state473252_bottom: [Test]State;                                                         
 var $recorded.state473260_post: int;                                                               
 var this473282: Test;                                                                              
 var Test._state473269: [Test]State;                                                                
 var $result473252_bottom: Mutex;                                                                   
 var Mutex._lock473275: [Mutex]Tid;                                                                 
 var tid473236_post: Tid;                                                                           
 var this473269_bottom: Test;                                                                       
 var $pc473212: Phase;                                                                              
 var moverPath473275: MoverPath;                                                                    
 var Test._lock473260_post: [Test]Tid;                                                              
 var $pc473280: Phase;                                                                              
 var Mutex._state473282: [Mutex]State;                                                              
 var Test._lock473252: [Test]Tid;                                                                   
 var Mutex._state473252: [Mutex]State;                                                              
 var $pc473275: Phase;                                                                              
 var Mutex._lock473260: [Mutex]Tid;                                                                 
 var m473275: Mutex;                                                                                
 var $recorded.state473212: int;                                                                    
 var this473236_post: Test;                                                                         
 var Mutex._state473236_post: [Mutex]State;                                                         
 var Mutex.m473269: [Mutex]int;                                                                     
 var Test._state473280: [Test]State;                                                                
 var $pc473282: Phase;                                                                              
 var this_m473275: Mutex;                                                                           
 var Test._state473287: [Test]State;                                                                
 var Mutex._lock473269: [Mutex]Tid;                                                                 
 var Test._lock473236_post: [Test]Tid;                                                              
 var tid473282: Tid;                                                                                
 var Test._lock473275: [Test]Tid;                                                                   
 var this_m473287: Mutex;                                                                           
 var m473287: Mutex;                                                                                
 var z473236: bool;                                                                                 
 var this473260_post: Test;                                                                         
 var m473236: Mutex;                                                                                
 var this473275: Test;                                                                              
 var $recorded.state473236: int;                                                                    
 var Mutex.m473252: [Mutex]int;                                                                     
 var $result473260: Mutex;                                                                          
 var $result473236_post: Mutex;                                                                     
 var Test._lock473260: [Test]Tid;                                                                   
 var i473280: int;                                                                                  
 var $result473269_bottom: Mutex;                                                                   
 var this473260: Test;                                                                              
 var i473287: int;                                                                                  
 var Mutex._lock473236: [Mutex]Tid;                                                                 
 var $result473287: Mutex;                                                                          
 var $result473282: Mutex;                                                                          
 var i: int;                                                                                        
 var $recorded.state473287: int;                                                                    
 var tid473252: Tid;                                                                                
 var Mutex.m473275: [Mutex]int;                                                                     
 var Mutex._lock473282: [Mutex]Tid;                                                                 
 var this473212: Test;                                                                              
 var $result473236: Mutex;                                                                          
 var phase473269: Phase;                                                                            
 var $recorded.state473236_post: int;                                                               
 var Mutex._state473269: [Mutex]State;                                                              
 var this473252_bottom: Test;                                                                       
 var i473269: int;                                                                                  
 var z473269_bottom: bool;                                                                          
 var m473260_post: Mutex;                                                                           
 var this_m473280: Mutex;                                                                           
 var Mutex.m473280: [Mutex]int;                                                                     
 var Test.m473269: [Test]Mutex;                                                                     
 var tid473260: Tid;                                                                                
 var Test._state473260: [Test]State;                                                                
 var m473252: Mutex;                                                                                
 var Test._state473252: [Test]State;                                                                
 var $pc473260_post: Phase;                                                                         
 var i473260: int;                                                                                  
 var $pc473252_bottom: Phase;                                                                       
 var this473252: Test;                                                                              
 var $recorded.state473260: int;                                                                    
 var Mutex.m473252_bottom: [Mutex]int;                                                              
 var Mutex._state473287: [Mutex]State;                                                              
 var Test.m473260: [Test]Mutex;                                                                     
 var $result473275: Mutex;                                                                          
 var Mutex.m473236: [Mutex]int;                                                                     
 var $result473212: Mutex;                                                                          
 var tid473280: Tid;                                                                                
 var moverPath473212: MoverPath;                                                                    
 var z473275: bool;                                                                                 
 var z473260: bool;                                                                                 
 var m473280: Mutex;                                                                                
 var $pc473269_bottom: Phase;                                                                       
 var Test._lock473287: [Test]Tid;                                                                   
 var Test.m473252_bottom: [Test]Mutex;                                                              
 var Mutex._state473280: [Mutex]State;                                                              
 var mover473212: Mover;                                                                            
 var z473260_post: bool;                                                                            
 var Test._lock473252_bottom: [Test]Tid;                                                            
 var z473252_bottom: bool;                                                                          
 var m473269: Mutex;                                                                                
 var $result473280: Mutex;                                                                          
 var path473275: int;                                                                               
 var z473280: bool;                                                                                 
 var Test._state473275: [Test]State;                                                                
 var $result473269: Mutex;                                                                          
 var Mutex._state473236: [Mutex]State;                                                              
 var Mutex._state473275: [Mutex]State;                                                              
 var Mutex.m473260: [Mutex]int;                                                                     
 var Test._state473212: [Test]State;                                                                
 var Mutex._state473269_bottom: [Mutex]State;                                                       
 var Mutex._lock473252: [Mutex]Tid;                                                                 
 var Mutex._lock473287: [Mutex]Tid;                                                                 
 var Mutex.m473236_post: [Mutex]int;                                                                
 var $recorded.state473269_bottom: int;                                                             
 var path473212: int;                                                                               
 var Test._state473282: [Test]State;                                                                
 var Test._lock473282: [Test]Tid;                                                                   
 var i473275: int;                                                                                  
 var $pc473269: Phase;                                                                              
 var Test.m473269_bottom: [Test]Mutex;                                                              
 var Mutex._lock473269_bottom: [Mutex]Tid;                                                          
 var i473282: int;                                                                                  
 var mover473275: Mover;                                                                            
 var Test.m473280: [Test]Mutex;                                                                     
 var Test.m473287: [Test]Mutex;                                                                     
 var this473280: Test;                                                                              
 var $pc473260: Phase;                                                                              
 var Test._lock473280: [Test]Tid;                                                                   
 var this_m473282: Mutex;                                                                           
 var $recorded.state473252_bottom: int;                                                             
 var Mutex.m473212: [Mutex]int;                                                                     
 var m473269_bottom: Mutex;                                                                         
 var z473269: bool;                                                                                 
 var tid473269: Tid;                                                                                
 var tid473252_bottom: Tid;                                                                         
 var $result473260_post: Mutex;                                                                     
 var Test.m473236_post: [Test]Mutex;                                                                
 var i473236: int;                                                                                  
 var Test._state473236: [Test]State;                                                                
 var i473236_post: int;                                                                             
 var Test._state473260_post: [Test]State;                                                           
 var Mutex.m473260_post: [Mutex]int;                                                                
 var Mutex._state473260: [Mutex]State;                                                              
 var Mutex._state473260_post: [Mutex]State;                                                         
 var Test.m473252: [Test]Mutex;                                                                     
 var z473252: bool;                                                                                 
 var Test.m473260_post: [Test]Mutex;                                                                
 var tid473260_post: Tid;                                                                           
 var Mutex.m473269_bottom: [Mutex]int;                                                              
 var Mutex._state473212: [Mutex]State;                                                              
 var tid473275: Tid;                                                                                
 var this473236: Test;                                                                              
 var $pc473236: Phase;                                                                              
 var $pc473236_post: Phase;                                                                         
 var z: bool;                                                                                       
 var this473287: Test;                                                                              
 var Mutex._lock473260_post: [Mutex]Tid;                                                            
 var Test._lock473269: [Test]Tid;                                                                   
 var $pc473287: Phase;                                                                              
 var i473252: int;                                                                                  
 var $result473252: Mutex;                                                                          
 var Mutex._lock473212: [Mutex]Tid;                                                                 
 var m473212: Mutex;                                                                                
 var m473282: Mutex;                                                                                
 var Test.m473212: [Test]Mutex;                                                                     
 var m473236_post: Mutex;                                                                           
 var tid473269_bottom: Tid;                                                                         
 var Test._lock473212: [Test]Tid;                                                                   
 var Mutex._lock473236_post: [Mutex]Tid;                                                            
 var z473287: bool;                                                                                 
 var Test._lock473269_bottom: [Test]Tid;                                                            
 var m473260: Mutex;                                                                                
 var i473260_post: int;                                                                             
 var $recorded.state473275: int;                                                                    
 var this473269: Test;                                                                              
 var $recorded.state473269: int;                                                                    
 var phase473252: Phase;                                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.5: Mutex m;                                                                                   
                                                                                                    
                                                                                                    
 // 9.5: m := this.m;                                                                               
                                                                                                    
                                                                                                    
 moverPath473212 := ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 mover473212 := m#moverPath(moverPath473212);                                                       
 path473212 := p#moverPath(moverPath473212);                                                        
 assume Mutex._state473212 == Mutex._state && Mutex.m473212 == Mutex.m && Mutex._lock473212 == Mutex._lock && Test._state473212 == Test._state && Test.m473212 == Test.m && Test._lock473212 == Test._lock && m473212 == m && $result473212 == $result && this473212 == this && tid473212 == tid && $pc473212 == $pc;
 assume $recorded.state473212 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Test.null;                                                                         
 } else {                                                                                           
  assert this != Test.null;                                                                                // (9.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover473212);                                                               
 assert $pc != PhaseError;                                                                                 // (9.5): Reduction failure
 m := Test.m[this];                                                                                 
                                                                                                    
 // 10.5: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 10.13: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
                                                                                                    
 // 11.5: boolean z;                                                                                
                                                                                                    
                                                                                                    
 // 11.19: z = i < 10;                                                                              
                                                                                                    
 z := (i<10);                                                                                       
 assume Mutex._state473252 == Mutex._state && Mutex.m473252 == Mutex.m && Mutex._lock473252 == Mutex._lock && Test._state473252 == Test._state && Test.m473252 == Test.m && Test._lock473252 == Test._lock && z473252 == z && i473252 == i && m473252 == m && $result473252 == $result && this473252 == this && tid473252 == tid;
 assume $recorded.state473252 == 1;                                                                 
                                                                                                    
 // 11.25: while (z)   {                                                                            
                                                                                                    
 phase473252 := $pc;                                                                                
 while (z)                                                                                          
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (8.3): Bad tid
  invariant isShared(Test._state[this]);                                                                   // (8.3): this is not global
                                                                                                    
  invariant StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);    
  invariant (forall _this : Mutex :: Invariant.Y_Mutex.m(tid : Tid, _this, Mutex.m[_this] ,Mutex._state473252,Mutex.m473252,Mutex._lock473252,Test._state473252,Test.m473252,Test._lock473252));       // (11.25): Loop does not preserve yields_as annotation for field m
  invariant (forall _this : Test :: Invariant.Y_Test.m(tid : Tid, _this, Test.m[_this] ,Mutex._state473252,Mutex.m473252,Mutex._lock473252,Test._state473252,Test.m473252,Test._lock473252));       // (11.25): Loop does not preserve yields_as annotation for field m
  invariant phase473252 == $pc;                                                                            // (11.25): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (11.25): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  assert (Test.m[this]==m);                                                                         
                                                                                                    
  // 14.6: yield;                                                                                   
                                                                                                    
  assume Mutex._state473236 == Mutex._state && Mutex.m473236 == Mutex.m && Mutex._lock473236 == Mutex._lock && Test._state473236 == Test._state && Test.m473236 == Test.m && Test._lock473236 == Test._lock && z473236 == z && i473236 == i && m473236 == m && $result473236 == $result && this473236 == this && tid473236 == tid;
  assume $recorded.state473236 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Mutex._state473236_post == Mutex._state && Mutex.m473236_post == Mutex.m && Mutex._lock473236_post == Mutex._lock && Test._state473236_post == Test._state && Test.m473236_post == Test.m && Test._lock473236_post == Test._lock && z473236_post == z && i473236_post == i && m473236_post == m && $result473236_post == $result && this473236_post == this && tid473236_post == tid;
  assume $recorded.state473236_post == 1;                                                           
  assert (Test.m[this]==m);                                                                                // (14.6): Invariant may not hold.
                                                                                                    
  // 15.12: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
                                                                                                    
  // 15.23: z = i < 10;                                                                             
                                                                                                    
  z := (i<10);                                                                                      
  assume Mutex._state473252_bottom == Mutex._state && Mutex.m473252_bottom == Mutex.m && Mutex._lock473252_bottom == Mutex._lock && Test._state473252_bottom == Test._state && Test.m473252_bottom == Test.m && Test._lock473252_bottom == Test._lock && z473252_bottom == z && i473252_bottom == i && m473252_bottom == m && $result473252_bottom == $result && this473252_bottom == this && tid473252_bottom == tid;
  assume $recorded.state473252_bottom == 1;                                                         
  assert phase473252 == $pc;                                                                               // (11.25): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 17.11: z = i < 20;                                                                              
                                                                                                    
 z := (i<20);                                                                                       
 assume Mutex._state473269 == Mutex._state && Mutex.m473269 == Mutex.m && Mutex._lock473269 == Mutex._lock && Test._state473269 == Test._state && Test.m473269 == Test.m && Test._lock473269 == Test._lock && z473269 == z && i473269 == i && m473269 == m && $result473269 == $result && this473269 == this && tid473269 == tid;
 assume $recorded.state473269 == 1;                                                                 
                                                                                                    
 // 17.17: while (z)   {                                                                            
                                                                                                    
 phase473269 := $pc;                                                                                
 while (z)                                                                                          
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (8.3): Bad tid
  invariant isShared(Test._state[this]);                                                                   // (8.3): this is not global
                                                                                                    
  invariant StateInvariant(Mutex._state, Mutex.m, Mutex._lock, Test._state, Test.m, Test._lock);    
  invariant (forall _this : Mutex :: Invariant.Y_Mutex.m(tid : Tid, _this, Mutex.m[_this] ,Mutex._state473269,Mutex.m473269,Mutex._lock473269,Test._state473269,Test.m473269,Test._lock473269));       // (17.17): Loop does not preserve yields_as annotation for field m
  invariant (forall _this : Test :: Invariant.Y_Test.m(tid : Tid, _this, Test.m[_this] ,Mutex._state473269,Mutex.m473269,Mutex._lock473269,Test._state473269,Test.m473269,Test._lock473269));       // (17.17): Loop does not preserve yields_as annotation for field m
  invariant phase473269 == $pc;                                                                            // (17.17): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (17.17): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 19.7: yield;                                                                                   
                                                                                                    
  assume Mutex._state473260 == Mutex._state && Mutex.m473260 == Mutex.m && Mutex._lock473260 == Mutex._lock && Test._state473260 == Test._state && Test.m473260 == Test.m && Test._lock473260 == Test._lock && z473260 == z && i473260 == i && m473260 == m && $result473260 == $result && this473260 == this && tid473260 == tid;
  assume $recorded.state473260 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Mutex._state473260_post == Mutex._state && Mutex.m473260_post == Mutex.m && Mutex._lock473260_post == Mutex._lock && Test._state473260_post == Test._state && Test.m473260_post == Test.m && Test._lock473260_post == Test._lock && z473260_post == z && i473260_post == i && m473260_post == m && $result473260_post == $result && this473260_post == this && tid473260_post == tid;
  assume $recorded.state473260_post == 1;                                                           
                                                                                                    
  // 20.13: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Mutex._state473269_bottom == Mutex._state && Mutex.m473269_bottom == Mutex.m && Mutex._lock473269_bottom == Mutex._lock && Test._state473269_bottom == Test._state && Test.m473269_bottom == Test.m && Test._lock473269_bottom == Test._lock && z473269_bottom == z && i473269_bottom == i && m473269_bottom == m && $result473269_bottom == $result && this473269_bottom == this && tid473269_bottom == tid;
  assume $recorded.state473269_bottom == 1;                                                         
  assert phase473269 == $pc;                                                                               // (17.17): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 23.5: Mutex this_m;                                                                             
                                                                                                    
                                                                                                    
 // 23.5: this_m := this.m;                                                                         
                                                                                                    
                                                                                                    
 moverPath473275 := ReadEval.Test.m(tid: Tid,this: Test,Mutex._state,Mutex.m,Mutex._lock,Test._state,Test.m,Test._lock);
 mover473275 := m#moverPath(moverPath473275);                                                       
 path473275 := p#moverPath(moverPath473275);                                                        
 assume Mutex._state473275 == Mutex._state && Mutex.m473275 == Mutex.m && Mutex._lock473275 == Mutex._lock && Test._state473275 == Test._state && Test.m473275 == Test.m && Test._lock473275 == Test._lock && this_m473275 == this_m && z473275 == z && i473275 == i && m473275 == m && $result473275 == $result && this473275 == this && tid473275 == tid && $pc473275 == $pc;
 assume $recorded.state473275 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Test.null;                                                                         
 } else {                                                                                           
  assert this != Test.null;                                                                                // (23.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover473275);                                                               
 assert $pc != PhaseError;                                                                                 // (23.5): Reduction failure
 this_m := Test.m[this];                                                                            
                                                                                                    
 // 24.5: assert this_m == m;                                                                       
                                                                                                    
 assume Mutex._state473280 == Mutex._state && Mutex.m473280 == Mutex.m && Mutex._lock473280 == Mutex._lock && Test._state473280 == Test._state && Test.m473280 == Test.m && Test._lock473280 == Test._lock && this_m473280 == this_m && z473280 == z && i473280 == i && m473280 == m && $result473280 == $result && this473280 == this && tid473280 == tid;
 assume $recorded.state473280 == 1;                                                                 
 assert (this_m==m);                                                                                       // (24.5): This assertion may not hold.
                                                                                                    
 // 25.5:  return m;                                                                                
                                                                                                    
 assume Mutex._state473282 == Mutex._state && Mutex.m473282 == Mutex.m && Mutex._lock473282 == Mutex._lock && Test._state473282 == Test._state && Test.m473282 == Test.m && Test._lock473282 == Test._lock && this_m473282 == this_m && z473282 == z && i473282 == i && m473282 == m && $result473282 == $result && this473282 == this && tid473282 == tid;
 assume $recorded.state473282 == 1;                                                                 
 if (isLocal(Mutex._state[m], tid)) {                                                               
  Mutex._state[m] := SHARED();                                                                      
 }                                                                                                  
                                                                                                    
 $result := m;                                                                                      
 return;                                                                                            
                                                                                                    
 // 8.20: // return Mutex.null;                                                                     
                                                                                                    
 assume Mutex._state473287 == Mutex._state && Mutex.m473287 == Mutex.m && Mutex._lock473287 == Mutex._lock && Test._state473287 == Test._state && Test.m473287 == Test.m && Test._lock473287 == Test._lock && this_m473287 == this_m && z473287 == z && i473287 == i && m473287 == m && $result473287 == $result && this473287 == this && tid473287 == tid;
 assume $recorded.state473287 == 1;                                                                 
 $result := Mutex.null;                                                                             
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
 assert isError(_writeByU_Mover);                                                                          // (2.3): Mutex.m failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (2.3): Mutex.m failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (2.3): Mutex.m failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.3): Mutex.m failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.3): Mutex.m failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.3): Mutex.m failed Read-Write Left-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (6.3): Test.m failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (6.3): Test.m failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (6.3): Test.m failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.3): Test.m failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.3): Test.m failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.3): Test.m failed Read-Write Left-Mover Check
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.3): Test.m is not Write-Write Stable with respect to Test.m (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Test.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Test.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.3): Test.m is not Read-Write Stable with respect to Test.m (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.3): Test.m is not Write-Read Stable with respect to Test.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.3): Test.m is not Write-Read Stable with respect to Test.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.3): Test.m is not Write-Read Stable with respect to Test.m (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
// 613.1-990.2: (Method:8.3)
// 624.1-624.24: (8.3): Bad tid
// 625.1-625.38: (8.3): this is not global
// 832.2-834.2: (class anchor.sink.VarDeclStmt:9.5)
// 835.2-852.20: (class anchor.sink.Read:9.5)
// 847.1-847.28: (9.5): Cannot have potential null deference in left-mover part.
// 851.1-851.27: (9.5): Reduction failure
// 853.2-855.2: (class anchor.sink.VarDeclStmt:10.5)
// 856.2-859.9: (class anchor.sink.Assign:10.13)
// 860.2-862.2: (class anchor.sink.VarDeclStmt:11.5)
// 863.2-866.14: (class anchor.sink.Assign:11.19)
// 869.2-873.11: (class anchor.sink.While:11.25)
// 875.1-875.27: (8.3): Bad tid
// 876.1-876.41: (8.3): this is not global
// 879.1-879.193: (11.25): Loop does not preserve yields_as annotation for field m
// 880.1-880.190: (11.25): Loop does not preserve yields_as annotation for field m
// 881.1-881.32: (11.25): Phase must be invariant at loop head
// 882.1-882.30: (11.25): Potentially infinite loop cannot be in post-commit phase.
// 883.3-884.28: (13.6): invariant may not hold
// 885.3-893.42: (class anchor.sink.Yield:14.6)
// 894.1-894.28: (14.6): Invariant may not hold.
// 895.3-898.14: (class anchor.sink.Assign:15.12)
// 899.3-902.15: (class anchor.sink.Assign:15.23)
// 905.1-905.29: (11.25): Phase must be invariant at loop head
// 907.2-910.14: (class anchor.sink.Assign:17.11)
// 913.2-917.11: (class anchor.sink.While:17.17)
// 919.1-919.27: (8.3): Bad tid
// 920.1-920.41: (8.3): this is not global
// 923.1-923.193: (17.17): Loop does not preserve yields_as annotation for field m
// 924.1-924.190: (17.17): Loop does not preserve yields_as annotation for field m
// 925.1-925.32: (17.17): Phase must be invariant at loop head
// 926.1-926.30: (17.17): Potentially infinite loop cannot be in post-commit phase.
// 928.3-936.42: (class anchor.sink.Yield:19.7)
// 937.3-940.14: (class anchor.sink.Assign:20.13)
// 943.1-943.29: (17.17): Phase must be invariant at loop head
// 945.2-947.2: (class anchor.sink.VarDeclStmt:23.5)
// 948.2-965.25: (class anchor.sink.Read:23.5)
// 960.1-960.28: (23.5): Cannot have potential null deference in left-mover part.
// 964.1-964.27: (23.5): Reduction failure
// 966.2-971.21: (class anchor.sink.Assert:24.5)
// 971.1-971.21: (24.5): This assertion may not hold.
// 972.2-982.9: (class anchor.sink.Return:25.5)
// 983.2-989.9: (class anchor.sink.Return:8.20)
// 1073.1-1073.34: (2.3): Mutex.m failed Write-Write Right-Mover Check
// 1136.1-1136.30: (2.3): Mutex.m failed Write-Read Right-Mover Check
// 1203.1-1203.34: (2.3): Mutex.m failed Write-Write Left-Mover Check
// 1267.1-1267.30: (2.3): Mutex.m failed Write-Read Left-Mover Check
// 1328.1-1328.34: (2.3): Mutex.m failed Read-Write Right-Mover Check
// 1392.1-1392.34: (2.3): Mutex.m failed Read-Write Left-Mover Check
// 1455.1-1455.34: (6.3): Test.m failed Write-Write Right-Mover Check
// 1518.1-1518.30: (6.3): Test.m failed Write-Read Right-Mover Check
// 1585.1-1585.34: (6.3): Test.m failed Write-Write Left-Mover Check
// 1649.1-1649.30: (6.3): Test.m failed Write-Read Left-Mover Check
// 1710.1-1710.34: (6.3): Test.m failed Read-Write Right-Mover Check
// 1774.1-1774.34: (6.3): Test.m failed Read-Write Left-Mover Check
// 1849.1-1849.140: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 1850.1-1850.101: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 1851.1-1851.158: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 1953.1-1953.140: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2060.1-2060.144: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2061.1-2061.144: (2.3): Mutex.m is not Write-Write Stable with respect to Mutex.m (case R)
// 2136.1-2136.136: (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case F)
// 2137.1-2137.136: (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case H)
// 2138.1-2138.146: (2.3): Mutex.m is not Read-Write Stable with respect to Mutex.m (case I)
// 2212.1-2212.136: (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2213.1-2213.136: (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2214.1-2214.99: (2.3): Mutex.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2290.1-2290.140: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.1)
// 2291.1-2291.101: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.2)
// 2292.1-2292.156: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case A.3)
// 2394.1-2394.140: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case C)
// 2501.1-2501.144: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case D)
// 2502.1-2502.144: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case R)
// 2577.1-2577.136: (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case F)
// 2578.1-2578.136: (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case H)
// 2579.1-2579.144: (2.3): Mutex.m is not Read-Write Stable with respect to Test.m (case I)
// 2653.1-2653.136: (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case J)
// 2654.1-2654.136: (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case K)
// 2655.1-2655.99: (6.3): Test.m is not Write-Read Stable with respect to Mutex.m (case L)
// 2731.1-2731.140: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.1)
// 2732.1-2732.101: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.2)
// 2733.1-2733.156: (2.3): Mutex.m is not Write-Write Stable with respect to Test.m (case A.3)
// 2835.1-2835.140: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case C)
// 2942.1-2942.144: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case D)
// 2943.1-2943.144: (6.3): Test.m is not Write-Write Stable with respect to Mutex.m (case R)
// 3018.1-3018.136: (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case F)
// 3019.1-3019.136: (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case H)
// 3020.1-3020.144: (6.3): Test.m is not Read-Write Stable with respect to Mutex.m (case I)
// 3094.1-3094.136: (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case J)
// 3095.1-3095.136: (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case K)
// 3096.1-3096.99: (2.3): Mutex.m is not Write-Read Stable with respect to Test.m (case L)
// 3172.1-3172.140: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.1)
// 3173.1-3173.101: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.2)
// 3174.1-3174.158: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case A.3)
// 3276.1-3276.140: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case C)
// 3383.1-3383.144: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case D)
// 3384.1-3384.144: (6.3): Test.m is not Write-Write Stable with respect to Test.m (case R)
// 3459.1-3459.136: (6.3): Test.m is not Read-Write Stable with respect to Test.m (case F)
// 3460.1-3460.136: (6.3): Test.m is not Read-Write Stable with respect to Test.m (case H)
// 3461.1-3461.146: (6.3): Test.m is not Read-Write Stable with respect to Test.m (case I)
// 3535.1-3535.136: (6.3): Test.m is not Write-Read Stable with respect to Test.m (case J)
// 3536.1-3536.136: (6.3): Test.m is not Write-Read Stable with respect to Test.m (case K)
// 3537.1-3537.99: (6.3): Test.m is not Write-Read Stable with respect to Test.m (case L)
// 3571.1-3593.2: (2.3): yields_as clause for Mutex.m is not valid
// 3598.1-3615.2: (2.3): yields_as clause for Mutex.m is not reflexive
// 3621.1-3655.2: (2.3): yields_as clause for Mutex.m is not transitive
// 3675.1-3697.2: (7.32): yields_as clause for Mutex._lock is not valid
// 3702.1-3719.2: (7.32): yields_as clause for Mutex._lock is not reflexive
// 3725.1-3759.2: (7.32): yields_as clause for Mutex._lock is not transitive
// 3778.1-3800.2: (6.3): yields_as clause for Test.m is not valid
// 3805.1-3822.2: (6.3): yields_as clause for Test.m is not reflexive
// 3828.1-3862.2: (6.3): yields_as clause for Test.m is not transitive
// 3882.1-3904.2: (7.32): yields_as clause for Test._lock is not valid
// 3909.1-3926.2: (7.32): yields_as clause for Test._lock is not reflexive
// 3932.1-3966.2: (7.32): yields_as clause for Test._lock is not transitive
