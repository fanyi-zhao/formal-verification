                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/requires-2.sink:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
      invariant  this.x != 0;                                                                       
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        this.x := 0;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        this.x := 0;                                                                                
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
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.x: [Inc]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Inc.x(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.x(tid: Tid,this : Inc,newValue: int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Inc.3646739(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
 (Inc.x[this]!=0)                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Inc.3646746(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
 (Inc.x[this]==0)                                                                                   
}                                                                                                   
                                                                                                    
/////                                                                                               
procedure  Inc.inc.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (14.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (14.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (14.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
{ assert false; }                                                                                          // (14.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc, d : Cow)                                                    
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (14.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (14.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (14.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.2): Object invariant may not hold.
{                                                                                                   
 var d3646870: Cow;                                                                                 
 var Inc.x3646871: [Inc]int;                                                                        
 var moverPath3646870: MoverPath;                                                                   
 var Inc._lock3646871: [Inc]Tid;                                                                    
 var mover3646870: Mover;                                                                           
 var $pc3646870: Phase;                                                                             
 var Cow._state3646871: [Cow]State;                                                                 
 var $recorded.state3646870: int;                                                                   
 var $recorded.state3646871: int;                                                                   
 var d3646871: Cow;                                                                                 
 var Inc._state3646871: [Inc]State;                                                                 
 var tid3646870: Tid;                                                                               
 var this3646871: Inc;                                                                              
 var Inc.x3646870: [Inc]int;                                                                        
 var path3646870: int;                                                                              
 var Cow._state3646870: [Cow]State;                                                                 
 var tid3646871: Tid;                                                                               
 var $pc3646871: Phase;                                                                             
 var this3646870: Inc;                                                                              
 var Cow._lock3646870: [Cow]Tid;                                                                    
 var Cow._lock3646871: [Cow]Tid;                                                                    
 var Inc._state3646870: [Inc]State;                                                                 
 var Inc._lock3646870: [Inc]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 // 15.9: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath3646870 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 mover3646870 := m#moverPath(moverPath3646870);                                                     
 path3646870 := p#moverPath(moverPath3646870);                                                      
 assume Cow._state3646870 == Cow._state && Cow._lock3646870 == Cow._lock && Inc._state3646870 == Inc._state && Inc.x3646870 == Inc.x && Inc._lock3646870 == Inc._lock && d3646870 == d && this3646870 == this && tid3646870 == tid && $pc3646870 == $pc;
 assume $recorded.state3646870 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (15.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3646870);                                                              
 assert $pc != PhaseError;                                                                                 // (15.9): Reduction failure
 Inc.x[this] := 0;                                                                                  
                                                                                                    
 // 14.26: // return;                                                                               
                                                                                                    
 assume Cow._state3646871 == Cow._state && Cow._lock3646871 == Cow._lock && Inc._state3646871 == Inc._state && Inc.x3646871 == Inc.x && Inc._lock3646871 == Inc._lock && d3646871 == d && this3646871 == this && tid3646871 == tid;
 assume $recorded.state3646871 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.26): Object invariant may not hold.
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (14.26): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (9.5): Inc.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (9.5): Inc.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                       
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires ValidTid(tid);                                                                             
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures Y(tid , old(Cow._state), old(Cow._lock), old(Inc._state), old(Inc.x), old(Inc._lock) , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (5.1): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (5.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
// Inc.x:                                                                                           
                                                                                                    
function {:inline} Y_Inc.x(tid : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Inc.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.x(tid : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.x(u: Tid,this: Inc,newValue: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);         
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, Inc.x[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);      
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Transitive(tid : Tid, this: Inc, newValue : int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (9.11): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (9.11): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Inc.x(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.x(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);         
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646739(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (7.1): Object invariant may not hold.
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3646746(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (7.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Inc._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall this: Inc :: Y_Inc.x(tid : Tid, this, Inc.x_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 504.1-599.2: (Method:14.2)
// 511.1-511.24: (14.2): Bad tid
// 512.1-512.44: (14.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 513.1-513.37: (14.2): this is not global
// 516.1-516.199: (14.2): Object invariant may not hold.
// 517.1-517.199: (14.2): Object invariant may not hold.
// 520.1-520.198: (14.2): Object invariant may not hold.
// 521.1-521.198: (14.2): Object invariant may not hold.
// 522.1-522.18: (14.9): Method has inconsistent requirements.
// 533.1-533.24: (14.2): Bad tid
// 534.1-534.44: (14.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 535.1-535.37: (14.2): this is not global
// 538.1-538.199: (14.2): Object invariant may not hold.
// 539.1-539.199: (14.2): Object invariant may not hold.
// 542.1-542.198: (14.2): Object invariant may not hold.
// 543.1-543.198: (14.2): Object invariant may not hold.
// 574.2-590.19: (class anchor.sink.Write:15.9)
// 586.1-586.27: (15.9): Cannot have potential null deference in left-mover part.
// 589.1-589.27: (15.9): Reduction failure
// 591.2-598.9: (class anchor.sink.Return:14.26)
// 596.1-596.198: (14.26): Object invariant may not hold.
// 597.1-597.198: (14.26): Object invariant may not hold.
// 678.1-678.34: (9.5): Inc.x failed Write-Write Right-Mover Check
// 739.1-739.30: (9.5): Inc.x failed Write-Read Right-Mover Check
// 804.1-804.34: (9.5): Inc.x failed Write-Write Left-Mover Check
// 866.1-866.30: (9.5): Inc.x failed Write-Read Left-Mover Check
// 925.1-925.34: (9.5): Inc.x failed Read-Write Right-Mover Check
// 987.1-987.34: (9.5): Inc.x failed Read-Write Left-Mover Check
// 1060.1-1060.140: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 1061.1-1061.101: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 1062.1-1062.158: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 1161.1-1161.140: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
// 1265.1-1265.144: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
// 1266.1-1266.144: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
// 1339.1-1339.136: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
// 1340.1-1340.136: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
// 1341.1-1341.146: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
// 1413.1-1413.136: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
// 1414.1-1414.136: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
// 1415.1-1415.99: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
// 1422.1-1422.199: (<undefined position>): Object invariant may not hold.
// 1423.1-1423.199: (<undefined position>): Object invariant may not hold.
// 1431.1-1431.198: (<undefined position>): Object invariant may not hold.
// 1432.1-1432.198: (<undefined position>): Object invariant may not hold.
// 1453.1-1474.2: (7.32): yields_as clause for Cow._lock is not valid
// 1479.1-1495.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 1501.1-1501.199: (5.1): Object invariant may not hold.
// 1502.1-1502.199: (5.1): Object invariant may not hold.
// 1503.1-1535.2: (7.32): yields_as clause for Cow._lock is not transitive
// 1554.1-1575.2: (9.5): yields_as clause for Inc.x is not valid
// 1580.1-1596.2: (9.5): yields_as clause for Inc.x is not reflexive
// 1602.1-1602.199: (9.11): Object invariant may not hold.
// 1603.1-1603.199: (9.11): Object invariant may not hold.
// 1604.1-1636.2: (9.5): yields_as clause for Inc.x is not transitive
// 1656.1-1677.2: (7.32): yields_as clause for Inc._lock is not valid
// 1682.1-1698.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 1704.1-1704.199: (7.1): Object invariant may not hold.
// 1705.1-1705.199: (7.1): Object invariant may not hold.
// 1706.1-1738.2: (7.32): yields_as clause for Inc._lock is not transitive
