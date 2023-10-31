                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reduction-check-guarded-by.sink:        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        synchronized (this) {                                                                       
          t := c.c1;                                                                                
          t := this.c1;                                                                             
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        synchronized (this) {                                                                       
          t := c.c1;                                                                                
          t := this.c1;                                                                             
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this != c;                                                                           
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        synchronized (this) {                                                                       
          synchronized (c) {                                                                        
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this != c;                                                                           
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            {                                                                                       
              acquire(c);                                                                           
              {                                                                                     
                t := c.c1;                                                                          
                t := this.c1;                                                                       
              }                                                                                     
              release(c);                                                                           
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this != c;                                                                           
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            {                                                                                       
              acquire(c);                                                                           
              {                                                                                     
                t := c.c1;                                                                          
                t := this.c1;                                                                       
              }                                                                                     
              release(c);                                                                           
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this != c;                                                                           
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3(Cow c) {                                                                       
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            {                                                                                       
              acquire(c);                                                                           
              {                                                                                     
                t := c.c1;                                                                          
                t := this.c1;                                                                       
              }                                                                                     
              release(c);                                                                           
            }                                                                                       
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
                                                                                                    
                                                                                                    
/*** Class Decl Cow ***/                                                                            
                                                                                                    
type Cow;                                                                                           
const unique Cow.null: Cow;                                                                         
var Cow._state: [Cow]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.c1: [Cow]int;                                                                               
                                                                                                    
function {:inline} ReadEval.Cow.c1(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.c1(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (6.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
                                                                                                    
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
{                                                                                                   
 var t3594491: int;                                                                                 
 var Cow._lock3594496: [Cow]Tid;                                                                    
 var moverPath3594488: MoverPath;                                                                   
 var $pc3594488: Phase;                                                                             
 var c3594491: Cow;                                                                                 
 var c3594488: Cow;                                                                                 
 var Cow._lock3594491: [Cow]Tid;                                                                    
 var Cow._lock3594488: [Cow]Tid;                                                                    
 var path3594488: int;                                                                              
 var tid3594491: Tid;                                                                               
 var t3594488: int;                                                                                 
 var $recorded.state3594488: int;                                                                   
 var tid3594496: Tid;                                                                               
 var Cow._state3594491: [Cow]State;                                                                 
 var Cow._state3594488: [Cow]State;                                                                 
 var this3594488: Cow;                                                                              
 var mover3594491: Mover;                                                                           
 var $recorded.state3594496: int;                                                                   
 var moverPath3594491: MoverPath;                                                                   
 var this3594491: Cow;                                                                              
 var Cow._state3594496: [Cow]State;                                                                 
 var Cow.c13594496: [Cow]int;                                                                       
 var $pc3594496: Phase;                                                                             
 var this3594496: Cow;                                                                              
 var tid3594488: Tid;                                                                               
 var Cow.c13594491: [Cow]int;                                                                       
 var t: int;                                                                                        
 var $pc3594491: Phase;                                                                             
 var $recorded.state3594491: int;                                                                   
 var c: Cow;                                                                                        
 var t3594496: int;                                                                                 
 var c3594496: Cow;                                                                                 
 var path3594491: int;                                                                              
 var Cow.c13594488: [Cow]int;                                                                       
 var mover3594488: Mover;                                                                           
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.9: Cow c;                                                                                     
                                                                                                    
                                                                                                    
 // 7.9: c = new Cow();                                                                             
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.c1[c]  == 0;                                                                            
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 8.9: int t;                                                                                     
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (9.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 10.13: t := c.c1;                                                                               
                                                                                                    
                                                                                                    
 moverPath3594488 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.c1,Cow._lock);                  
 mover3594488 := m#moverPath(moverPath3594488);                                                     
 path3594488 := p#moverPath(moverPath3594488);                                                      
 assume Cow._state3594488 == Cow._state && Cow.c13594488 == Cow.c1 && Cow._lock3594488 == Cow._lock && t3594488 == t && c3594488 == c && this3594488 == this && tid3594488 == tid && $pc3594488 == $pc;
 assume $recorded.state3594488 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (10.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594488);                                                              
 assert $pc != PhaseError;                                                                                 // (10.13): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 11.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3594491 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock);               
 mover3594491 := m#moverPath(moverPath3594491);                                                     
 path3594491 := p#moverPath(moverPath3594491);                                                      
 assume Cow._state3594491 == Cow._state && Cow.c13594491 == Cow.c1 && Cow._lock3594491 == Cow._lock && t3594491 == t && c3594491 == c && this3594491 == this && tid3594491 == tid && $pc3594491 == $pc;
 assume $recorded.state3594491 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (11.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594491);                                                              
 assert $pc != PhaseError;                                                                                 // (11.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (12.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (12.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 6.21: // return;                                                                                
                                                                                                    
 assume Cow._state3594496 == Cow._state && Cow.c13594496 == Cow.c1 && Cow._lock3594496 == Cow._lock && t3594496 == t && c3594496 == c && this3594496 == this && tid3594496 == tid;
 assume $recorded.state3594496 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow, c : Cow)                                                     
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.5): Bad tid
requires isSharedAssignable(Cow._state[c]);                                                                // (15.5): Parameter VarDecl(ClassType(Cow),c) is not global
requires isShared(Cow._state[this]);                                                                       // (15.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
                                                                                                    
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
{                                                                                                   
 var Cow._lock3594510: [Cow]Tid;                                                                    
 var Cow.c13594510: [Cow]int;                                                                       
 var $recorded.state3594510: int;                                                                   
 var Cow._state3594507: [Cow]State;                                                                 
 var Cow._lock3594507: [Cow]Tid;                                                                    
 var c3594515: Cow;                                                                                 
 var Cow.c13594515: [Cow]int;                                                                       
 var this3594510: Cow;                                                                              
 var this3594507: Cow;                                                                              
 var c3594510: Cow;                                                                                 
 var t3594515: int;                                                                                 
 var moverPath3594507: MoverPath;                                                                   
 var $pc3594507: Phase;                                                                             
 var Cow._lock3594515: [Cow]Tid;                                                                    
 var this3594515: Cow;                                                                              
 var moverPath3594510: MoverPath;                                                                   
 var mover3594507: Mover;                                                                           
 var t3594507: int;                                                                                 
 var $recorded.state3594515: int;                                                                   
 var c3594507: Cow;                                                                                 
 var Cow._state3594515: [Cow]State;                                                                 
 var tid3594507: Tid;                                                                               
 var tid3594515: Tid;                                                                               
 var $recorded.state3594507: int;                                                                   
 var t3594510: int;                                                                                 
 var $pc3594515: Phase;                                                                             
 var tid3594510: Tid;                                                                               
 var $pc3594510: Phase;                                                                             
 var t: int;                                                                                        
 var path3594510: int;                                                                              
 var mover3594510: Mover;                                                                           
 var path3594507: int;                                                                              
 var Cow.c13594507: [Cow]int;                                                                       
 var Cow._state3594510: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 16.9: int t;                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (17.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (17.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 18.13: t := c.c1;                                                                               
                                                                                                    
                                                                                                    
 moverPath3594507 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.c1,Cow._lock);                  
 mover3594507 := m#moverPath(moverPath3594507);                                                     
 path3594507 := p#moverPath(moverPath3594507);                                                      
 assume Cow._state3594507 == Cow._state && Cow.c13594507 == Cow.c1 && Cow._lock3594507 == Cow._lock && t3594507 == t && c3594507 == c && this3594507 == this && tid3594507 == tid && $pc3594507 == $pc;
 assume $recorded.state3594507 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (18.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594507);                                                              
 assert $pc != PhaseError;                                                                                 // (18.13): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 19.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3594510 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock);               
 mover3594510 := m#moverPath(moverPath3594510);                                                     
 path3594510 := p#moverPath(moverPath3594510);                                                      
 assume Cow._state3594510 == Cow._state && Cow.c13594510 == Cow.c1 && Cow._lock3594510 == Cow._lock && t3594510 == t && c3594510 == c && this3594510 == this && tid3594510 == tid && $pc3594510 == $pc;
 assume $recorded.state3594510 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (19.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594510);                                                              
 assert $pc != PhaseError;                                                                                 // (19.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (20.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 15.27: // return;                                                                               
                                                                                                    
 assume Cow._state3594515 == Cow._state && Cow.c13594515 == Cow.c1 && Cow._lock3594515 == Cow._lock && t3594515 == t && c3594515 == c && this3594515 == this && tid3594515 == tid;
 assume $recorded.state3594515 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow, c : Cow)                                                     
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (23.5): Bad tid
requires isSharedAssignable(Cow._state[c]);                                                                // (23.5): Parameter VarDecl(ClassType(Cow),c) is not global
requires isShared(Cow._state[this]);                                                                       // (23.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
requires (this!=c);                                                                                 
                                                                                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
{                                                                                                   
 var Cow._state3594528: [Cow]State;                                                                 
 var tid3594540: Tid;                                                                               
 var $recorded.state3594528: int;                                                                   
 var this3594540: Cow;                                                                              
 var this3594531: Cow;                                                                              
 var $pc3594531: Phase;                                                                             
 var c3594528: Cow;                                                                                 
 var t3594531: int;                                                                                 
 var mover3594528: Mover;                                                                           
 var moverPath3594528: MoverPath;                                                                   
 var Cow.c13594531: [Cow]int;                                                                       
 var path3594531: int;                                                                              
 var moverPath3594531: MoverPath;                                                                   
 var t3594540: int;                                                                                 
 var c3594540: Cow;                                                                                 
 var path3594528: int;                                                                              
 var this3594528: Cow;                                                                              
 var Cow.c13594540: [Cow]int;                                                                       
 var Cow._lock3594531: [Cow]Tid;                                                                    
 var $pc3594540: Phase;                                                                             
 var Cow._state3594531: [Cow]State;                                                                 
 var tid3594531: Tid;                                                                               
 var mover3594531: Mover;                                                                           
 var $pc3594528: Phase;                                                                             
 var Cow._state3594540: [Cow]State;                                                                 
 var t: int;                                                                                        
 var tid3594528: Tid;                                                                               
 var Cow._lock3594540: [Cow]Tid;                                                                    
 var t3594528: int;                                                                                 
 var c3594531: Cow;                                                                                 
 var $recorded.state3594540: int;                                                                   
 var Cow.c13594528: [Cow]int;                                                                       
 var $recorded.state3594531: int;                                                                   
 var Cow._lock3594528: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (23.19): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 25.9: int t;                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (26.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (26.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (27.26): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[c] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (27.26): Reduction failure
 Cow._lock[c] := tid;                                                                               
                                                                                                    
 // 28.17: t := c.c1;                                                                               
                                                                                                    
                                                                                                    
 moverPath3594528 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.c1,Cow._lock);                  
 mover3594528 := m#moverPath(moverPath3594528);                                                     
 path3594528 := p#moverPath(moverPath3594528);                                                      
 assume Cow._state3594528 == Cow._state && Cow.c13594528 == Cow.c1 && Cow._lock3594528 == Cow._lock && t3594528 == t && c3594528 == c && this3594528 == this && tid3594528 == tid && $pc3594528 == $pc;
 assume $recorded.state3594528 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (28.17): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594528);                                                              
 assert $pc != PhaseError;                                                                                 // (28.17): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 29.17: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3594531 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock);               
 mover3594531 := m#moverPath(moverPath3594531);                                                     
 path3594531 := p#moverPath(moverPath3594531);                                                      
 assume Cow._state3594531 == Cow._state && Cow.c13594531 == Cow.c1 && Cow._lock3594531 == Cow._lock && t3594531 == t && c3594531 == c && this3594531 == this && tid3594531 == tid && $pc3594531 == $pc;
 assume $recorded.state3594531 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (29.17): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3594531);                                                              
 assert $pc != PhaseError;                                                                                 // (29.17): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (30.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[c] == tid;                                                                               // (30.13): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (30.13): Reduction failure
 Cow._lock[c] := Tid.null;                                                                          
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (31.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (31.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (31.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 24.27: // return;                                                                               
                                                                                                    
 assume Cow._state3594540 == Cow._state && Cow.c13594540 == Cow.c1 && Cow._lock3594540 == Cow._lock && t3594540 == t && c3594540 == c && this3594540 == this && tid3594540 == tid;
 assume $recorded.state3594540 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)               
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.c1 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.c1 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                     
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.c1[x];                                                                             
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)   
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_mid == Cow._state && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[y] := w;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                        
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.c1,Cow._lock);                        
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
ensures Y(tid , old(Cow._state), old(Cow.c1), old(Cow._lock) , Cow._state, Cow.c1, Cow._lock);      
                                                                                                    
// Cow.c1:                                                                                          
                                                                                                    
function {:inline} Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _R)) ==> (Cow.c1[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.c1(u: Tid,this: Cow,newValue: int,Cow._state,Cow.c1,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, Cow.c1[this] , Cow._state, Cow.c1, Cow._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires StateInvariant(Cow._state_p, Cow.c1_p, Cow._lock_p);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
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
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.c1, Cow._lock , Cow._state_p, Cow.c1_p, Cow._lock_p);               
 assume Y_Cow.c1(tid, this, newValue , Cow._state_p, Cow.c1_p, Cow._lock_p);                        
assume Cow._state_post == Cow._state_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                              
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
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
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.c1,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _N);   
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                           
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.c1, Cow._lock);                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires StateInvariant(Cow._state_p, Cow.c1_p, Cow._lock_p);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
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
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.c1, Cow._lock , Cow._state_p, Cow.c1_p, Cow._lock_p);               
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.c1_p, Cow._lock_p);                     
assume Cow._state_post == Cow._state_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                           
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.c1(tid : Tid, this, Cow.c1_p[this] , Cow._state, Cow.c1, Cow._lock))    
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.c1, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 596.1-724.2: (Method:6.5)
// 603.1-603.24: (6.5): Bad tid
// 604.1-604.37: (6.5): this is not global
// 650.2-652.2: (class anchor.sink.VarDeclStmt:7.9)
// 653.2-660.35: (class anchor.sink.Alloc:7.9)
// 661.2-663.2: (class anchor.sink.VarDeclStmt:8.9)
// 667.1-667.27: (9.22): Cannot have potential null deference in left-mover part.
// 671.1-671.27: (9.22): Reduction failure
// 673.2-690.17: (class anchor.sink.Read:10.13)
// 685.1-685.24: (10.13): Cannot have potential null deference in left-mover part.
// 689.1-689.27: (10.13): Reduction failure
// 691.2-708.20: (class anchor.sink.Read:11.13)
// 703.1-703.27: (11.13): Cannot have potential null deference in left-mover part.
// 707.1-707.27: (11.13): Reduction failure
// 712.1-712.27: (12.9): Cannot have potential null deference in left-mover part.
// 714.1-714.32: (12.9): lock not held
// 716.1-716.27: (12.9): Reduction failure
// 718.2-723.9: (class anchor.sink.Return:6.21)
// 725.1-842.2: (Method:15.5)
// 732.1-732.24: (15.5): Bad tid
// 733.1-733.44: (15.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 734.1-734.37: (15.5): this is not global
// 779.2-781.2: (class anchor.sink.VarDeclStmt:16.9)
// 785.1-785.27: (17.22): Cannot have potential null deference in left-mover part.
// 789.1-789.27: (17.22): Reduction failure
// 791.2-808.17: (class anchor.sink.Read:18.13)
// 803.1-803.24: (18.13): Cannot have potential null deference in left-mover part.
// 807.1-807.27: (18.13): Reduction failure
// 809.2-826.20: (class anchor.sink.Read:19.13)
// 821.1-821.27: (19.13): Cannot have potential null deference in left-mover part.
// 825.1-825.27: (19.13): Reduction failure
// 830.1-830.27: (20.9): Cannot have potential null deference in left-mover part.
// 832.1-832.32: (20.9): lock not held
// 834.1-834.27: (20.9): Reduction failure
// 836.2-841.9: (class anchor.sink.Return:15.27)
// 843.1-981.2: (Method:23.5)
// 850.1-850.24: (23.5): Bad tid
// 851.1-851.44: (23.5): Parameter VarDecl(ClassType(Cow),c) is not global
// 852.1-852.37: (23.5): this is not global
// 898.1-898.14: (23.19): Can only have right-mover memory accesses in requires clause
// 900.2-902.2: (class anchor.sink.VarDeclStmt:25.9)
// 906.1-906.27: (26.22): Cannot have potential null deference in left-mover part.
// 910.1-910.27: (26.22): Reduction failure
// 915.1-915.24: (27.26): Cannot have potential null deference in left-mover part.
// 919.1-919.27: (27.26): Reduction failure
// 921.2-938.17: (class anchor.sink.Read:28.17)
// 933.1-933.24: (28.17): Cannot have potential null deference in left-mover part.
// 937.1-937.27: (28.17): Reduction failure
// 939.2-956.20: (class anchor.sink.Read:29.17)
// 951.1-951.27: (29.17): Cannot have potential null deference in left-mover part.
// 955.1-955.27: (29.17): Reduction failure
// 960.1-960.24: (30.13): Cannot have potential null deference in left-mover part.
// 962.1-962.29: (30.13): lock not held
// 964.1-964.27: (30.13): Reduction failure
// 969.1-969.27: (31.9): Cannot have potential null deference in left-mover part.
// 971.1-971.32: (31.9): lock not held
// 973.1-973.27: (31.9): Reduction failure
// 975.2-980.9: (class anchor.sink.Return:24.27)
// 1055.1-1055.34: (4.5): Cow.c1 failed Write-Write Right-Mover Check
// 1112.1-1112.30: (4.5): Cow.c1 failed Write-Read Right-Mover Check
// 1173.1-1173.34: (4.5): Cow.c1 failed Write-Write Left-Mover Check
// 1231.1-1231.30: (4.5): Cow.c1 failed Write-Read Left-Mover Check
// 1286.1-1286.34: (4.5): Cow.c1 failed Read-Write Right-Mover Check
// 1344.1-1344.34: (4.5): Cow.c1 failed Read-Write Left-Mover Check
// 1413.1-1413.140: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 1414.1-1414.101: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 1415.1-1415.158: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 1508.1-1508.140: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
// 1606.1-1606.144: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
// 1607.1-1607.144: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
// 1676.1-1676.136: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
// 1677.1-1677.136: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
// 1678.1-1678.146: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
// 1746.1-1746.136: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
// 1747.1-1747.136: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
// 1748.1-1748.99: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
// 1779.1-1798.2: (4.5): yields_as clause for Cow.c1 is not valid
// 1803.1-1817.2: (4.5): yields_as clause for Cow.c1 is not reflexive
// 1823.1-1851.2: (4.5): yields_as clause for Cow.c1 is not transitive
// 1871.1-1890.2: (7.32): yields_as clause for Cow._lock is not valid
// 1895.1-1909.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 1915.1-1943.2: (7.32): yields_as clause for Cow._lock is not transitive
