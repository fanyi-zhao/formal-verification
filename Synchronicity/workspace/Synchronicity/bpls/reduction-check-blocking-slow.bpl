                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reduction-check-blocking-slow.sink:     
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow lock isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this.lock, tid) ? B : E                                                              
                                                                                                    
      invariant  this.lock != Cow.null;                                                             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(Cow c) {                                                                        
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        synchronized (lock) {                                                                       
          t := this.c1;                                                                             
        }                                                                                           
        t := c.c1;                                                                                  
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        synchronized (lock) {                                                                       
          t := this.c1;                                                                             
        }                                                                                           
        yield;                                                                                      
        t := c.c1;                                                                                  
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        synchronized (lock) {                                                                       
          t := this.c1;                                                                             
        }                                                                                           
        while (true)   {                                                                            
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow lock isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this.lock, tid) ? B : E                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.lock != Cow.null;                                                             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(Cow c) {                                                                        
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        yield;                                                                                      
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        while (true)   {                                                                            
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow lock isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this.lock, tid) ? B : E                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.lock != Cow.null;                                                             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(Cow c) {                                                                        
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        yield;                                                                                      
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        while (true)   {                                                                            
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow lock isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this.lock, tid) ? B : E                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.lock != Cow.null;                                                             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(Cow c) {                                                                        
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        yield;                                                                                      
        t := c.c1;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
        }                                                                                           
        while (true)   {                                                                            
                                                                                                    
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
                                                                                                    
                                                                                                    
/*** Class Decl Cow ***/                                                                            
                                                                                                    
type Cow;                                                                                           
const unique Cow.null: Cow;                                                                         
var Cow._state: [Cow]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.lock: [Cow]Cow;                                                                             
                                                                                                    
function {:inline} ReadEval.Cow.lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.lock(tid: Tid,this : Cow,newValue: Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.c1: [Cow]int;                                                                               
                                                                                                    
function {:inline} ReadEval.Cow.c1(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[Cow.lock[this]], tid) && Cow._lock[Cow.lock[this]] == tid)) then     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.c1(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[Cow.lock[this]], tid) && Cow._lock[Cow.lock[this]] == tid)) then     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Cow._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Cow._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Cow._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Cow._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Cow._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Cow._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Cow.3589261(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
 (Cow.lock[this]!=Cow.null)                                                                         
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow, c : Cow)                                                      
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isSharedAssignable(Cow._state[c]);                                                                // (7.5): Parameter VarDecl(ClassType(Cow),c) is not global
requires isShared(Cow._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                   
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.5): Object invariant may not hold.
{                                                                                                   
 var Cow._state3589478: [Cow]State;                                                                 
 var mover3589478: Mover;                                                                           
 var lock3589479: Cow;                                                                              
 var this3589466: Cow;                                                                              
 var Cow.c13589478: [Cow]int;                                                                       
 var Cow.lock3589479: [Cow]Cow;                                                                     
 var c3589471: Cow;                                                                                 
 var $recorded.state3589478: int;                                                                   
 var path3589471: int;                                                                              
 var lock3589478: Cow;                                                                              
 var Cow._state3589471: [Cow]State;                                                                 
 var tid3589471: Tid;                                                                               
 var $recorded.state3589471: int;                                                                   
 var $pc3589479: Phase;                                                                             
 var lock3589471: Cow;                                                                              
 var t3589478: int;                                                                                 
 var moverPath3589471: MoverPath;                                                                   
 var $recorded.state3589479: int;                                                                   
 var tid3589479: Tid;                                                                               
 var moverPath3589466: MoverPath;                                                                   
 var c3589466: Cow;                                                                                 
 var $pc3589471: Phase;                                                                             
 var this3589471: Cow;                                                                              
 var Cow._state3589466: [Cow]State;                                                                 
 var mover3589471: Mover;                                                                           
 var lock3589466: Cow;                                                                              
 var Cow._state3589479: [Cow]State;                                                                 
 var Cow.c13589466: [Cow]int;                                                                       
 var Cow.c13589479: [Cow]int;                                                                       
 var t3589471: int;                                                                                 
 var tid3589478: Tid;                                                                               
 var Cow.lock3589471: [Cow]Cow;                                                                     
 var this3589478: Cow;                                                                              
 var path3589478: int;                                                                              
 var tid3589466: Tid;                                                                               
 var this3589479: Cow;                                                                              
 var Cow.lock3589466: [Cow]Cow;                                                                     
 var t3589466: int;                                                                                 
 var moverPath3589478: MoverPath;                                                                   
 var mover3589466: Mover;                                                                           
 var Cow._lock3589466: [Cow]Tid;                                                                    
 var $pc3589478: Phase;                                                                             
 var lock: Cow;                                                                                     
 var Cow.lock3589478: [Cow]Cow;                                                                     
 var Cow._lock3589471: [Cow]Tid;                                                                    
 var t3589479: int;                                                                                 
 var c3589479: Cow;                                                                                 
 var c3589478: Cow;                                                                                 
 var path3589466: int;                                                                              
 var Cow._lock3589478: [Cow]Tid;                                                                    
 var t: int;                                                                                        
 var $pc3589466: Phase;                                                                             
 var Cow.c13589471: [Cow]int;                                                                       
 var $recorded.state3589466: int;                                                                   
 var Cow._lock3589479: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: int t;                                                                                     
                                                                                                    
                                                                                                    
 // 9.9: Cow lock;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: lock := this.lock;                                                                         
                                                                                                    
                                                                                                    
 moverPath3589466 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3589466 := m#moverPath(moverPath3589466);                                                     
 path3589466 := p#moverPath(moverPath3589466);                                                      
 assume Cow._state3589466 == Cow._state && Cow.lock3589466 == Cow.lock && Cow.c13589466 == Cow.c1 && Cow._lock3589466 == Cow._lock && lock3589466 == lock && t3589466 == t && c3589466 == c && this3589466 == this && tid3589466 == tid && $pc3589466 == $pc;
 assume $recorded.state3589466 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589466);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 lock := Cow.lock[this];                                                                            
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (10.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[lock] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.22): Reduction failure
 Cow._lock[lock] := tid;                                                                            
                                                                                                    
 // 11.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3589471 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3589471 := m#moverPath(moverPath3589471);                                                     
 path3589471 := p#moverPath(moverPath3589471);                                                      
 assume Cow._state3589471 == Cow._state && Cow.lock3589471 == Cow.lock && Cow.c13589471 == Cow.c1 && Cow._lock3589471 == Cow._lock && lock3589471 == lock && t3589471 == t && c3589471 == c && this3589471 == this && tid3589471 == tid && $pc3589471 == $pc;
 assume $recorded.state3589471 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (11.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589471);                                                              
 assert $pc != PhaseError;                                                                                 // (11.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (12.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[lock] == tid;                                                                            // (12.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.9): Reduction failure
 Cow._lock[lock] := Tid.null;                                                                       
                                                                                                    
 // 13.9: t := c.c1;                                                                                
                                                                                                    
                                                                                                    
 moverPath3589478 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);         
 mover3589478 := m#moverPath(moverPath3589478);                                                     
 path3589478 := p#moverPath(moverPath3589478);                                                      
 assume Cow._state3589478 == Cow._state && Cow.lock3589478 == Cow.lock && Cow.c13589478 == Cow.c1 && Cow._lock3589478 == Cow._lock && lock3589478 == lock && t3589478 == t && c3589478 == c && this3589478 == this && tid3589478 == tid && $pc3589478 == $pc;
 assume $recorded.state3589478 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (13.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589478);                                                              
 assert $pc != PhaseError;                                                                                 // (13.9): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 7.26: // return;                                                                                
                                                                                                    
 assume Cow._state3589479 == Cow._state && Cow.lock3589479 == Cow.lock && Cow.c13589479 == Cow.c1 && Cow._lock3589479 == Cow._lock && lock3589479 == lock && t3589479 == t && c3589479 == c && this3589479 == this && tid3589479 == tid;
 assume $recorded.state3589479 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.26): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow, c : Cow)                                                     
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (16.5): Bad tid
requires isSharedAssignable(Cow._state[c]);                                                                // (16.5): Parameter VarDecl(ClassType(Cow),c) is not global
requires isShared(Cow._state[this]);                                                                       // (16.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                   
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (16.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (16.5): Object invariant may not hold.
{                                                                                                   
 var Cow._lock3589505: [Cow]Tid;                                                                    
 var this3589504: Cow;                                                                              
 var lock3589491: Cow;                                                                              
 var Cow._state3589501: [Cow]State;                                                                 
 var this3589505: Cow;                                                                              
 var Cow._state3589491: [Cow]State;                                                                 
 var c3589501: Cow;                                                                                 
 var Cow._lock3589501: [Cow]Tid;                                                                    
 var t3589496: int;                                                                                 
 var $pc3589496: Phase;                                                                             
 var Cow.lock3589501_post: [Cow]Cow;                                                                
 var path3589496: int;                                                                              
 var lock3589501_post: Cow;                                                                         
 var Cow.c13589491: [Cow]int;                                                                       
 var Cow.c13589504: [Cow]int;                                                                       
 var Cow._lock3589501_post: [Cow]Tid;                                                               
 var $recorded.state3589496: int;                                                                   
 var moverPath3589504: MoverPath;                                                                   
 var this3589501: Cow;                                                                              
 var $recorded.state3589501_post: int;                                                              
 var c3589496: Cow;                                                                                 
 var tid3589501_post: Tid;                                                                          
 var lock3589505: Cow;                                                                              
 var Cow._state3589504: [Cow]State;                                                                 
 var this3589491: Cow;                                                                              
 var Cow._state3589505: [Cow]State;                                                                 
 var $pc3589501: Phase;                                                                             
 var Cow.lock3589504: [Cow]Cow;                                                                     
 var path3589504: int;                                                                              
 var Cow.lock3589501: [Cow]Cow;                                                                     
 var tid3589504: Tid;                                                                               
 var Cow._state3589501_post: [Cow]State;                                                            
 var Cow.lock3589505: [Cow]Cow;                                                                     
 var mover3589504: Mover;                                                                           
 var Cow._state3589496: [Cow]State;                                                                 
 var t3589501_post: int;                                                                            
 var tid3589505: Tid;                                                                               
 var $pc3589504: Phase;                                                                             
 var tid3589491: Tid;                                                                               
 var t3589504: int;                                                                                 
 var Cow._lock3589504: [Cow]Tid;                                                                    
 var moverPath3589491: MoverPath;                                                                   
 var c3589505: Cow;                                                                                 
 var c3589491: Cow;                                                                                 
 var t3589501: int;                                                                                 
 var t3589505: int;                                                                                 
 var lock3589496: Cow;                                                                              
 var c3589504: Cow;                                                                                 
 var $recorded.state3589504: int;                                                                   
 var $recorded.state3589491: int;                                                                   
 var this3589501_post: Cow;                                                                         
 var moverPath3589496: MoverPath;                                                                   
 var $pc3589491: Phase;                                                                             
 var c3589501_post: Cow;                                                                            
 var Cow._lock3589496: [Cow]Tid;                                                                    
 var Cow.c13589501_post: [Cow]int;                                                                  
 var t3589491: int;                                                                                 
 var lock: Cow;                                                                                     
 var lock3589504: Cow;                                                                              
 var Cow.c13589496: [Cow]int;                                                                       
 var tid3589496: Tid;                                                                               
 var Cow.c13589501: [Cow]int;                                                                       
 var mover3589496: Mover;                                                                           
 var $pc3589501_post: Phase;                                                                        
 var Cow.lock3589496: [Cow]Cow;                                                                     
 var t: int;                                                                                        
 var $pc3589505: Phase;                                                                             
 var $recorded.state3589505: int;                                                                   
 var lock3589501: Cow;                                                                              
 var $recorded.state3589501: int;                                                                   
 var tid3589501: Tid;                                                                               
 var mover3589491: Mover;                                                                           
 var Cow.lock3589491: [Cow]Cow;                                                                     
 var this3589496: Cow;                                                                              
 var Cow._lock3589491: [Cow]Tid;                                                                    
 var Cow.c13589505: [Cow]int;                                                                       
 var path3589491: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 17.9: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 18.9: Cow lock;                                                                                 
                                                                                                    
                                                                                                    
 // 18.9: lock := this.lock;                                                                        
                                                                                                    
                                                                                                    
 moverPath3589491 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3589491 := m#moverPath(moverPath3589491);                                                     
 path3589491 := p#moverPath(moverPath3589491);                                                      
 assume Cow._state3589491 == Cow._state && Cow.lock3589491 == Cow.lock && Cow.c13589491 == Cow.c1 && Cow._lock3589491 == Cow._lock && lock3589491 == lock && t3589491 == t && c3589491 == c && this3589491 == this && tid3589491 == tid && $pc3589491 == $pc;
 assume $recorded.state3589491 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589491);                                                              
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 lock := Cow.lock[this];                                                                            
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (19.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[lock] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (19.22): Reduction failure
 Cow._lock[lock] := tid;                                                                            
                                                                                                    
 // 20.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3589496 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3589496 := m#moverPath(moverPath3589496);                                                     
 path3589496 := p#moverPath(moverPath3589496);                                                      
 assume Cow._state3589496 == Cow._state && Cow.lock3589496 == Cow.lock && Cow.c13589496 == Cow.c1 && Cow._lock3589496 == Cow._lock && lock3589496 == lock && t3589496 == t && c3589496 == c && this3589496 == this && tid3589496 == tid && $pc3589496 == $pc;
 assume $recorded.state3589496 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (20.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589496);                                                              
 assert $pc != PhaseError;                                                                                 // (20.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (21.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[lock] == tid;                                                                            // (21.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.9): Reduction failure
 Cow._lock[lock] := Tid.null;                                                                       
                                                                                                    
 // 22.9: yield;                                                                                    
                                                                                                    
 assume Cow._state3589501 == Cow._state && Cow.lock3589501 == Cow.lock && Cow.c13589501 == Cow.c1 && Cow._lock3589501 == Cow._lock && lock3589501 == lock && t3589501 == t && c3589501 == c && this3589501 == this && tid3589501 == tid;
 assume $recorded.state3589501 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (22.9): Object invariant may not hold.
 call Yield(tid);                                                                                   
 assume  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (22.9): Object invariant may not hold.
 $pc := PreCommit;                                                                                  
 assume Cow._state3589501_post == Cow._state && Cow.lock3589501_post == Cow.lock && Cow.c13589501_post == Cow.c1 && Cow._lock3589501_post == Cow._lock && lock3589501_post == lock && t3589501_post == t && c3589501_post == c && this3589501_post == this && tid3589501_post == tid;
 assume $recorded.state3589501_post == 1;                                                           
                                                                                                    
 // 23.9: t := c.c1;                                                                                
                                                                                                    
                                                                                                    
 moverPath3589504 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);         
 mover3589504 := m#moverPath(moverPath3589504);                                                     
 path3589504 := p#moverPath(moverPath3589504);                                                      
 assume Cow._state3589504 == Cow._state && Cow.lock3589504 == Cow.lock && Cow.c13589504 == Cow.c1 && Cow._lock3589504 == Cow._lock && lock3589504 == lock && t3589504 == t && c3589504 == c && this3589504 == this && tid3589504 == tid && $pc3589504 == $pc;
 assume $recorded.state3589504 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (23.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589504);                                                              
 assert $pc != PhaseError;                                                                                 // (23.9): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 16.27: // return;                                                                               
                                                                                                    
 assume Cow._state3589505 == Cow._state && Cow.lock3589505 == Cow.lock && Cow.c13589505 == Cow.c1 && Cow._lock3589505 == Cow._lock && lock3589505 == lock && t3589505 == t && c3589505 == c && this3589505 == this && tid3589505 == tid;
 assume $recorded.state3589505 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (16.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow, c : Cow)                                                     
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (26.5): Bad tid
requires isSharedAssignable(Cow._state[c]);                                                                // (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
requires isShared(Cow._state[this]);                                                                       // (26.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                   
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (26.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (26.5): Object invariant may not hold.
{                                                                                                   
 var t3589529: int;                                                                                 
 var Cow._state3589517: [Cow]State;                                                                 
 var c3589529: Cow;                                                                                 
 var c3589522: Cow;                                                                                 
 var Cow._state3589528_bottom: [Cow]State;                                                          
 var Cow.lock3589528: [Cow]Cow;                                                                     
 var c3589528_bottom: Cow;                                                                          
 var $pc3589529: Phase;                                                                             
 var c3589528: Cow;                                                                                 
 var this3589529: Cow;                                                                              
 var Cow.lock3589517: [Cow]Cow;                                                                     
 var Cow._lock3589522: [Cow]Tid;                                                                    
 var Cow._lock3589517: [Cow]Tid;                                                                    
 var path3589517: int;                                                                              
 var Cow._state3589528: [Cow]State;                                                                 
 var $recorded.state3589517: int;                                                                   
 var Cow.c13589529: [Cow]int;                                                                       
 var $recorded.state3589528: int;                                                                   
 var this3589522: Cow;                                                                              
 var this3589528_bottom: Cow;                                                                       
 var this3589528: Cow;                                                                              
 var $recorded.state3589529: int;                                                                   
 var Cow.c13589528: [Cow]int;                                                                       
 var $pc3589517: Phase;                                                                             
 var Cow.lock3589522: [Cow]Cow;                                                                     
 var mover3589522: Mover;                                                                           
 var moverPath3589522: MoverPath;                                                                   
 var Cow.c13589528_bottom: [Cow]int;                                                                
 var c3589517: Cow;                                                                                 
 var path3589522: int;                                                                              
 var $pc3589528_bottom: Phase;                                                                      
 var tid3589529: Tid;                                                                               
 var moverPath3589517: MoverPath;                                                                   
 var mover3589517: Mover;                                                                           
 var lock3589522: Cow;                                                                              
 var $recorded.state3589528_bottom: int;                                                            
 var Cow._state3589522: [Cow]State;                                                                 
 var Cow.lock3589528_bottom: [Cow]Cow;                                                              
 var Cow._lock3589528: [Cow]Tid;                                                                    
 var tid3589517: Tid;                                                                               
 var Cow.c13589522: [Cow]int;                                                                       
 var t3589522: int;                                                                                 
 var tid3589522: Tid;                                                                               
 var lock3589517: Cow;                                                                              
 var $pc3589528: Phase;                                                                             
 var Cow._lock3589529: [Cow]Tid;                                                                    
 var $pc3589522: Phase;                                                                             
 var tid3589528: Tid;                                                                               
 var Cow._state3589529: [Cow]State;                                                                 
 var Cow.c13589517: [Cow]int;                                                                       
 var lock3589528_bottom: Cow;                                                                       
 var lock: Cow;                                                                                     
 var Cow.lock3589529: [Cow]Cow;                                                                     
 var t3589528_bottom: int;                                                                          
 var phase3589528: Phase;                                                                           
 var this3589517: Cow;                                                                              
 var $recorded.state3589522: int;                                                                   
 var t: int;                                                                                        
 var t3589517: int;                                                                                 
 var lock3589528: Cow;                                                                              
 var Cow._lock3589528_bottom: [Cow]Tid;                                                             
 var t3589528: int;                                                                                 
 var tid3589528_bottom: Tid;                                                                        
 var lock3589529: Cow;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 27.9: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 28.9: Cow lock;                                                                                 
                                                                                                    
                                                                                                    
 // 28.9: lock := this.lock;                                                                        
                                                                                                    
                                                                                                    
 moverPath3589517 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3589517 := m#moverPath(moverPath3589517);                                                     
 path3589517 := p#moverPath(moverPath3589517);                                                      
 assume Cow._state3589517 == Cow._state && Cow.lock3589517 == Cow.lock && Cow.c13589517 == Cow.c1 && Cow._lock3589517 == Cow._lock && lock3589517 == lock && t3589517 == t && c3589517 == c && this3589517 == this && tid3589517 == tid && $pc3589517 == $pc;
 assume $recorded.state3589517 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (28.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589517);                                                              
 assert $pc != PhaseError;                                                                                 // (28.9): Reduction failure
 lock := Cow.lock[this];                                                                            
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (29.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[lock] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (29.22): Reduction failure
 Cow._lock[lock] := tid;                                                                            
                                                                                                    
 // 30.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3589522 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3589522 := m#moverPath(moverPath3589522);                                                     
 path3589522 := p#moverPath(moverPath3589522);                                                      
 assume Cow._state3589522 == Cow._state && Cow.lock3589522 == Cow.lock && Cow.c13589522 == Cow.c1 && Cow._lock3589522 == Cow._lock && lock3589522 == lock && t3589522 == t && c3589522 == c && this3589522 == this && tid3589522 == tid && $pc3589522 == $pc;
 assume $recorded.state3589522 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (30.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3589522);                                                              
 assert $pc != PhaseError;                                                                                 // (30.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (31.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[lock] == tid;                                                                            // (31.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (31.9): Reduction failure
 Cow._lock[lock] := Tid.null;                                                                       
 assume Cow._state3589528 == Cow._state && Cow.lock3589528 == Cow.lock && Cow.c13589528 == Cow.c1 && Cow._lock3589528 == Cow._lock && lock3589528 == lock && t3589528 == t && c3589528 == c && this3589528 == this && tid3589528 == tid;
 assume $recorded.state3589528 == 1;                                                                
                                                                                                    
 // 32.9: while (true)   {                                                                          
                                                                                                    
 phase3589528 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (26.5): Bad tid
  invariant isSharedAssignable(Cow._state[c]);                                                             // (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
  invariant isShared(Cow._state[this]);                                                                    // (26.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (32.9): Object invariant may not hold.
  invariant (forall _this : Cow :: Invariant.Y_Cow.lock(tid : Tid, _this, Cow.lock[_this] ,Cow._state3589528,Cow.lock3589528,Cow.c13589528,Cow._lock3589528));       // (32.9): Loop does not preserve yields_as annotation for field lock
  invariant (forall _this : Cow :: Invariant.Y_Cow.c1(tid : Tid, _this, Cow.c1[_this] ,Cow._state3589528,Cow.lock3589528,Cow.c13589528,Cow._lock3589528));       // (32.9): Loop does not preserve yields_as annotation for field c1
  invariant phase3589528 == $pc;                                                                           // (32.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (32.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  assume Cow._state3589528_bottom == Cow._state && Cow.lock3589528_bottom == Cow.lock && Cow.c13589528_bottom == Cow.c1 && Cow._lock3589528_bottom == Cow._lock && lock3589528_bottom == lock && t3589528_bottom == t && c3589528_bottom == c && this3589528_bottom == this && tid3589528_bottom == tid;
  assume $recorded.state3589528_bottom == 1;                                                        
  assert phase3589528 == $pc;                                                                              // (32.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 26.27: // return;                                                                               
                                                                                                    
 assume Cow._state3589529 == Cow._state && Cow.lock3589529 == Cow.lock && Cow.c13589529 == Cow.c1 && Cow._lock3589529 == Cow._lock && lock3589529 == lock && t3589529 == t && c3589529 == c && this3589529 == this && tid3589529 == tid;
 assume $recorded.state3589529 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (26.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.lock[_i]]))) &&
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.lock[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)             
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.lock(u: Tid,x: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.lock failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)              
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.lock(u: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.lock failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)              
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.lock[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.lock[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.lock(u: Tid,x: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.lock failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)               
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Cow;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.lock[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.lock(u: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.lock failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                   
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.lock(u: Tid,x: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.lock failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                    
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Cow.lock[x];                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.lock[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.lock(u: Tid,x: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.lock failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)               
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.c1 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.c1 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.c1 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.c1 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                     
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.c1 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.c1[x];                                                                             
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.c1 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.lock.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.lock.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : Cow;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.lock[x];                                                                               
 Cow.lock[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.lock[x] := tmpV;                                                                               
 Cow.lock[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.lock.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.lock;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : Cow;                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.lock[x];                                                                               
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.lock[x] := tmpV;                                                                               
 Cow.lock[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.lock.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);             
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.lock.Cow.lock(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.lock(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.lock(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);             
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.lock.Cow.c1(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.lock.Cow.c1(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Cow;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.lock[x];                                                                               
 Cow.lock[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.lock[x] := tmpV;                                                                               
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.lock.Cow.c1(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow) 
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Cow;                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.lock[x];                                                                               
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.lock[x] := tmpV;                                                                               
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.lock.Cow.c1(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[y] := w;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.lock(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);             
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.lock.Cow.c1(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.lock;                                                                                 
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.lock(t: Tid,x: Cow,v: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);               
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.c1.Cow.lock(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.c1.Cow.lock(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.lock[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.c1.Cow.lock(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow) 
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.lock[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.c1.Cow.lock(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.lock(u: Tid,y: Cow,w: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.lock[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);               
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.c1.Cow.lock(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.lock;                                                                                 
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.lock(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                 
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.lock(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);             
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)   
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.lock_mid: [Cow]Cow;                                                                        
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_mid == Cow._state && Cow.lock_mid == Cow.lock && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[y] := w;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);               
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var Cow.lock_pre: [Cow]Cow;                                                                        
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.lock_post: [Cow]Cow;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);                   
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.lock,Cow.c1,Cow._lock);          
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.lock_post == Cow.lock && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);               
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                   
requires ValidTid(tid);                                                                             
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures Y(tid , old(Cow._state), old(Cow.lock), old(Cow.c1), old(Cow._lock) , Cow._state, Cow.lock, Cow.c1, Cow._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow.lock:                                                                                        
                                                                                                    
function {:inline} Y_Cow.lock(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock)), _R)) ==> (Cow.lock[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.lock(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.lock(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.lock(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                  
}                                                                                                   
                                                                                                    
procedure Y_Cow.lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.lock(tid, this, Cow.lock[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock);            
}                                                                                                   
                                                                                                    
procedure Y_Cow.lock.Transitive(tid : Tid, this: Cow, newValue : Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.lock_p: [Cow]Cow, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires StateInvariant(Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);                          
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (4.14): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
var Cow.lock_pre: [Cow]Cow;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var Cow.c1_post: [Cow]int;                                                                          
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.lock_post: [Cow]Cow;                                                                        
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.lock, Cow.c1, Cow._lock , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);
 assume Y_Cow.lock(tid, this, newValue , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);          
assume Cow._state_post == Cow._state_p && Cow.lock_post == Cow.lock_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.lock(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                  
}                                                                                                   
// Cow.c1:                                                                                          
                                                                                                    
function {:inline} Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock)), _R)) ==> (Cow.c1[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.c1(u: Tid,this: Cow,newValue: int,Cow._state,Cow.lock,Cow.c1,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, Cow.c1[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock);                
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.lock_p: [Cow]Cow, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires StateInvariant(Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);                          
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (5.12): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
var Cow.lock_pre: [Cow]Cow;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.c1_post: [Cow]int;                                                                          
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.lock_post: [Cow]Cow;                                                                        
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.lock, Cow.c1, Cow._lock , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);
 assume Y_Cow.c1(tid, this, newValue , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);            
assume Cow._state_post == Cow._state_p && Cow.lock_post == Cow.lock_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                    
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.lock,Cow.c1,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                 
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.lock_yield: [Cow]Cow;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.lock_yield == Cow.lock && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock);          
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.lock_p: [Cow]Cow, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                  
 requires StateInvariant(Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);                          
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3589261(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (3.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
var Cow.lock_pre: [Cow]Cow;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.c1_post: [Cow]int;                                                                          
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.lock_post: [Cow]Cow;                                                                        
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.lock_pre == Cow.lock && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.lock, Cow.c1, Cow._lock , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.lock_p, Cow.c1_p, Cow._lock_p);         
assume Cow._state_post == Cow._state_p && Cow.lock_post == Cow.lock_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.lock, Cow.c1, Cow._lock);                 
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.lock: [Cow]Cow, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.lock_p: [Cow]Cow, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.lock(tid : Tid, this, Cow.lock_p[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock))
 && (forall this: Cow :: Y_Cow.c1(tid : Tid, this, Cow.c1_p[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.lock, Cow.c1, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 666.1-829.2: (Method:7.5)
// 674.1-674.24: (7.5): Bad tid
// 675.1-675.44: (7.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 676.1-676.37: (7.5): this is not global
// 679.1-679.188: (7.5): Object invariant may not hold.
// 682.1-682.187: (7.5): Object invariant may not hold.
// 744.2-746.2: (class anchor.sink.VarDeclStmt:8.9)
// 747.2-749.2: (class anchor.sink.VarDeclStmt:9.9)
// 750.2-767.25: (class anchor.sink.Read:9.9)
// 762.1-762.27: (9.9): Cannot have potential null deference in left-mover part.
// 766.1-766.27: (9.9): Reduction failure
// 771.1-771.27: (10.22): Cannot have potential null deference in left-mover part.
// 775.1-775.27: (10.22): Reduction failure
// 777.2-794.20: (class anchor.sink.Read:11.13)
// 789.1-789.27: (11.13): Cannot have potential null deference in left-mover part.
// 793.1-793.27: (11.13): Reduction failure
// 798.1-798.27: (12.9): Cannot have potential null deference in left-mover part.
// 800.1-800.32: (12.9): lock not held
// 802.1-802.27: (12.9): Reduction failure
// 804.2-821.17: (class anchor.sink.Read:13.9)
// 816.1-816.24: (13.9): Cannot have potential null deference in left-mover part.
// 820.1-820.27: (13.9): Reduction failure
// 822.2-828.9: (class anchor.sink.Return:7.26)
// 827.1-827.187: (7.26): Object invariant may not hold.
// 830.1-1026.2: (Method:16.5)
// 838.1-838.24: (16.5): Bad tid
// 839.1-839.44: (16.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 840.1-840.37: (16.5): this is not global
// 843.1-843.188: (16.5): Object invariant may not hold.
// 846.1-846.187: (16.5): Object invariant may not hold.
// 930.2-932.2: (class anchor.sink.VarDeclStmt:17.9)
// 933.2-935.2: (class anchor.sink.VarDeclStmt:18.9)
// 936.2-953.25: (class anchor.sink.Read:18.9)
// 948.1-948.27: (18.9): Cannot have potential null deference in left-mover part.
// 952.1-952.27: (18.9): Reduction failure
// 957.1-957.27: (19.22): Cannot have potential null deference in left-mover part.
// 961.1-961.27: (19.22): Reduction failure
// 963.2-980.20: (class anchor.sink.Read:20.13)
// 975.1-975.27: (20.13): Cannot have potential null deference in left-mover part.
// 979.1-979.27: (20.13): Reduction failure
// 984.1-984.27: (21.9): Cannot have potential null deference in left-mover part.
// 986.1-986.32: (21.9): lock not held
// 988.1-988.27: (21.9): Reduction failure
// 990.2-1000.42: (class anchor.sink.Yield:22.9)
// 995.1-995.187: (22.9): Object invariant may not hold.
// 997.1-997.187: (22.9): Object invariant may not hold.
// 1001.2-1018.17: (class anchor.sink.Read:23.9)
// 1013.1-1013.24: (23.9): Cannot have potential null deference in left-mover part.
// 1017.1-1017.27: (23.9): Reduction failure
// 1019.2-1025.9: (class anchor.sink.Return:16.27)
// 1024.1-1024.187: (16.27): Object invariant may not hold.
// 1027.1-1204.2: (Method:26.5)
// 1035.1-1035.24: (26.5): Bad tid
// 1036.1-1036.44: (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 1037.1-1037.37: (26.5): this is not global
// 1040.1-1040.188: (26.5): Object invariant may not hold.
// 1043.1-1043.187: (26.5): Object invariant may not hold.
// 1114.2-1116.2: (class anchor.sink.VarDeclStmt:27.9)
// 1117.2-1119.2: (class anchor.sink.VarDeclStmt:28.9)
// 1120.2-1137.25: (class anchor.sink.Read:28.9)
// 1132.1-1132.27: (28.9): Cannot have potential null deference in left-mover part.
// 1136.1-1136.27: (28.9): Reduction failure
// 1141.1-1141.27: (29.22): Cannot have potential null deference in left-mover part.
// 1145.1-1145.27: (29.22): Reduction failure
// 1147.2-1164.20: (class anchor.sink.Read:30.13)
// 1159.1-1159.27: (30.13): Cannot have potential null deference in left-mover part.
// 1163.1-1163.27: (30.13): Reduction failure
// 1168.1-1168.27: (31.9): Cannot have potential null deference in left-mover part.
// 1170.1-1170.32: (31.9): lock not held
// 1172.1-1172.27: (31.9): Reduction failure
// 1176.2-1180.14: (class anchor.sink.While:32.9)
// 1182.1-1182.27: (26.5): Bad tid
// 1183.1-1183.47: (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 1184.1-1184.40: (26.5): this is not global
// 1187.1-1187.191: (32.9): Object invariant may not hold.
// 1188.1-1188.159: (32.9): Loop does not preserve yields_as annotation for field lock
// 1189.1-1189.155: (32.9): Loop does not preserve yields_as annotation for field c1
// 1190.1-1190.33: (32.9): Phase must be invariant at loop head
// 1191.1-1191.30: (32.9): Potentially infinite loop cannot be in post-commit phase.
// 1195.1-1195.30: (32.9): Phase must be invariant at loop head
// 1197.2-1203.9: (class anchor.sink.Return:26.27)
// 1202.1-1202.187: (26.27): Object invariant may not hold.
// 1282.1-1282.34: (4.5): Cow.lock failed Write-Write Right-Mover Check
// 1341.1-1341.30: (4.5): Cow.lock failed Write-Read Right-Mover Check
// 1404.1-1404.34: (4.5): Cow.lock failed Write-Write Left-Mover Check
// 1464.1-1464.30: (4.5): Cow.lock failed Write-Read Left-Mover Check
// 1521.1-1521.34: (4.5): Cow.lock failed Read-Write Right-Mover Check
// 1581.1-1581.34: (4.5): Cow.lock failed Read-Write Left-Mover Check
// 1640.1-1640.34: (5.5): Cow.c1 failed Write-Write Right-Mover Check
// 1699.1-1699.30: (5.5): Cow.c1 failed Write-Read Right-Mover Check
// 1762.1-1762.34: (5.5): Cow.c1 failed Write-Write Left-Mover Check
// 1822.1-1822.30: (5.5): Cow.c1 failed Write-Read Left-Mover Check
// 1879.1-1879.34: (5.5): Cow.c1 failed Read-Write Right-Mover Check
// 1939.1-1939.34: (5.5): Cow.c1 failed Read-Write Left-Mover Check
// 2010.1-2010.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.1)
// 2011.1-2011.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.2)
// 2012.1-2012.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.3)
// 2108.1-2108.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case C)
// 2209.1-2209.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case D)
// 2210.1-2210.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case R)
// 2281.1-2281.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case F)
// 2282.1-2282.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case H)
// 2283.1-2283.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case I)
// 2353.1-2353.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case J)
// 2354.1-2354.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case K)
// 2355.1-2355.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case L)
// 2427.1-2427.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.1)
// 2428.1-2428.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.2)
// 2429.1-2429.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.3)
// 2525.1-2525.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case C)
// 2626.1-2626.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case D)
// 2627.1-2627.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case R)
// 2698.1-2698.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case F)
// 2699.1-2699.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case H)
// 2700.1-2700.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case I)
// 2770.1-2770.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case J)
// 2771.1-2771.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case K)
// 2772.1-2772.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case L)
// 2844.1-2844.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 2845.1-2845.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 2846.1-2846.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 2942.1-2942.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case C)
// 3043.1-3043.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case D)
// 3044.1-3044.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case R)
// 3115.1-3115.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case F)
// 3116.1-3116.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case H)
// 3117.1-3117.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case I)
// 3187.1-3187.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case J)
// 3188.1-3188.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case K)
// 3189.1-3189.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case L)
// 3261.1-3261.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 3262.1-3262.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 3263.1-3263.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 3359.1-3359.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
// 3460.1-3460.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
// 3461.1-3461.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
// 3532.1-3532.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
// 3533.1-3533.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
// 3534.1-3534.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
// 3604.1-3604.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
// 3605.1-3605.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
// 3606.1-3606.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
// 3613.1-3613.188: (<undefined position>): Object invariant may not hold.
// 3620.1-3620.187: (<undefined position>): Object invariant may not hold.
// 3640.1-3660.2: (4.5): yields_as clause for Cow.lock is not valid
// 3665.1-3680.2: (4.5): yields_as clause for Cow.lock is not reflexive
// 3686.1-3686.188: (4.14): Object invariant may not hold.
// 3687.1-3717.2: (4.5): yields_as clause for Cow.lock is not transitive
// 3736.1-3756.2: (5.5): yields_as clause for Cow.c1 is not valid
// 3761.1-3776.2: (5.5): yields_as clause for Cow.c1 is not reflexive
// 3782.1-3782.188: (5.12): Object invariant may not hold.
// 3783.1-3813.2: (5.5): yields_as clause for Cow.c1 is not transitive
// 3833.1-3853.2: (7.32): yields_as clause for Cow._lock is not valid
// 3858.1-3873.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3879.1-3879.188: (3.1): Object invariant may not hold.
// 3880.1-3910.2: (7.32): yields_as clause for Cow._lock is not transitive
