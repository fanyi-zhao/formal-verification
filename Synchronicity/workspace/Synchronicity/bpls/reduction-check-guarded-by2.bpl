                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reduction-check-guarded-by2.sink:       
                                                                                                    
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
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.lock := this;                                                                             
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        synchronized (lock) {                                                                       
          t := c.c1;                                                                                
          t := this.c1;                                                                             
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
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.lock := this;                                                                             
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
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
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.lock := this;                                                                             
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
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
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.lock := this;                                                                             
        Cow lock;                                                                                   
        lock := this.lock;                                                                          
        {                                                                                           
          acquire(lock);                                                                            
          {                                                                                         
            t := c.c1;                                                                              
            t := this.c1;                                                                           
          }                                                                                         
          release(lock);                                                                            
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
                                                                                                    
function {:inline} Invariant.Cow.3597461(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.lock: [Cow]Cow,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
 (Cow.lock[this]!=Cow.null)                                                                         
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                   
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.5): Object invariant may not hold.
{                                                                                                   
 var moverPath3597610: MoverPath;                                                                   
 var Cow._lock3597605: [Cow]Tid;                                                                    
 var t3597599: int;                                                                                 
 var Cow.c13597610: [Cow]int;                                                                       
 var tid3597613: Tid;                                                                               
 var Cow._lock3597599: [Cow]Tid;                                                                    
 var path3597599: int;                                                                              
 var t3597605: int;                                                                                 
 var this3597599: Cow;                                                                              
 var $pc3597610: Phase;                                                                             
 var Cow.c13597613: [Cow]int;                                                                       
 var Cow.lock3597618: [Cow]Cow;                                                                     
 var c3597599: Cow;                                                                                 
 var mover3597599: Mover;                                                                           
 var t3597613: int;                                                                                 
 var tid3597599: Tid;                                                                               
 var path3597605: int;                                                                              
 var $pc3597618: Phase;                                                                             
 var $pc3597599: Phase;                                                                             
 var lock3597613: Cow;                                                                              
 var Cow.lock3597613: [Cow]Cow;                                                                     
 var Cow._state3597610: [Cow]State;                                                                 
 var c3597613: Cow;                                                                                 
 var lock3597605: Cow;                                                                              
 var c3597610: Cow;                                                                                 
 var this3597610: Cow;                                                                              
 var Cow._lock3597613: [Cow]Tid;                                                                    
 var $recorded.state3597613: int;                                                                   
 var moverPath3597599: MoverPath;                                                                   
 var mover3597605: Mover;                                                                           
 var mover3597610: Mover;                                                                           
 var $recorded.state3597610: int;                                                                   
 var mover3597613: Mover;                                                                           
 var moverPath3597605: MoverPath;                                                                   
 var moverPath3597613: MoverPath;                                                                   
 var lock3597618: Cow;                                                                              
 var Cow.c13597605: [Cow]int;                                                                       
 var this3597613: Cow;                                                                              
 var $pc3597605: Phase;                                                                             
 var path3597613: int;                                                                              
 var Cow.c13597618: [Cow]int;                                                                       
 var path3597610: int;                                                                              
 var Cow._lock3597610: [Cow]Tid;                                                                    
 var lock3597610: Cow;                                                                              
 var Cow._state3597605: [Cow]State;                                                                 
 var Cow._state3597613: [Cow]State;                                                                 
 var Cow.lock3597610: [Cow]Cow;                                                                     
 var lock: Cow;                                                                                     
 var t3597618: int;                                                                                 
 var tid3597610: Tid;                                                                               
 var t3597610: int;                                                                                 
 var $recorded.state3597605: int;                                                                   
 var this3597605: Cow;                                                                              
 var Cow._lock3597618: [Cow]Tid;                                                                    
 var Cow.c13597599: [Cow]int;                                                                       
 var t: int;                                                                                        
 var Cow.lock3597599: [Cow]Cow;                                                                     
 var tid3597605: Tid;                                                                               
 var $pc3597613: Phase;                                                                             
 var tid3597618: Tid;                                                                               
 var c3597605: Cow;                                                                                 
 var c: Cow;                                                                                        
 var $recorded.state3597599: int;                                                                   
 var c3597618: Cow;                                                                                 
 var Cow._state3597618: [Cow]State;                                                                 
 var Cow.lock3597605: [Cow]Cow;                                                                     
 var this3597618: Cow;                                                                              
 var $recorded.state3597618: int;                                                                   
 var Cow._state3597599: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: Cow c;                                                                                     
                                                                                                    
                                                                                                    
 // 8.9: c = new Cow();                                                                             
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.lock[c]  == Cow.null;                                                                   
 assume Cow.c1[c]  == 0;                                                                            
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 9.9: int t;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
 // 10.9: c.lock := this;                                                                           
                                                                                                    
                                                                                                    
 moverPath3597599 := WriteEval.Cow.lock(tid: Tid,c: Cow,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);
 mover3597599 := m#moverPath(moverPath3597599);                                                     
 path3597599 := p#moverPath(moverPath3597599);                                                      
 assume Cow._state3597599 == Cow._state && Cow.lock3597599 == Cow.lock && Cow.c13597599 == Cow.c1 && Cow._lock3597599 == Cow._lock && t3597599 == t && c3597599 == c && this3597599 == this && tid3597599 == tid && $pc3597599 == $pc;
 assume $recorded.state3597599 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (10.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3597599);                                                              
 assert $pc != PhaseError;                                                                                 // (10.9): Reduction failure
 Cow.lock[c] := this;                                                                               
 if (isLocal(Cow._state[this], tid)) {                                                              
  Cow._state[this] := SHARED();                                                                     
  assert isSharedAssignable(Cow._state[Cow.lock[this]]);                                                   // (10.9): this became shared, but this.lock may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 11.9: Cow lock;                                                                                 
                                                                                                    
                                                                                                    
 // 11.9: lock := this.lock;                                                                        
                                                                                                    
                                                                                                    
 moverPath3597605 := ReadEval.Cow.lock(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);    
 mover3597605 := m#moverPath(moverPath3597605);                                                     
 path3597605 := p#moverPath(moverPath3597605);                                                      
 assume Cow._state3597605 == Cow._state && Cow.lock3597605 == Cow.lock && Cow.c13597605 == Cow.c1 && Cow._lock3597605 == Cow._lock && lock3597605 == lock && t3597605 == t && c3597605 == c && this3597605 == this && tid3597605 == tid && $pc3597605 == $pc;
 assume $recorded.state3597605 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3597605);                                                              
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 lock := Cow.lock[this];                                                                            
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (12.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[lock] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.22): Reduction failure
 Cow._lock[lock] := tid;                                                                            
                                                                                                    
 // 13.13: t := c.c1;                                                                               
                                                                                                    
                                                                                                    
 moverPath3597610 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);         
 mover3597610 := m#moverPath(moverPath3597610);                                                     
 path3597610 := p#moverPath(moverPath3597610);                                                      
 assume Cow._state3597610 == Cow._state && Cow.lock3597610 == Cow.lock && Cow.c13597610 == Cow.c1 && Cow._lock3597610 == Cow._lock && lock3597610 == lock && t3597610 == t && c3597610 == c && this3597610 == this && tid3597610 == tid && $pc3597610 == $pc;
 assume $recorded.state3597610 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (13.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3597610);                                                              
 assert $pc != PhaseError;                                                                                 // (13.13): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 14.13: t := this.c1;                                                                            
                                                                                                    
                                                                                                    
 moverPath3597613 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock);      
 mover3597613 := m#moverPath(moverPath3597613);                                                     
 path3597613 := p#moverPath(moverPath3597613);                                                      
 assume Cow._state3597613 == Cow._state && Cow.lock3597613 == Cow.lock && Cow.c13597613 == Cow.c1 && Cow._lock3597613 == Cow._lock && lock3597613 == lock && t3597613 == t && c3597613 == c && this3597613 == this && tid3597613 == tid && $pc3597613 == $pc;
 assume $recorded.state3597613 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (14.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3597613);                                                              
 assert $pc != PhaseError;                                                                                 // (14.13): Reduction failure
 t := Cow.c1[this];                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume lock != Cow.null;                                                                          
 } else {                                                                                           
  assert lock != Cow.null;                                                                                 // (15.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[lock] == tid;                                                                            // (15.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (15.9): Reduction failure
 Cow._lock[lock] := Tid.null;                                                                       
                                                                                                    
 // 7.21: // return;                                                                                
                                                                                                    
 assume Cow._state3597618 == Cow._state && Cow.lock3597618 == Cow.lock && Cow.c13597618 == Cow.c1 && Cow._lock3597618 == Cow._lock && lock3597618 == lock && t3597618 == t && c3597618 == c && this3597618 == this && tid3597618 == tid;
 assume $recorded.state3597618 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (7.21): Object invariant may not hold.
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.lock;                                                                                  
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.lock, Cow.c1, Cow._lock);                                    
ensures Y(tid , old(Cow._state), old(Cow.lock), old(Cow.c1), old(Cow._lock) , Cow._state, Cow.lock, Cow.c1, Cow._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (4.14): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (5.12): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3597461(tid: Tid,_this : Cow,Cow._state,Cow.lock,Cow.c1,Cow._lock));       // (3.1): Object invariant may not hold.
                                                                                                    
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
                                                                                                    
                                                                                                    
// 502.1-713.2: (Method:7.5)
// 510.1-510.24: (7.5): Bad tid
// 511.1-511.37: (7.5): this is not global
// 514.1-514.188: (7.5): Object invariant may not hold.
// 517.1-517.187: (7.5): Object invariant may not hold.
// 593.2-595.2: (class anchor.sink.VarDeclStmt:8.9)
// 596.2-604.35: (class anchor.sink.Alloc:8.9)
// 605.2-607.2: (class anchor.sink.VarDeclStmt:9.9)
// 609.2-630.2: (class anchor.sink.Write:10.9)
// 621.1-621.24: (10.9): Cannot have potential null deference in left-mover part.
// 624.1-624.27: (10.9): Reduction failure
// 628.1-628.57: (10.9): this became shared, but this.lock may not be shared.
// 631.2-633.2: (class anchor.sink.VarDeclStmt:11.9)
// 634.2-651.25: (class anchor.sink.Read:11.9)
// 646.1-646.27: (11.9): Cannot have potential null deference in left-mover part.
// 650.1-650.27: (11.9): Reduction failure
// 655.1-655.27: (12.22): Cannot have potential null deference in left-mover part.
// 659.1-659.27: (12.22): Reduction failure
// 661.2-678.17: (class anchor.sink.Read:13.13)
// 673.1-673.24: (13.13): Cannot have potential null deference in left-mover part.
// 677.1-677.27: (13.13): Reduction failure
// 679.2-696.20: (class anchor.sink.Read:14.13)
// 691.1-691.27: (14.13): Cannot have potential null deference in left-mover part.
// 695.1-695.27: (14.13): Reduction failure
// 700.1-700.27: (15.9): Cannot have potential null deference in left-mover part.
// 702.1-702.32: (15.9): lock not held
// 704.1-704.27: (15.9): Reduction failure
// 706.2-712.9: (class anchor.sink.Return:7.21)
// 711.1-711.187: (7.21): Object invariant may not hold.
// 791.1-791.34: (4.5): Cow.lock failed Write-Write Right-Mover Check
// 850.1-850.30: (4.5): Cow.lock failed Write-Read Right-Mover Check
// 913.1-913.34: (4.5): Cow.lock failed Write-Write Left-Mover Check
// 973.1-973.30: (4.5): Cow.lock failed Write-Read Left-Mover Check
// 1030.1-1030.34: (4.5): Cow.lock failed Read-Write Right-Mover Check
// 1090.1-1090.34: (4.5): Cow.lock failed Read-Write Left-Mover Check
// 1149.1-1149.34: (5.5): Cow.c1 failed Write-Write Right-Mover Check
// 1208.1-1208.30: (5.5): Cow.c1 failed Write-Read Right-Mover Check
// 1271.1-1271.34: (5.5): Cow.c1 failed Write-Write Left-Mover Check
// 1331.1-1331.30: (5.5): Cow.c1 failed Write-Read Left-Mover Check
// 1388.1-1388.34: (5.5): Cow.c1 failed Read-Write Right-Mover Check
// 1448.1-1448.34: (5.5): Cow.c1 failed Read-Write Left-Mover Check
// 1519.1-1519.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.1)
// 1520.1-1520.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.2)
// 1521.1-1521.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case A.3)
// 1617.1-1617.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case C)
// 1718.1-1718.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case D)
// 1719.1-1719.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.lock (case R)
// 1790.1-1790.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case F)
// 1791.1-1791.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case H)
// 1792.1-1792.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.lock (case I)
// 1862.1-1862.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case J)
// 1863.1-1863.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case K)
// 1864.1-1864.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.lock (case L)
// 1936.1-1936.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.1)
// 1937.1-1937.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.2)
// 1938.1-1938.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case A.3)
// 2034.1-2034.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case C)
// 2135.1-2135.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case D)
// 2136.1-2136.144: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case R)
// 2207.1-2207.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case F)
// 2208.1-2208.136: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case H)
// 2209.1-2209.146: (4.5): Cow.lock is not Read-Write Stable with respect to Cow.c1 (case I)
// 2279.1-2279.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case J)
// 2280.1-2280.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case K)
// 2281.1-2281.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.lock (case L)
// 2353.1-2353.140: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 2354.1-2354.101: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 2355.1-2355.158: (4.5): Cow.lock is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 2451.1-2451.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case C)
// 2552.1-2552.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case D)
// 2553.1-2553.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.lock (case R)
// 2624.1-2624.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case F)
// 2625.1-2625.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case H)
// 2626.1-2626.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.lock (case I)
// 2696.1-2696.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case J)
// 2697.1-2697.136: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case K)
// 2698.1-2698.99: (4.5): Cow.lock is not Write-Read Stable with respect to Cow.c1 (case L)
// 2770.1-2770.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 2771.1-2771.101: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 2772.1-2772.158: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 2868.1-2868.140: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
// 2969.1-2969.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
// 2970.1-2970.144: (5.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
// 3041.1-3041.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
// 3042.1-3042.136: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
// 3043.1-3043.146: (5.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
// 3113.1-3113.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
// 3114.1-3114.136: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
// 3115.1-3115.99: (5.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
// 3122.1-3122.188: (<undefined position>): Object invariant may not hold.
// 3129.1-3129.187: (<undefined position>): Object invariant may not hold.
// 3149.1-3169.2: (4.5): yields_as clause for Cow.lock is not valid
// 3174.1-3189.2: (4.5): yields_as clause for Cow.lock is not reflexive
// 3195.1-3195.188: (4.14): Object invariant may not hold.
// 3196.1-3226.2: (4.5): yields_as clause for Cow.lock is not transitive
// 3245.1-3265.2: (5.5): yields_as clause for Cow.c1 is not valid
// 3270.1-3285.2: (5.5): yields_as clause for Cow.c1 is not reflexive
// 3291.1-3291.188: (5.12): Object invariant may not hold.
// 3292.1-3322.2: (5.5): yields_as clause for Cow.c1 is not transitive
// 3342.1-3362.2: (7.32): yields_as clause for Cow._lock is not valid
// 3367.1-3382.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3388.1-3388.188: (3.1): Object invariant may not hold.
// 3389.1-3419.2: (7.32): yields_as clause for Cow._lock is not transitive
