                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/lock-path-loop.sink:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y isRead ? B : E                                                                         
                                                                                                    
      invariant  this.y != Cow.null;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        while (true)   {                                                                            
          yield;                                                                                    
          Cow y;                                                                                    
          y := this.y;                                                                              
          synchronized (y) {                                                                        
                                                                                                    
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        while (true)   {                                                                            
          Cow y;                                                                                    
          y := this.y;                                                                              
          synchronized (y) {                                                                        
                                                                                                    
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y isRead ? B : E                                                                         
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.y != Cow.null;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        while (true)   {                                                                            
          yield;                                                                                    
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        while (true)   {                                                                            
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y isRead ? B : E                                                                         
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.y != Cow.null;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        while (true)   {                                                                            
          yield;                                                                                    
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        while (true)   {                                                                            
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y isRead ? B : E                                                                         
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.y != Cow.null;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        while (true)   {                                                                            
          yield;                                                                                    
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        while (true)   {                                                                            
          Cow y;                                                                                    
          y := this.y;                                                                              
          {                                                                                         
            acquire(y);                                                                             
            {                                                                                       
                                                                                                    
            }                                                                                       
            release(y);                                                                             
          }                                                                                         
          yield;                                                                                    
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
                                                                                                    
var Cow.x: [Cow]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.x(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(Cow._state[Cow.y[this]], tid) && Cow._lock[Cow.y[this]] == tid)) then            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.x(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Cow._state[Cow.y[this]], tid) && Cow._lock[Cow.y[this]] == tid)) then            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.y: [Cow]Cow;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.y(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.y(tid: Tid,this : Cow,newValue: Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} Invariant.Cow.2245264(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
 (Cow.y[this]!=Cow.null)                                                                            
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.2): Bad tid
requires isShared(Cow._state[this]);                                                                       // (6.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                       
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.2): Object invariant may not hold.
{                                                                                                   
 var this2245407_bottom: Cow;                                                                       
 var $recorded.state2245399: int;                                                                   
 var Cow.x2245407: [Cow]int;                                                                        
 var Cow.y2245407_bottom: [Cow]Cow;                                                                 
 var this2245408: Cow;                                                                              
 var _pc2245399: Phase;                                                                             
 var Cow._lock2245393_post: [Cow]Tid;                                                               
 var this2245407: Cow;                                                                              
 var this2245393: Cow;                                                                              
 var Cow._lock2245407: [Cow]Tid;                                                                    
 var Cow._lock2245399: [Cow]Tid;                                                                    
 var Cow.y2245393: [Cow]Cow;                                                                        
 var $recorded.state2245407_bottom: int;                                                            
 var $recorded.state2245408: int;                                                                   
 var y2245399: Cow;                                                                                 
 var tid2245407: Tid;                                                                               
 var _pc2245393_post: Phase;                                                                        
 var tid2245393: Tid;                                                                               
 var Cow.x2245393: [Cow]int;                                                                        
 var path2245399: int;                                                                              
 var tid2245408: Tid;                                                                               
 var Cow.x2245407_bottom: [Cow]int;                                                                 
 var Cow._lock2245408: [Cow]Tid;                                                                    
 var tid2245399: Tid;                                                                               
 var _pc2245407_bottom: Phase;                                                                      
 var _pc2245407: Phase;                                                                             
 var Cow._lock2245407_bottom: [Cow]Tid;                                                             
 var Cow.y2245408: [Cow]Cow;                                                                        
 var Cow.x2245393_post: [Cow]int;                                                                   
 var _pc2245393: Phase;                                                                             
 var this2245393_post: Cow;                                                                         
 var moverPath2245399: MoverPath;                                                                   
 var this2245399: Cow;                                                                              
 var Cow._state2245408: [Cow]State;                                                                 
 var Cow.x2245408: [Cow]int;                                                                        
 var _pc2245408: Phase;                                                                             
 var mover2245399: Mover;                                                                           
 var Cow._state2245407: [Cow]State;                                                                 
 var Cow.y2245399: [Cow]Cow;                                                                        
 var Cow.x2245399: [Cow]int;                                                                        
 var $recorded.state2245393: int;                                                                   
 var y: Cow;                                                                                        
 var Cow._state2245393_post: [Cow]State;                                                            
 var Cow._state2245407_bottom: [Cow]State;                                                          
 var Cow._state2245399: [Cow]State;                                                                 
 var $recorded.state2245393_post: int;                                                              
 var Cow.y2245407: [Cow]Cow;                                                                        
 var tid2245407_bottom: Tid;                                                                        
 var tid2245393_post: Tid;                                                                          
 var $recorded.state2245407: int;                                                                   
 var Cow.y2245393_post: [Cow]Cow;                                                                   
 var phase2245407: Phase;                                                                           
 var Cow._state2245393: [Cow]State;                                                                 
 var Cow._lock2245393: [Cow]Tid;                                                                    
                                                                                                    
 var _pc : Phase;                                                                                   
 _pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Cow._state2245407 == Cow._state && Cow.x2245407 == Cow.x && Cow.y2245407 == Cow.y && Cow._lock2245407 == Cow._lock && this2245407 == this && tid2245407 == tid;
 assume $recorded.state2245407 == 1;                                                                
                                                                                                    
 // 7.3: while (true)   {                                                                           
                                                                                                    
 phase2245407 := _pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (6.2): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (6.2): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                    
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (7.3): Object invariant may not hold.
  invariant phase2245407 == _pc;                                                                           // (7.3): Phase must be invariant at loop head
  invariant _pc == PreCommit;                                                                              // (7.3): Potentially infinite loop head cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 9.4: yield;                                                                                    
                                                                                                    
  assume Cow._state2245393 == Cow._state && Cow.x2245393 == Cow.x && Cow.y2245393 == Cow.y && Cow._lock2245393 == Cow._lock && this2245393 == this && tid2245393 == tid;
  assume $recorded.state2245393 == 1;                                                               
  assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (9.4): Object invariant may not hold.
  call Yield(tid);                                                                                  
  assume  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (9.4): Object invariant may not hold.
  _pc := PreCommit;                                                                                 
  assume Cow._state2245393_post == Cow._state && Cow.x2245393_post == Cow.x && Cow.y2245393_post == Cow.y && Cow._lock2245393_post == Cow._lock && this2245393_post == this && tid2245393_post == tid;
  assume $recorded.state2245393_post == 1;                                                          
                                                                                                    
  // 10.4: Cow y;                                                                                   
                                                                                                    
                                                                                                    
  // 10.4: y := this.y;                                                                             
                                                                                                    
                                                                                                    
  moverPath2245399 := ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);          
  mover2245399 := m#moverPath(moverPath2245399);                                                    
  path2245399 := p#moverPath(moverPath2245399);                                                     
  assume Cow._state2245399 == Cow._state && Cow.x2245399 == Cow.x && Cow.y2245399 == Cow.y && Cow._lock2245399 == Cow._lock && y2245399 == y && this2245399 == this && tid2245399 == tid && _pc2245399 == _pc;
  assume $recorded.state2245399 == 1;                                                               
  if (_pc == PreCommit) {                                                                           
   assume this != Cow.null;                                                                         
  } else {                                                                                          
   assert this != Cow.null;                                                                                // (10.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  _pc := transition(_pc, mover2245399);                                                             
  assert _pc != PhaseError;                                                                                // (10.4): Reduction failure
  y := Cow.y[this];                                                                                 
  if (_pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (11.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[y] == Tid.null;                                                                  
  _pc := transition(_pc, _R);                                                                       
  assert _pc != PhaseError;                                                                                // (11.17): Reduction failure
  Cow._lock[y] := tid;                                                                              
  if (_pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (12.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[y] == tid;                                                                              // (12.4): lock not held
  _pc := transition(_pc, _L);                                                                       
  assert _pc != PhaseError;                                                                                // (12.4): Reduction failure
  Cow._lock[y] := Tid.null;                                                                         
  assume Cow._state2245407_bottom == Cow._state && Cow.x2245407_bottom == Cow.x && Cow.y2245407_bottom == Cow.y && Cow._lock2245407_bottom == Cow._lock && this2245407_bottom == this && tid2245407_bottom == tid;
  assume $recorded.state2245407_bottom == 1;                                                        
  assert phase2245407 == _pc;                                                                              // (7.3): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 6.18: // return;                                                                                
                                                                                                    
 assume Cow._state2245408 == Cow._state && Cow.x2245408 == Cow.x && Cow.y2245408 == Cow.y && Cow._lock2245408 == Cow._lock && this2245408 == this && tid2245408 == tid;
 assume $recorded.state2245408 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.18): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (16.2): Bad tid
requires isShared(Cow._state[this]);                                                                       // (16.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                       
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (16.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (16.2): Object invariant may not hold.
{                                                                                                   
 var Cow.y2245426: [Cow]Cow;                                                                        
 var Cow.x2245424_post: [Cow]int;                                                                   
 var $recorded.state2245424: int;                                                                   
 var Cow._state2245426_bottom: [Cow]State;                                                          
 var y2245424_post: Cow;                                                                            
 var Cow._lock2245424_post: [Cow]Tid;                                                               
 var path2245417: int;                                                                              
 var Cow._lock2245427: [Cow]Tid;                                                                    
 var Cow.y2245427: [Cow]Cow;                                                                        
 var moverPath2245417: MoverPath;                                                                   
 var $recorded.state2245426_bottom: int;                                                            
 var $recorded.state2245424_post: int;                                                              
 var _pc2245424_post: Phase;                                                                        
 var phase2245426: Phase;                                                                           
 var Cow._lock2245417: [Cow]Tid;                                                                    
 var $recorded.state2245417: int;                                                                   
 var this2245424_post: Cow;                                                                         
 var _pc2245417: Phase;                                                                             
 var $recorded.state2245426: int;                                                                   
 var Cow.x2245426_bottom: [Cow]int;                                                                 
 var Cow._state2245424_post: [Cow]State;                                                            
 var this2245424: Cow;                                                                              
 var Cow.x2245424: [Cow]int;                                                                        
 var tid2245426_bottom: Tid;                                                                        
 var this2245427: Cow;                                                                              
 var y2245417: Cow;                                                                                 
 var Cow._state2245417: [Cow]State;                                                                 
 var Cow._lock2245426: [Cow]Tid;                                                                    
 var Cow._lock2245424: [Cow]Tid;                                                                    
 var this2245426_bottom: Cow;                                                                       
 var _pc2245426: Phase;                                                                             
 var _pc2245426_bottom: Phase;                                                                      
 var Cow._state2245424: [Cow]State;                                                                 
 var tid2245427: Tid;                                                                               
 var _pc2245427: Phase;                                                                             
 var Cow.y2245424: [Cow]Cow;                                                                        
 var Cow.y2245426_bottom: [Cow]Cow;                                                                 
 var Cow._lock2245426_bottom: [Cow]Tid;                                                             
 var tid2245424: Tid;                                                                               
 var tid2245424_post: Tid;                                                                          
 var Cow.x2245426: [Cow]int;                                                                        
 var Cow._state2245427: [Cow]State;                                                                 
 var Cow.x2245427: [Cow]int;                                                                        
 var this2245417: Cow;                                                                              
 var Cow.x2245417: [Cow]int;                                                                        
 var _pc2245424: Phase;                                                                             
 var $recorded.state2245427: int;                                                                   
 var y2245424: Cow;                                                                                 
 var y: Cow;                                                                                        
 var tid2245417: Tid;                                                                               
 var Cow.y2245424_post: [Cow]Cow;                                                                   
 var tid2245426: Tid;                                                                               
 var mover2245417: Mover;                                                                           
 var Cow._state2245426: [Cow]State;                                                                 
 var this2245426: Cow;                                                                              
 var Cow.y2245417: [Cow]Cow;                                                                        
                                                                                                    
 var _pc : Phase;                                                                                   
 _pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Cow._state2245426 == Cow._state && Cow.x2245426 == Cow.x && Cow.y2245426 == Cow.y && Cow._lock2245426 == Cow._lock && this2245426 == this && tid2245426 == tid;
 assume $recorded.state2245426 == 1;                                                                
                                                                                                    
 // 17.3: while (true)   {                                                                          
                                                                                                    
 phase2245426 := _pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (16.2): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (16.2): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                    
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (17.3): Object invariant may not hold.
  invariant phase2245426 == _pc;                                                                           // (17.3): Phase must be invariant at loop head
  invariant _pc == PreCommit;                                                                              // (17.3): Potentially infinite loop head cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 19.4: Cow y;                                                                                   
                                                                                                    
                                                                                                    
  // 19.4: y := this.y;                                                                             
                                                                                                    
                                                                                                    
  moverPath2245417 := ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);          
  mover2245417 := m#moverPath(moverPath2245417);                                                    
  path2245417 := p#moverPath(moverPath2245417);                                                     
  assume Cow._state2245417 == Cow._state && Cow.x2245417 == Cow.x && Cow.y2245417 == Cow.y && Cow._lock2245417 == Cow._lock && y2245417 == y && this2245417 == this && tid2245417 == tid && _pc2245417 == _pc;
  assume $recorded.state2245417 == 1;                                                               
  if (_pc == PreCommit) {                                                                           
   assume this != Cow.null;                                                                         
  } else {                                                                                          
   assert this != Cow.null;                                                                                // (19.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  _pc := transition(_pc, mover2245417);                                                             
  assert _pc != PhaseError;                                                                                // (19.4): Reduction failure
  y := Cow.y[this];                                                                                 
  if (_pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (20.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[y] == Tid.null;                                                                  
  _pc := transition(_pc, _R);                                                                       
  assert _pc != PhaseError;                                                                                // (20.17): Reduction failure
  Cow._lock[y] := tid;                                                                              
  if (_pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (21.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[y] == tid;                                                                              // (21.4): lock not held
  _pc := transition(_pc, _L);                                                                       
  assert _pc != PhaseError;                                                                                // (21.4): Reduction failure
  Cow._lock[y] := Tid.null;                                                                         
                                                                                                    
  // 22.4: yield;                                                                                   
                                                                                                    
  assume Cow._state2245424 == Cow._state && Cow.x2245424 == Cow.x && Cow.y2245424 == Cow.y && Cow._lock2245424 == Cow._lock && y2245424 == y && this2245424 == this && tid2245424 == tid;
  assume $recorded.state2245424 == 1;                                                               
  assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (22.4): Object invariant may not hold.
  call Yield(tid);                                                                                  
  assume  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (22.4): Object invariant may not hold.
  _pc := PreCommit;                                                                                 
  assume Cow._state2245424_post == Cow._state && Cow.x2245424_post == Cow.x && Cow.y2245424_post == Cow.y && Cow._lock2245424_post == Cow._lock && y2245424_post == y && this2245424_post == this && tid2245424_post == tid;
  assume $recorded.state2245424_post == 1;                                                          
  assume Cow._state2245426_bottom == Cow._state && Cow.x2245426_bottom == Cow.x && Cow.y2245426_bottom == Cow.y && Cow._lock2245426_bottom == Cow._lock && this2245426_bottom == this && tid2245426_bottom == tid;
  assume $recorded.state2245426_bottom == 1;                                                        
  assert phase2245426 == _pc;                                                                              // (17.3): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 16.19: // return;                                                                               
                                                                                                    
 assume Cow._state2245427 == Cow._state && Cow.x2245427 == Cow.x && Cow.y2245427 == Cow.y && Cow._lock2245427 == Cow._lock && this2245427 == this && tid2245427 == tid;
 assume $recorded.state2245427 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (16.19): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Cow :: { Cow._state[Cow.y[_i]] } (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.y[_i]]))) &&
  (forall _i: Cow :: { Cow._state[Cow.y[_i]] } (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.y[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.2): Cow.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.2): Cow.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.x[x] := havocValue;                                                                            
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.2): Cow.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.2): Cow.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.2): Cow.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.x[x] := havocValue;                                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.2): Cow.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.y(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.2): Cow.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.y[x] := havocValue;                                                                            
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByU := ReadEval.Cow.y(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.2): Cow.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.y[x] := havocValue;                                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var _pc_post: Phase;                                                                               
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                       
requires ValidTid(tid);                                                                             
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures Y(tid , old(Cow._state), old(Cow.x), old(Cow.y), old(Cow._lock) , Cow._state, Cow.x, Cow.y, Cow._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow.x:                                                                                           
                                                                                                    
function {:inline} Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.x(u: Tid,this: Cow,newValue: int,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, Cow.x[this] , Cow._state, Cow.x, Cow.y, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (3.9): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
var _pc_post: Phase;                                                                                
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow.x(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
// Cow.y:                                                                                           
                                                                                                    
function {:inline} Y_Cow.y(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.y(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.y(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.y(tid, this, Cow.y[this] , Cow._state, Cow.x, Cow.y, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Transitive(tid : Tid, this: Cow, newValue : Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (4.10): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Cow;                                                                                  
                                                                                                    
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
var _pc_post: Phase;                                                                                
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow.y(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.y(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.x,Cow.y,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var _pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.x, Cow.y, Cow._lock);              
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2245264(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
var newValue_post: Tid;                                                                             
var _pc_post: Phase;                                                                                
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);             
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.x(tid : Tid, this, Cow.x_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall this: Cow :: Y_Cow.y(tid : Tid, this, Cow.y_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 540.1-693.2: (Method:6.2)
// 548.1-548.24: (6.2): Bad tid
// 549.1-549.37: (6.2): this is not global
// 552.1-552.184: (6.2): Object invariant may not hold.
// 555.1-555.183: (6.2): Object invariant may not hold.
// 618.2-622.14: (class anchor.sink.While:7.3)
// 624.1-624.27: (6.2): Bad tid
// 625.1-625.40: (6.2): this is not global
// 628.1-628.187: (7.3): Object invariant may not hold.
// 629.1-629.33: (7.3): Phase must be invariant at loop head
// 630.1-630.30: (7.3): Potentially infinite loop head cannot be in post-commit phase.
// 632.3-642.43: (class anchor.sink.Yield:9.4)
// 637.1-637.184: (9.4): Object invariant may not hold.
// 639.1-639.184: (9.4): Object invariant may not hold.
// 643.3-645.3: (class anchor.sink.VarDeclStmt:10.4)
// 646.3-663.20: (class anchor.sink.Read:10.4)
// 658.1-658.28: (10.4): Cannot have potential null deference in left-mover part.
// 662.1-662.28: (10.4): Reduction failure
// 667.1-667.25: (11.17): Cannot have potential null deference in left-mover part.
// 671.1-671.28: (11.17): Reduction failure
// 676.1-676.25: (12.4): Cannot have potential null deference in left-mover part.
// 678.1-678.30: (12.4): lock not held
// 680.1-680.28: (12.4): Reduction failure
// 684.1-684.30: (7.3): Phase must be invariant at loop head
// 686.2-692.9: (class anchor.sink.Return:6.18)
// 691.1-691.183: (6.18): Object invariant may not hold.
// 694.1-849.2: (Method:16.2)
// 702.1-702.24: (16.2): Bad tid
// 703.1-703.37: (16.2): this is not global
// 706.1-706.184: (16.2): Object invariant may not hold.
// 709.1-709.183: (16.2): Object invariant may not hold.
// 774.2-778.14: (class anchor.sink.While:17.3)
// 780.1-780.27: (16.2): Bad tid
// 781.1-781.40: (16.2): this is not global
// 784.1-784.187: (17.3): Object invariant may not hold.
// 785.1-785.33: (17.3): Phase must be invariant at loop head
// 786.1-786.30: (17.3): Potentially infinite loop head cannot be in post-commit phase.
// 788.3-790.3: (class anchor.sink.VarDeclStmt:19.4)
// 791.3-808.20: (class anchor.sink.Read:19.4)
// 803.1-803.28: (19.4): Cannot have potential null deference in left-mover part.
// 807.1-807.28: (19.4): Reduction failure
// 812.1-812.25: (20.17): Cannot have potential null deference in left-mover part.
// 816.1-816.28: (20.17): Reduction failure
// 821.1-821.25: (21.4): Cannot have potential null deference in left-mover part.
// 823.1-823.30: (21.4): lock not held
// 825.1-825.28: (21.4): Reduction failure
// 827.3-837.43: (class anchor.sink.Yield:22.4)
// 832.1-832.184: (22.4): Object invariant may not hold.
// 834.1-834.184: (22.4): Object invariant may not hold.
// 840.1-840.30: (17.3): Phase must be invariant at loop head
// 842.2-848.9: (class anchor.sink.Return:16.19)
// 847.1-847.183: (16.19): Object invariant may not hold.
// 913.1-913.34: (3.2): Cow.x failed Write-Write Right-Mover Check
// 958.1-958.30: (3.2): Cow.x failed Write-Read Right-Mover Check
// 1007.1-1007.34: (3.2): Cow.x failed Write-Write Left-Mover Check
// 1053.1-1053.30: (3.2): Cow.x failed Write-Read Left-Mover Check
// 1096.1-1096.34: (3.2): Cow.x failed Read-Write Right-Mover Check
// 1142.1-1142.34: (3.2): Cow.x failed Read-Write Left-Mover Check
// 1187.1-1187.34: (4.2): Cow.y failed Write-Write Right-Mover Check
// 1232.1-1232.30: (4.2): Cow.y failed Write-Read Right-Mover Check
// 1281.1-1281.34: (4.2): Cow.y failed Write-Write Left-Mover Check
// 1327.1-1327.30: (4.2): Cow.y failed Write-Read Left-Mover Check
// 1370.1-1370.34: (4.2): Cow.y failed Read-Write Right-Mover Check
// 1416.1-1416.34: (4.2): Cow.y failed Read-Write Left-Mover Check
// 1487.1-1487.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
// 1488.1-1488.101: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
// 1489.1-1489.158: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
// 1585.1-1585.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
// 1686.1-1686.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
// 1687.1-1687.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
// 1758.1-1758.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
// 1759.1-1759.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
// 1760.1-1760.146: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
// 1830.1-1830.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
// 1831.1-1831.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
// 1832.1-1832.99: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
// 1904.1-1904.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.1)
// 1905.1-1905.101: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.2)
// 1906.1-1906.158: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.3)
// 2002.1-2002.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case C)
// 2103.1-2103.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case D)
// 2104.1-2104.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case R)
// 2175.1-2175.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case F)
// 2176.1-2176.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case H)
// 2177.1-2177.146: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case I)
// 2247.1-2247.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case J)
// 2248.1-2248.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case K)
// 2249.1-2249.99: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case L)
// 2321.1-2321.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.1)
// 2322.1-2322.101: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.2)
// 2323.1-2323.158: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.3)
// 2419.1-2419.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case C)
// 2520.1-2520.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case D)
// 2521.1-2521.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case R)
// 2592.1-2592.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case F)
// 2593.1-2593.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case H)
// 2594.1-2594.146: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case I)
// 2664.1-2664.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case J)
// 2665.1-2665.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case K)
// 2666.1-2666.99: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case L)
// 2738.1-2738.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.1)
// 2739.1-2739.101: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.2)
// 2740.1-2740.158: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.3)
// 2836.1-2836.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case C)
// 2937.1-2937.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case D)
// 2938.1-2938.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case R)
// 3009.1-3009.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case F)
// 3010.1-3010.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case H)
// 3011.1-3011.146: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case I)
// 3081.1-3081.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case J)
// 3082.1-3082.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case K)
// 3083.1-3083.99: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case L)
// 3090.1-3090.184: (<undefined position>): Object invariant may not hold.
// 3097.1-3097.183: (<undefined position>): Object invariant may not hold.
// 3111.1-3129.2: (3.9): yields_as clause for Cow.x is not valid
// 3134.1-3149.2: (3.9): yields_as clause for Cow.x is not reflexive
// 3155.1-3155.184: (3.9): Object invariant may not hold.
// 3156.1-3186.2: (3.9): yields_as clause for Cow.x is not transitive
// 3199.1-3217.2: (4.10): yields_as clause for Cow.y is not valid
// 3222.1-3237.2: (4.10): yields_as clause for Cow.y is not reflexive
// 3243.1-3243.184: (4.10): Object invariant may not hold.
// 3244.1-3274.2: (4.10): yields_as clause for Cow.y is not transitive
// 3288.1-3306.2: (7.32): yields_as clause for Cow._lock is not valid
// 3311.1-3326.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3332.1-3332.184: (2.1): Object invariant may not hold.
// 3333.1-3363.2: (7.32): yields_as clause for Cow._lock is not transitive
