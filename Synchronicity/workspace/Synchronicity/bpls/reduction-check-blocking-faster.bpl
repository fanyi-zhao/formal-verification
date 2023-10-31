                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reduction-check-blocking-faster.sink:   
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow lock isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
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
       : N                                                                                          
                                                                                                    
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
       : N                                                                                          
                                                                                                    
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
       : N                                                                                          
                                                                                                    
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
  moverPath(_N, 0)                                                                                  
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
  moverPath(_N, 0)                                                                                  
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
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
{                                                                                                   
 var Cow._state3584449: [Cow]State;                                                                 
 var mover3584448: Mover;                                                                           
 var Cow.lock3584448: [Cow]Cow;                                                                     
 var t3584441: int;                                                                                 
 var c3584449: Cow;                                                                                 
 var $pc3584441: Phase;                                                                             
 var Cow.c13584448: [Cow]int;                                                                       
 var Cow._state3584441: [Cow]State;                                                                 
 var lock3584448: Cow;                                                                              
 var tid3584448: Tid;                                                                               
 var moverPath3584448: MoverPath;                                                                   
 var Cow.lock3584449: [Cow]Cow;                                                                     
 var lock3584441: Cow;                                                                              
 var $recorded.state3584441: int;                                                                   
 var $pc3584436: Phase;                                                                             
 var lock3584449: Cow;                                                                              
 var Cow._state3584436: [Cow]State;                                                                 
 var lock3584436: Cow;                                                                              
 var path3584436: int;                                                                              
 var Cow._lock3584449: [Cow]Tid;                                                                    
 var Cow._lock3584436: [Cow]Tid;                                                                    
 var this3584436: Cow;                                                                              
 var $recorded.state3584449: int;                                                                   
 var Cow.c13584449: [Cow]int;                                                                       
 var path3584448: int;                                                                              
 var this3584449: Cow;                                                                              
 var tid3584436: Tid;                                                                               
 var t3584436: int;                                                                                 
 var tid3584449: Tid;                                                                               
 var c3584448: Cow;                                                                                 
 var c3584441: Cow;                                                                                 
 var tid3584441: Tid;                                                                               
 var $recorded.state3584448: int;                                                                   
 var $recorded.state3584436: int;                                                                   
 var Cow._state3584448: [Cow]State;                                                                 
 var t3584449: int;                                                                                 
 var this3584448: Cow;                                                                              
 var this3584441: Cow;                                                                              
 var $pc3584448: Phase;                                                                             
 var moverPath3584436: MoverPath;                                                                   
 var Cow.c13584436: [Cow]int;                                                                       
 var moverPath3584441: MoverPath;                                                                   
 var lock: Cow;                                                                                     
 var mover3584436: Mover;                                                                           
 var Cow.lock3584441: [Cow]Cow;                                                                     
 var Cow._lock3584441: [Cow]Tid;                                                                    
 var mover3584441: Mover;                                                                           
 var Cow._lock3584448: [Cow]Tid;                                                                    
 var t3584448: int;                                                                                 
 var $pc3584449: Phase;                                                                             
 var path3584441: int;                                                                              
 var t: int;                                                                                        
 var Cow.c13584441: [Cow]int;                                                                       
 var c3584436: Cow;                                                                                 
 var Cow.lock3584436: [Cow]Cow;                                                                     
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: int t;                                                                                     
                                                                                                    
                                                                                                    
 // 9.9: Cow lock;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: lock := this.lock;                                                                         
                                                                                                    
                                                                                                    
 moverPath3584436 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3584436 := m#moverPath(moverPath3584436);                                                     
 path3584436 := p#moverPath(moverPath3584436);                                                      
 assume Cow._state3584436 == Cow._state && Cow.lock3584436 == Cow.lock && Cow.c13584436 == Cow.c1 && Cow._lock3584436 == Cow._lock && lock3584436 == lock && t3584436 == t && c3584436 == c && this3584436 == this && tid3584436 == tid && $pc3584436 == $pc;
 assume $recorded.state3584436 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584436);                                                              
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
                                                                                                    
                                                                                                    
 moverPath3584441 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3584441 := m#moverPath(moverPath3584441);                                                     
 path3584441 := p#moverPath(moverPath3584441);                                                      
 assume Cow._state3584441 == Cow._state && Cow.lock3584441 == Cow.lock && Cow.c13584441 == Cow.c1 && Cow._lock3584441 == Cow._lock && lock3584441 == lock && t3584441 == t && c3584441 == c && this3584441 == this && tid3584441 == tid && $pc3584441 == $pc;
 assume $recorded.state3584441 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (11.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584441);                                                              
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
                                                                                                    
                                                                                                    
 moverPath3584448 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);         
 mover3584448 := m#moverPath(moverPath3584448);                                                     
 path3584448 := p#moverPath(moverPath3584448);                                                      
 assume Cow._state3584448 == Cow._state && Cow.lock3584448 == Cow.lock && Cow.c13584448 == Cow.c1 && Cow._lock3584448 == Cow._lock && lock3584448 == lock && t3584448 == t && c3584448 == c && this3584448 == this && tid3584448 == tid && $pc3584448 == $pc;
 assume $recorded.state3584448 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (13.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584448);                                                              
 assert $pc != PhaseError;                                                                                 // (13.9): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 7.26: // return;                                                                                
                                                                                                    
 assume Cow._state3584449 == Cow._state && Cow.lock3584449 == Cow.lock && Cow.c13584449 == Cow.c1 && Cow._lock3584449 == Cow._lock && lock3584449 == lock && t3584449 == t && c3584449 == c && this3584449 == this && tid3584449 == tid;
 assume $recorded.state3584449 == 1;                                                                
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
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
{                                                                                                   
 var c3584471_post: Cow;                                                                            
 var Cow.lock3584474: [Cow]Cow;                                                                     
 var Cow.c13584471: [Cow]int;                                                                       
 var lock3584461: Cow;                                                                              
 var Cow.c13584474: [Cow]int;                                                                       
 var $recorded.state3584475: int;                                                                   
 var Cow._state3584466: [Cow]State;                                                                 
 var c3584475: Cow;                                                                                 
 var tid3584471_post: Tid;                                                                          
 var Cow._lock3584474: [Cow]Tid;                                                                    
 var moverPath3584466: MoverPath;                                                                   
 var Cow._state3584461: [Cow]State;                                                                 
 var Cow.lock3584471: [Cow]Cow;                                                                     
 var this3584466: Cow;                                                                              
 var $pc3584475: Phase;                                                                             
 var Cow.c13584466: [Cow]int;                                                                       
 var c3584466: Cow;                                                                                 
 var t3584461: int;                                                                                 
 var lock3584474: Cow;                                                                              
 var tid3584475: Tid;                                                                               
 var t3584475: int;                                                                                 
 var path3584474: int;                                                                              
 var c3584471: Cow;                                                                                 
 var tid3584466: Tid;                                                                               
 var t3584471: int;                                                                                 
 var $recorded.state3584471: int;                                                                   
 var Cow._state3584475: [Cow]State;                                                                 
 var Cow._state3584471_post: [Cow]State;                                                            
 var t3584466: int;                                                                                 
 var moverPath3584461: MoverPath;                                                                   
 var $pc3584466: Phase;                                                                             
 var t3584474: int;                                                                                 
 var c3584474: Cow;                                                                                 
 var $recorded.state3584471_post: int;                                                              
 var Cow.c13584475: [Cow]int;                                                                       
 var $pc3584461: Phase;                                                                             
 var this3584461: Cow;                                                                              
 var path3584461: int;                                                                              
 var Cow._lock3584471_post: [Cow]Tid;                                                               
 var lock3584471_post: Cow;                                                                         
 var this3584471_post: Cow;                                                                         
 var $recorded.state3584466: int;                                                                   
 var mover3584474: Mover;                                                                           
 var $recorded.state3584474: int;                                                                   
 var Cow.c13584461: [Cow]int;                                                                       
 var Cow._lock3584471: [Cow]Tid;                                                                    
 var this3584474: Cow;                                                                              
 var t3584471_post: int;                                                                            
 var this3584475: Cow;                                                                              
 var lock3584466: Cow;                                                                              
 var Cow._state3584471: [Cow]State;                                                                 
 var $recorded.state3584461: int;                                                                   
 var mover3584461: Mover;                                                                           
 var Cow.lock3584475: [Cow]Cow;                                                                     
 var lock: Cow;                                                                                     
 var Cow.lock3584471_post: [Cow]Cow;                                                                
 var mover3584466: Mover;                                                                           
 var path3584466: int;                                                                              
 var Cow.c13584471_post: [Cow]int;                                                                  
 var Cow._state3584474: [Cow]State;                                                                 
 var Cow.lock3584466: [Cow]Cow;                                                                     
 var $pc3584471_post: Phase;                                                                        
 var t: int;                                                                                        
 var tid3584474: Tid;                                                                               
 var lock3584475: Cow;                                                                              
 var $pc3584471: Phase;                                                                             
 var lock3584471: Cow;                                                                              
 var Cow._lock3584466: [Cow]Tid;                                                                    
 var Cow._lock3584475: [Cow]Tid;                                                                    
 var Cow.lock3584461: [Cow]Cow;                                                                     
 var tid3584471: Tid;                                                                               
 var $pc3584474: Phase;                                                                             
 var tid3584461: Tid;                                                                               
 var moverPath3584474: MoverPath;                                                                   
 var c3584461: Cow;                                                                                 
 var this3584471: Cow;                                                                              
 var Cow._lock3584461: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 17.9: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 18.9: Cow lock;                                                                                 
                                                                                                    
                                                                                                    
 // 18.9: lock := this.lock;                                                                        
                                                                                                    
                                                                                                    
 moverPath3584461 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3584461 := m#moverPath(moverPath3584461);                                                     
 path3584461 := p#moverPath(moverPath3584461);                                                      
 assume Cow._state3584461 == Cow._state && Cow.lock3584461 == Cow.lock && Cow.c13584461 == Cow.c1 && Cow._lock3584461 == Cow._lock && lock3584461 == lock && t3584461 == t && c3584461 == c && this3584461 == this && tid3584461 == tid && $pc3584461 == $pc;
 assume $recorded.state3584461 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584461);                                                              
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
                                                                                                    
                                                                                                    
 moverPath3584466 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3584466 := m#moverPath(moverPath3584466);                                                     
 path3584466 := p#moverPath(moverPath3584466);                                                      
 assume Cow._state3584466 == Cow._state && Cow.lock3584466 == Cow.lock && Cow.c13584466 == Cow.c1 && Cow._lock3584466 == Cow._lock && lock3584466 == lock && t3584466 == t && c3584466 == c && this3584466 == this && tid3584466 == tid && $pc3584466 == $pc;
 assume $recorded.state3584466 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (20.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584466);                                                              
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
                                                                                                    
 assume Cow._state3584471 == Cow._state && Cow.lock3584471 == Cow.lock && Cow.c13584471 == Cow.c1 && Cow._lock3584471 == Cow._lock && lock3584471 == lock && t3584471 == t && c3584471 == c && this3584471 == this && tid3584471 == tid;
 assume $recorded.state3584471 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state3584471_post == Cow._state && Cow.lock3584471_post == Cow.lock && Cow.c13584471_post == Cow.c1 && Cow._lock3584471_post == Cow._lock && lock3584471_post == lock && t3584471_post == t && c3584471_post == c && this3584471_post == this && tid3584471_post == tid;
 assume $recorded.state3584471_post == 1;                                                           
                                                                                                    
 // 23.9: t := c.c1;                                                                                
                                                                                                    
                                                                                                    
 moverPath3584474 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);         
 mover3584474 := m#moverPath(moverPath3584474);                                                     
 path3584474 := p#moverPath(moverPath3584474);                                                      
 assume Cow._state3584474 == Cow._state && Cow.lock3584474 == Cow.lock && Cow.c13584474 == Cow.c1 && Cow._lock3584474 == Cow._lock && lock3584474 == lock && t3584474 == t && c3584474 == c && this3584474 == this && tid3584474 == tid && $pc3584474 == $pc;
 assume $recorded.state3584474 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (23.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584474);                                                              
 assert $pc != PhaseError;                                                                                 // (23.9): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 16.27: // return;                                                                               
                                                                                                    
 assume Cow._state3584475 == Cow._state && Cow.lock3584475 == Cow.lock && Cow.c13584475 == Cow.c1 && Cow._lock3584475 == Cow._lock && lock3584475 == lock && t3584475 == t && c3584475 == c && this3584475 == this && tid3584475 == tid;
 assume $recorded.state3584475 == 1;                                                                
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
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
{                                                                                                   
 var $pc3584487: Phase;                                                                             
 var this3584487: Cow;                                                                              
 var Cow._state3584499: [Cow]State;                                                                 
 var $recorded.state3584499: int;                                                                   
 var t3584499: int;                                                                                 
 var t3584487: int;                                                                                 
 var c3584487: Cow;                                                                                 
 var path3584492: int;                                                                              
 var c3584492: Cow;                                                                                 
 var $pc3584492: Phase;                                                                             
 var tid3584499: Tid;                                                                               
 var Cow.c13584487: [Cow]int;                                                                       
 var lock3584492: Cow;                                                                              
 var Cow.c13584498_bottom: [Cow]int;                                                                
 var Cow.lock3584499: [Cow]Cow;                                                                     
 var mover3584492: Mover;                                                                           
 var Cow.c13584498: [Cow]int;                                                                       
 var $recorded.state3584498_bottom: int;                                                            
 var Cow._state3584487: [Cow]State;                                                                 
 var Cow._state3584498: [Cow]State;                                                                 
 var Cow.lock3584498: [Cow]Cow;                                                                     
 var Cow._lock3584498: [Cow]Tid;                                                                    
 var phase3584498: Phase;                                                                           
 var lock3584498_bottom: Cow;                                                                       
 var lock3584498: Cow;                                                                              
 var Cow.c13584499: [Cow]int;                                                                       
 var lock3584499: Cow;                                                                              
 var tid3584492: Tid;                                                                               
 var lock3584487: Cow;                                                                              
 var this3584498: Cow;                                                                              
 var tid3584498: Tid;                                                                               
 var $pc3584499: Phase;                                                                             
 var mover3584487: Mover;                                                                           
 var this3584499: Cow;                                                                              
 var Cow._state3584492: [Cow]State;                                                                 
 var this3584492: Cow;                                                                              
 var Cow.lock3584487: [Cow]Cow;                                                                     
 var Cow._lock3584498_bottom: [Cow]Tid;                                                             
 var Cow._state3584498_bottom: [Cow]State;                                                          
 var Cow._lock3584487: [Cow]Tid;                                                                    
 var t3584498: int;                                                                                 
 var $recorded.state3584492: int;                                                                   
 var $pc3584498: Phase;                                                                             
 var Cow._lock3584499: [Cow]Tid;                                                                    
 var t3584492: int;                                                                                 
 var lock: Cow;                                                                                     
 var $recorded.state3584487: int;                                                                   
 var Cow.c13584492: [Cow]int;                                                                       
 var Cow.lock3584492: [Cow]Cow;                                                                     
 var c3584499: Cow;                                                                                 
 var tid3584498_bottom: Tid;                                                                        
 var $recorded.state3584498: int;                                                                   
 var path3584487: int;                                                                              
 var t3584498_bottom: int;                                                                          
 var moverPath3584492: MoverPath;                                                                   
 var Cow.lock3584498_bottom: [Cow]Cow;                                                              
 var t: int;                                                                                        
 var Cow._lock3584492: [Cow]Tid;                                                                    
 var $pc3584498_bottom: Phase;                                                                      
 var moverPath3584487: MoverPath;                                                                   
 var c3584498: Cow;                                                                                 
 var c3584498_bottom: Cow;                                                                          
 var this3584498_bottom: Cow;                                                                       
 var tid3584487: Tid;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 27.9: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 28.9: Cow lock;                                                                                 
                                                                                                    
                                                                                                    
 // 28.9: lock := this.lock;                                                                        
                                                                                                    
                                                                                                    
 moverPath3584487 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3584487 := m#moverPath(moverPath3584487);                                                     
 path3584487 := p#moverPath(moverPath3584487);                                                      
 assume Cow._state3584487 == Cow._state && Cow.lock3584487 == Cow.lock && Cow.c13584487 == Cow.c1 && Cow._lock3584487 == Cow._lock && lock3584487 == lock && t3584487 == t && c3584487 == c && this3584487 == this && tid3584487 == tid && $pc3584487 == $pc;
 assume $recorded.state3584487 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (28.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584487);                                                              
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
                                                                                                    
                                                                                                    
 moverPath3584492 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3584492 := m#moverPath(moverPath3584492);                                                     
 path3584492 := p#moverPath(moverPath3584492);                                                      
 assume Cow._state3584492 == Cow._state && Cow.lock3584492 == Cow.lock && Cow.c13584492 == Cow.c1 && Cow._lock3584492 == Cow._lock && lock3584492 == lock && t3584492 == t && c3584492 == c && this3584492 == this && tid3584492 == tid && $pc3584492 == $pc;
 assume $recorded.state3584492 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (30.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3584492);                                                              
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
 assume Cow._state3584498 == Cow._state && Cow.lock3584498 == Cow.lock && Cow.c13584498 == Cow.c1 && Cow._lock3584498 == Cow._lock && lock3584498 == lock && t3584498 == t && c3584498 == c && this3584498 == this && tid3584498 == tid;
 assume $recorded.state3584498 == 1;                                                                
                                                                                                    
 // 32.9: while (true)   {                                                                          
                                                                                                    
 phase3584498 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (26.5): Bad tid
  invariant isSharedAssignable(Cow._state[c]);                                                             // (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
  invariant isShared(Cow._state[this]);                                                                    // (26.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                
  invariant (forall _this : Cow :: Invariant.Y_Cow.lock(tid : Tid, _this, Cow.lock[_this] ,Cow._state3584498,Cow.lock3584498,Cow.c13584498,Cow._lock3584498));       // (32.9): Loop does not preserve yields_as annotation for field lock
  invariant (forall _this : Cow :: Invariant.Y_Cow.c1(tid : Tid, _this, Cow.c1[_this] ,Cow._state3584498,Cow.lock3584498,Cow.c13584498,Cow._lock3584498));       // (32.9): Loop does not preserve yields_as annotation for field c1
  invariant phase3584498 == $pc;                                                                           // (32.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (32.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  assume Cow._state3584498_bottom == Cow._state && Cow.lock3584498_bottom == Cow.lock && Cow.c13584498_bottom == Cow.c1 && Cow._lock3584498_bottom == Cow._lock && lock3584498_bottom == lock && t3584498_bottom == t && c3584498_bottom == c && this3584498_bottom == this && tid3584498_bottom == tid;
  assume $recorded.state3584498_bottom == 1;                                                        
  assert phase3584498 == $pc;                                                                              // (32.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 26.27: // return;                                                                               
                                                                                                    
 assume Cow._state3584499 == Cow._state && Cow.lock3584499 == Cow.lock && Cow.c13584499 == Cow.c1 && Cow._lock3584499 == Cow._lock && lock3584499 == lock && t3584499 == t && c3584499 == c && this3584499 == this && tid3584499 == tid;
 assume $recorded.state3584499 == 1;                                                                
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
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures Y(tid , old(Cow._state), old(Cow.lock), old(Cow.c1), old(Cow._lock) , Cow._state, Cow.lock, Cow.c1, Cow._lock);
                                                                                                    
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
                                                                                                    
                                                                                                    
// 652.1-812.2: (Method:7.5)
// 660.1-660.24: (7.5): Bad tid
// 661.1-661.44: (7.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 662.1-662.37: (7.5): this is not global
// 728.2-730.2: (class anchor.sink.VarDeclStmt:8.9)
// 731.2-733.2: (class anchor.sink.VarDeclStmt:9.9)
// 734.2-751.25: (class anchor.sink.Read:9.9)
// 746.1-746.27: (9.9): Cannot have potential null deference in left-mover part.
// 750.1-750.27: (9.9): Reduction failure
// 755.1-755.27: (10.22): Cannot have potential null deference in left-mover part.
// 759.1-759.27: (10.22): Reduction failure
// 761.2-778.20: (class anchor.sink.Read:11.13)
// 773.1-773.27: (11.13): Cannot have potential null deference in left-mover part.
// 777.1-777.27: (11.13): Reduction failure
// 782.1-782.27: (12.9): Cannot have potential null deference in left-mover part.
// 784.1-784.32: (12.9): lock not held
// 786.1-786.27: (12.9): Reduction failure
// 788.2-805.17: (class anchor.sink.Read:13.9)
// 800.1-800.24: (13.9): Cannot have potential null deference in left-mover part.
// 804.1-804.27: (13.9): Reduction failure
// 806.2-811.9: (class anchor.sink.Return:7.26)
// 813.1-1004.2: (Method:16.5)
// 821.1-821.24: (16.5): Bad tid
// 822.1-822.44: (16.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 823.1-823.37: (16.5): this is not global
// 911.2-913.2: (class anchor.sink.VarDeclStmt:17.9)
// 914.2-916.2: (class anchor.sink.VarDeclStmt:18.9)
// 917.2-934.25: (class anchor.sink.Read:18.9)
// 929.1-929.27: (18.9): Cannot have potential null deference in left-mover part.
// 933.1-933.27: (18.9): Reduction failure
// 938.1-938.27: (19.22): Cannot have potential null deference in left-mover part.
// 942.1-942.27: (19.22): Reduction failure
// 944.2-961.20: (class anchor.sink.Read:20.13)
// 956.1-956.27: (20.13): Cannot have potential null deference in left-mover part.
// 960.1-960.27: (20.13): Reduction failure
// 965.1-965.27: (21.9): Cannot have potential null deference in left-mover part.
// 967.1-967.32: (21.9): lock not held
// 969.1-969.27: (21.9): Reduction failure
// 971.2-979.42: (class anchor.sink.Yield:22.9)
// 980.2-997.17: (class anchor.sink.Read:23.9)
// 992.1-992.24: (23.9): Cannot have potential null deference in left-mover part.
// 996.1-996.27: (23.9): Reduction failure
// 998.2-1003.9: (class anchor.sink.Return:16.27)
// 1005.1-1178.2: (Method:26.5)
// 1013.1-1013.24: (26.5): Bad tid
// 1014.1-1014.44: (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 1015.1-1015.37: (26.5): this is not global
// 1090.2-1092.2: (class anchor.sink.VarDeclStmt:27.9)
// 1093.2-1095.2: (class anchor.sink.VarDeclStmt:28.9)
// 1096.2-1113.25: (class anchor.sink.Read:28.9)
// 1108.1-1108.27: (28.9): Cannot have potential null deference in left-mover part.
// 1112.1-1112.27: (28.9): Reduction failure
// 1117.1-1117.27: (29.22): Cannot have potential null deference in left-mover part.
// 1121.1-1121.27: (29.22): Reduction failure
// 1123.2-1140.20: (class anchor.sink.Read:30.13)
// 1135.1-1135.27: (30.13): Cannot have potential null deference in left-mover part.
// 1139.1-1139.27: (30.13): Reduction failure
// 1144.1-1144.27: (31.9): Cannot have potential null deference in left-mover part.
// 1146.1-1146.32: (31.9): lock not held
// 1148.1-1148.27: (31.9): Reduction failure
// 1152.2-1156.14: (class anchor.sink.While:32.9)
// 1158.1-1158.27: (26.5): Bad tid
// 1159.1-1159.47: (26.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 1160.1-1160.40: (26.5): this is not global
// 1163.1-1163.159: (32.9): Loop does not preserve yields_as annotation for field lock
// 1164.1-1164.155: (32.9): Loop does not preserve yields_as annotation for field c1
// 1165.1-1165.33: (32.9): Phase must be invariant at loop head
// 1166.1-1166.30: (32.9): Potentially infinite loop cannot be in post-commit phase.
// 1170.1-1170.30: (32.9): Phase must be invariant at loop head
// 1172.2-1177.9: (class anchor.sink.Return:26.27)
// 1256.1-1256.34: (4.5): Cow.lock failed Write-Write Right-Mover Check
// 1315.1-1315.30: (4.5): Cow.lock failed Write-Read Right-Mover Check
// 1378.1-1378.34: (4.5): Cow.lock failed Write-Write Left-Mover Check
// 1438.1-1438.30: (4.5): Cow.lock failed Write-Read Left-Mover Check
// 1495.1-1495.34: (4.5): Cow.lock failed Read-Write Right-Mover Check
// 1555.1-1555.34: (4.5): Cow.lock failed Read-Write Left-Mover Check
// 1614.1-1614.34: (5.5): Cow.c1 failed Write-Write Right-Mover Check
// 1673.1-1673.30: (5.5): Cow.c1 failed Write-Read Right-Mover Check
// 1736.1-1736.34: (5.5): Cow.c1 failed Write-Write Left-Mover Check
// 1796.1-1796.30: (5.5): Cow.c1 failed Write-Read Left-Mover Check
// 1853.1-1853.34: (5.5): Cow.c1 failed Read-Write Right-Mover Check
// 1913.1-1913.34: (5.5): Cow.c1 failed Read-Write Left-Mover Check
// 1984.1-1984.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.1)
// 1985.1-1985.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.2)
// 1986.1-1986.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.3)
// 2082.1-2082.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case C)
// 2183.1-2183.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case D)
// 2184.1-2184.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case R)
// 2255.1-2255.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case F)
// 2256.1-2256.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case H)
// 2257.1-2257.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case I)
// 2327.1-2327.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case J)
// 2328.1-2328.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case K)
// 2329.1-2329.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case L)
// 2401.1-2401.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.1)
// 2402.1-2402.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.2)
// 2403.1-2403.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.3)
// 2499.1-2499.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case C)
// 2600.1-2600.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case D)
// 2601.1-2601.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case R)
// 2672.1-2672.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case F)
// 2673.1-2673.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case H)
// 2674.1-2674.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case I)
// 2744.1-2744.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case J)
// 2745.1-2745.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case K)
// 2746.1-2746.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case L)
// 2818.1-2818.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 2819.1-2819.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 2820.1-2820.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 2916.1-2916.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case C)
// 3017.1-3017.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case D)
// 3018.1-3018.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case R)
// 3089.1-3089.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case F)
// 3090.1-3090.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case H)
// 3091.1-3091.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case I)
// 3161.1-3161.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case J)
// 3162.1-3162.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case K)
// 3163.1-3163.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case L)
// 3235.1-3235.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 3236.1-3236.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 3237.1-3237.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 3333.1-3333.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
// 3434.1-3434.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
// 3435.1-3435.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
// 3506.1-3506.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
// 3507.1-3507.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
// 3508.1-3508.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
// 3578.1-3578.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
// 3579.1-3579.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
// 3580.1-3580.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
// 3612.1-3632.2: (4.5): yields_as clause for Cow.lock is not valid
// 3637.1-3652.2: (4.5): yields_as clause for Cow.lock is not reflexive
// 3658.1-3688.2: (4.5): yields_as clause for Cow.lock is not transitive
// 3707.1-3727.2: (5.5): yields_as clause for Cow.c1 is not valid
// 3732.1-3747.2: (5.5): yields_as clause for Cow.c1 is not reflexive
// 3753.1-3783.2: (5.5): yields_as clause for Cow.c1 is not transitive
// 3803.1-3823.2: (7.32): yields_as clause for Cow._lock is not valid
// 3828.1-3843.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3849.1-3879.2: (7.32): yields_as clause for Cow._lock is not transitive
