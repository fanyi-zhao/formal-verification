                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/pos-error.sink:                         
                                                                                                    
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
                                                                                                    
function {:inline} Invariant.Cow.3355151(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.2): Object invariant may not hold.
{                                                                                                   
 var Cow._lock3355250: [Cow]Tid;                                                                    
 var Cow.x3355264_bottom: [Cow]int;                                                                 
 var Cow._state3355265: [Cow]State;                                                                 
 var $recorded.state3355264_bottom: int;                                                            
 var Cow._lock3355265: [Cow]Tid;                                                                    
 var $pc3355264_bottom: Phase;                                                                      
 var tid3355256: Tid;                                                                               
 var Cow._lock3355250_post: [Cow]Tid;                                                               
 var $pc3355256: Phase;                                                                             
 var Cow.y3355264: [Cow]Cow;                                                                        
 var tid3355264_bottom: Tid;                                                                        
 var Cow.x3355264: [Cow]int;                                                                        
 var Cow._lock3355264_bottom: [Cow]Tid;                                                             
 var Cow.x3355250_post: [Cow]int;                                                                   
 var $recorded.state3355265: int;                                                                   
 var $pc3355250: Phase;                                                                             
 var $pc3355265: Phase;                                                                             
 var $pc3355264: Phase;                                                                             
 var Cow._state3355264_bottom: [Cow]State;                                                          
 var Cow._lock3355264: [Cow]Tid;                                                                    
 var this3355250_post: Cow;                                                                         
 var moverPath3355256: MoverPath;                                                                   
 var y3355256: Cow;                                                                                 
 var Cow.y3355256: [Cow]Cow;                                                                        
 var mover3355256: Mover;                                                                           
 var Cow._state3355250_post: [Cow]State;                                                            
 var tid3355250_post: Tid;                                                                          
 var this3355265: Cow;                                                                              
 var tid3355264: Tid;                                                                               
 var this3355256: Cow;                                                                              
 var this3355250: Cow;                                                                              
 var Cow.x3355256: [Cow]int;                                                                        
 var Cow.y3355250_post: [Cow]Cow;                                                                   
 var path3355256: int;                                                                              
 var tid3355250: Tid;                                                                               
 var this3355264_bottom: Cow;                                                                       
 var $recorded.state3355250: int;                                                                   
 var $recorded.state3355256: int;                                                                   
 var Cow._state3355264: [Cow]State;                                                                 
 var $recorded.state3355250_post: int;                                                              
 var Cow.y3355264_bottom: [Cow]Cow;                                                                 
 var Cow.x3355250: [Cow]int;                                                                        
 var y: Cow;                                                                                        
 var $recorded.state3355264: int;                                                                   
 var phase3355264: Phase;                                                                           
 var Cow.y3355250: [Cow]Cow;                                                                        
 var Cow._state3355256: [Cow]State;                                                                 
 var Cow._lock3355256: [Cow]Tid;                                                                    
 var Cow.x3355265: [Cow]int;                                                                        
 var $pc3355250_post: Phase;                                                                        
 var Cow._state3355250: [Cow]State;                                                                 
 var this3355264: Cow;                                                                              
 var Cow.y3355265: [Cow]Cow;                                                                        
 var tid3355265: Tid;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Cow._state3355264 == Cow._state && Cow.x3355264 == Cow.x && Cow.y3355264 == Cow.y && Cow._lock3355264 == Cow._lock && this3355264 == this && tid3355264 == tid;
 assume $recorded.state3355264 == 1;                                                                
                                                                                                    
 // 7.3: while (true)   {                                                                           
                                                                                                    
 phase3355264 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (6.2): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (6.2): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                    
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (7.3): Object invariant may not hold.
  invariant (forall _this : Cow :: Invariant.Y_Cow.x(tid : Tid, _this, Cow.x[_this] ,Cow._state3355264,Cow.x3355264,Cow.y3355264,Cow._lock3355264));       // (7.3): Loop does not preserve yields_as annotation for field x
  invariant (forall _this : Cow :: Invariant.Y_Cow.y(tid : Tid, _this, Cow.y[_this] ,Cow._state3355264,Cow.x3355264,Cow.y3355264,Cow._lock3355264));       // (7.3): Loop does not preserve yields_as annotation for field y
  invariant phase3355264 == $pc;                                                                           // (7.3): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (7.3): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 9.4: yield;                                                                                    
                                                                                                    
  assume Cow._state3355250 == Cow._state && Cow.x3355250 == Cow.x && Cow.y3355250 == Cow.y && Cow._lock3355250 == Cow._lock && this3355250 == this && tid3355250 == tid;
  assume $recorded.state3355250 == 1;                                                               
  assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (9.4): Object invariant may not hold.
  call Yield(tid);                                                                                  
  assume  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (9.4): Object invariant may not hold.
  $pc := PreCommit;                                                                                 
  assume Cow._state3355250_post == Cow._state && Cow.x3355250_post == Cow.x && Cow.y3355250_post == Cow.y && Cow._lock3355250_post == Cow._lock && this3355250_post == this && tid3355250_post == tid;
  assume $recorded.state3355250_post == 1;                                                          
                                                                                                    
  // 10.4: Cow y;                                                                                   
                                                                                                    
                                                                                                    
  // 10.4: y := this.y;                                                                             
                                                                                                    
                                                                                                    
  moverPath3355256 := ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);          
  mover3355256 := m#moverPath(moverPath3355256);                                                    
  path3355256 := p#moverPath(moverPath3355256);                                                     
  assume Cow._state3355256 == Cow._state && Cow.x3355256 == Cow.x && Cow.y3355256 == Cow.y && Cow._lock3355256 == Cow._lock && y3355256 == y && this3355256 == this && tid3355256 == tid && $pc3355256 == $pc;
  assume $recorded.state3355256 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Cow.null;                                                                         
  } else {                                                                                          
   assert this != Cow.null;                                                                                // (10.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover3355256);                                                             
  assert $pc != PhaseError;                                                                                // (10.4): Reduction failure
  y := Cow.y[this];                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (11.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[y] == Tid.null;                                                                  
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (11.17): Reduction failure
  Cow._lock[y] := tid;                                                                              
  if ($pc == PreCommit) {                                                                           
   assume y != Cow.null;                                                                            
  } else {                                                                                          
   assert y != Cow.null;                                                                                   // (12.4): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[y] == tid;                                                                              // (12.4): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (12.4): Reduction failure
  Cow._lock[y] := Tid.null;                                                                         
  assume Cow._state3355264_bottom == Cow._state && Cow.x3355264_bottom == Cow.x && Cow.y3355264_bottom == Cow.y && Cow._lock3355264_bottom == Cow._lock && this3355264_bottom == this && tid3355264_bottom == tid;
  assume $recorded.state3355264_bottom == 1;                                                        
  assert phase3355264 == $pc;                                                                              // (7.3): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 6.18: // return;                                                                                
                                                                                                    
 assume Cow._state3355265 == Cow._state && Cow.x3355265 == Cow.x && Cow.y3355265 == Cow.y && Cow._lock3355265 == Cow._lock && this3355265 == this && tid3355265 == tid;
 assume $recorded.state3355265 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (6.18): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.y[_i]]))) &&  
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.y[_i]], _t)))) &&
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.y[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.y(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Cow.y[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.y[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
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
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures Y(tid , old(Cow._state), old(Cow.x), old(Cow.y), old(Cow._lock) , Cow._state, Cow.x, Cow.y, Cow._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow.x:                                                                                           
                                                                                                    
function {:inline} Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.x(u: Tid,this: Cow,newValue: int,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
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
var $pc_yield: Phase;                                                                               
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (3.9): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
                                                                                                    
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
                                                                                                    
function {:inline} Invariant.Y_Cow.y(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.y(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
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
var $pc_yield: Phase;                                                                               
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (4.10): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
                                                                                                    
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
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.x,Cow.y,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
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
var $pc_yield: Phase;                                                                               
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.3355151(tid: Tid,_this : Cow,Cow._state,Cow.x,Cow.y,Cow._lock));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
var newValue_post: Tid;                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
// 454.1-609.2: (Method:6.2)
// 462.1-462.24: (6.2): Bad tid
// 463.1-463.37: (6.2): this is not global
// 466.1-466.184: (6.2): Object invariant may not hold.
// 469.1-469.183: (6.2): Object invariant may not hold.
// 532.2-536.14: (class anchor.sink.While:7.3)
// 538.1-538.27: (6.2): Bad tid
// 539.1-539.40: (6.2): this is not global
// 542.1-542.187: (7.3): Object invariant may not hold.
// 543.1-543.149: (7.3): Loop does not preserve yields_as annotation for field x
// 544.1-544.149: (7.3): Loop does not preserve yields_as annotation for field y
// 545.1-545.33: (7.3): Phase must be invariant at loop head
// 546.1-546.30: (7.3): Potentially infinite loop cannot be in post-commit phase.
// 548.3-558.43: (class anchor.sink.Yield:9.4)
// 553.1-553.184: (9.4): Object invariant may not hold.
// 555.1-555.184: (9.4): Object invariant may not hold.
// 559.3-561.3: (class anchor.sink.VarDeclStmt:10.4)
// 562.3-579.20: (class anchor.sink.Read:10.4)
// 574.1-574.28: (10.4): Cannot have potential null deference in left-mover part.
// 578.1-578.28: (10.4): Reduction failure
// 583.1-583.25: (11.17): Cannot have potential null deference in left-mover part.
// 587.1-587.28: (11.17): Reduction failure
// 592.1-592.25: (12.4): Cannot have potential null deference in left-mover part.
// 594.1-594.30: (12.4): lock not held
// 596.1-596.28: (12.4): Reduction failure
// 600.1-600.30: (7.3): Phase must be invariant at loop head
// 602.2-608.9: (class anchor.sink.Return:6.18)
// 607.1-607.183: (6.18): Object invariant may not hold.
// 687.1-687.34: (3.2): Cow.x failed Write-Write Right-Mover Check
// 746.1-746.30: (3.2): Cow.x failed Write-Read Right-Mover Check
// 809.1-809.34: (3.2): Cow.x failed Write-Write Left-Mover Check
// 869.1-869.30: (3.2): Cow.x failed Write-Read Left-Mover Check
// 926.1-926.34: (3.2): Cow.x failed Read-Write Right-Mover Check
// 986.1-986.34: (3.2): Cow.x failed Read-Write Left-Mover Check
// 1045.1-1045.34: (4.2): Cow.y failed Write-Write Right-Mover Check
// 1104.1-1104.30: (4.2): Cow.y failed Write-Read Right-Mover Check
// 1167.1-1167.34: (4.2): Cow.y failed Write-Write Left-Mover Check
// 1227.1-1227.30: (4.2): Cow.y failed Write-Read Left-Mover Check
// 1284.1-1284.34: (4.2): Cow.y failed Read-Write Right-Mover Check
// 1344.1-1344.34: (4.2): Cow.y failed Read-Write Left-Mover Check
// 1415.1-1415.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
// 1416.1-1416.101: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
// 1417.1-1417.158: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
// 1513.1-1513.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
// 1614.1-1614.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
// 1615.1-1615.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
// 1686.1-1686.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
// 1687.1-1687.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
// 1688.1-1688.146: (3.2): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
// 1758.1-1758.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
// 1759.1-1759.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
// 1760.1-1760.99: (3.2): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
// 1832.1-1832.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.1)
// 1833.1-1833.101: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.2)
// 1834.1-1834.158: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.3)
// 1930.1-1930.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case C)
// 2031.1-2031.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case D)
// 2032.1-2032.144: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case R)
// 2103.1-2103.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case F)
// 2104.1-2104.136: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case H)
// 2105.1-2105.146: (3.2): Cow.x is not Read-Write Stable with respect to Cow.y (case I)
// 2175.1-2175.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case J)
// 2176.1-2176.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case K)
// 2177.1-2177.99: (4.2): Cow.y is not Write-Read Stable with respect to Cow.x (case L)
// 2249.1-2249.140: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.1)
// 2250.1-2250.101: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.2)
// 2251.1-2251.158: (3.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.3)
// 2347.1-2347.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case C)
// 2448.1-2448.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case D)
// 2449.1-2449.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.x (case R)
// 2520.1-2520.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case F)
// 2521.1-2521.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case H)
// 2522.1-2522.146: (4.2): Cow.y is not Read-Write Stable with respect to Cow.x (case I)
// 2592.1-2592.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case J)
// 2593.1-2593.136: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case K)
// 2594.1-2594.99: (3.2): Cow.x is not Write-Read Stable with respect to Cow.y (case L)
// 2666.1-2666.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.1)
// 2667.1-2667.101: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.2)
// 2668.1-2668.158: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.3)
// 2764.1-2764.140: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case C)
// 2865.1-2865.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case D)
// 2866.1-2866.144: (4.2): Cow.y is not Write-Write Stable with respect to Cow.y (case R)
// 2937.1-2937.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case F)
// 2938.1-2938.136: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case H)
// 2939.1-2939.146: (4.2): Cow.y is not Read-Write Stable with respect to Cow.y (case I)
// 3009.1-3009.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case J)
// 3010.1-3010.136: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case K)
// 3011.1-3011.99: (4.2): Cow.y is not Write-Read Stable with respect to Cow.y (case L)
// 3018.1-3018.184: (<undefined position>): Object invariant may not hold.
// 3025.1-3025.183: (<undefined position>): Object invariant may not hold.
// 3045.1-3065.2: (3.2): yields_as clause for Cow.x is not valid
// 3070.1-3085.2: (3.2): yields_as clause for Cow.x is not reflexive
// 3091.1-3091.184: (3.9): Object invariant may not hold.
// 3092.1-3122.2: (3.2): yields_as clause for Cow.x is not transitive
// 3141.1-3161.2: (4.2): yields_as clause for Cow.y is not valid
// 3166.1-3181.2: (4.2): yields_as clause for Cow.y is not reflexive
// 3187.1-3187.184: (4.10): Object invariant may not hold.
// 3188.1-3218.2: (4.2): yields_as clause for Cow.y is not transitive
// 3238.1-3258.2: (7.32): yields_as clause for Cow._lock is not valid
// 3263.1-3278.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3284.1-3284.184: (2.1): Object invariant may not hold.
// 3285.1-3315.2: (7.32): yields_as clause for Cow._lock is not transitive
