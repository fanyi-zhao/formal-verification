                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/houdini-sync-1.sink:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        synchronized (this) {                                                                       
          this.x := 0;                                                                              
          this.y := 0;                                                                              
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        synchronized (this) {                                                                       
          this.y := 0;                                                                              
          this.x := 0;                                                                              
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
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
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 0;                                                                            
            this.y := 0;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.y := 0;                                                                            
            this.x := 0;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
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
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 0;                                                                            
            this.y := 0;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.y := 0;                                                                            
            this.x := 0;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? L : E                                                                 
                                                                                                    
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
      public void inc() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.x := 0;                                                                            
            this.y := 0;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            this.y := 0;                                                                            
            this.x := 0;                                                                            
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
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.x: [Inc]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Inc.x(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_E, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_E, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_L, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.x(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_E, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_E, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_L, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.y: [Inc]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Inc.y(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_E, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_E, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_L, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.y(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_E, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_E, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_L, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc)                                                             
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc.y;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (17.2): Bad tid
requires isShared(Inc._state[this]);                                                                       // (17.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                       
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                        
{                                                                                                   
 var this2186261: Inc;                                                                              
 var Inc.y2186266: [Inc]int;                                                                        
 var $pc2186257: Phase;                                                                             
 var Inc._state2186257: [Inc]State;                                                                 
 var path2186261: int;                                                                              
 var Inc._state2186266: [Inc]State;                                                                 
 var Inc._state2186261: [Inc]State;                                                                 
 var Inc.x2186261: [Inc]int;                                                                        
 var Inc._lock2186266: [Inc]Tid;                                                                    
 var tid2186266: Tid;                                                                               
 var tid2186257: Tid;                                                                               
 var moverPath2186261: MoverPath;                                                                   
 var Inc._lock2186257: [Inc]Tid;                                                                    
 var $recorded.state2186266: int;                                                                   
 var path2186257: int;                                                                              
 var this2186257: Inc;                                                                              
 var mover2186261: Mover;                                                                           
 var moverPath2186257: MoverPath;                                                                   
 var Inc.x2186266: [Inc]int;                                                                        
 var Inc.y2186257: [Inc]int;                                                                        
 var $pc2186261: Phase;                                                                             
 var $recorded.state2186257: int;                                                                   
 var $pc2186266: Phase;                                                                             
 var $recorded.state2186261: int;                                                                   
 var tid2186261: Tid;                                                                               
 var Inc._lock2186261: [Inc]Tid;                                                                    
 var this2186266: Inc;                                                                              
 var Inc.y2186261: [Inc]int;                                                                        
 var mover2186257: Mover;                                                                           
 var Inc.x2186257: [Inc]int;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (18.17): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Inc._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (18.17): Reduction failure
 Inc._lock[this] := tid;                                                                            
                                                                                                    
                                                                                                    
 // 19.6: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2186257 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2186257 := m#moverPath(moverPath2186257);                                                     
 path2186257 := p#moverPath(moverPath2186257);                                                      
 assume Inc._state2186257 == Inc._state && Inc.x2186257 == Inc.x && Inc.y2186257 == Inc.y && Inc._lock2186257 == Inc._lock && this2186257 == this && tid2186257 == tid && $pc2186257 == $pc;
 assume $recorded.state2186257 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (19.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2186257);                                                              
 assert $pc != PhaseError;                                                                                 // (19.6): Reduction failure
 Inc.x[this] := 0;                                                                                  
                                                                                                    
                                                                                                    
 // 20.6: this.y := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2186261 := WriteEval.Inc.y(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2186261 := m#moverPath(moverPath2186261);                                                     
 path2186261 := p#moverPath(moverPath2186261);                                                      
 assume Inc._state2186261 == Inc._state && Inc.x2186261 == Inc.x && Inc.y2186261 == Inc.y && Inc._lock2186261 == Inc._lock && this2186261 == this && tid2186261 == tid && $pc2186261 == $pc;
 assume $recorded.state2186261 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (20.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2186261);                                                              
 assert $pc != PhaseError;                                                                                 // (20.6): Reduction failure
 Inc.y[this] := 0;                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (21.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Inc._lock[this] == tid;                                                                            // (21.4): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.4): Reduction failure
 Inc._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 17.21: // return;                                                                               
                                                                                                    
 assume Inc._state2186266 == Inc._state && Inc.x2186266 == Inc.x && Inc.y2186266 == Inc.y && Inc._lock2186266 == Inc._lock && this2186266 == this && tid2186266 == tid;
 assume $recorded.state2186266 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Inc.inc2(tid:Tid, this : Inc)                                                            
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc.y;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (24.2): Bad tid
requires isShared(Inc._state[this]);                                                                       // (24.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                       
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                        
{                                                                                                   
 var tid2186282: Tid;                                                                               
 var Inc._lock2186282: [Inc]Tid;                                                                    
 var Inc.x2186282: [Inc]int;                                                                        
 var tid2186278: Tid;                                                                               
 var this2186282: Inc;                                                                              
 var Inc._state2186282: [Inc]State;                                                                 
 var path2186278: int;                                                                              
 var Inc.x2186287: [Inc]int;                                                                        
 var Inc._state2186287: [Inc]State;                                                                 
 var this2186287: Inc;                                                                              
 var Inc.y2186278: [Inc]int;                                                                        
 var moverPath2186282: MoverPath;                                                                   
 var Inc.y2186282: [Inc]int;                                                                        
 var $pc2186282: Phase;                                                                             
 var tid2186287: Tid;                                                                               
 var this2186278: Inc;                                                                              
 var $recorded.state2186282: int;                                                                   
 var Inc.x2186278: [Inc]int;                                                                        
 var mover2186282: Mover;                                                                           
 var $pc2186287: Phase;                                                                             
 var Inc._lock2186278: [Inc]Tid;                                                                    
 var moverPath2186278: MoverPath;                                                                   
 var $recorded.state2186278: int;                                                                   
 var Inc._lock2186287: [Inc]Tid;                                                                    
 var Inc.y2186287: [Inc]int;                                                                        
 var $recorded.state2186287: int;                                                                   
 var path2186282: int;                                                                              
 var Inc._state2186278: [Inc]State;                                                                 
 var mover2186278: Mover;                                                                           
 var $pc2186278: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (25.17): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Inc._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (25.17): Reduction failure
 Inc._lock[this] := tid;                                                                            
                                                                                                    
                                                                                                    
 // 26.6: this.y := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2186278 := WriteEval.Inc.y(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2186278 := m#moverPath(moverPath2186278);                                                     
 path2186278 := p#moverPath(moverPath2186278);                                                      
 assume Inc._state2186278 == Inc._state && Inc.x2186278 == Inc.x && Inc.y2186278 == Inc.y && Inc._lock2186278 == Inc._lock && this2186278 == this && tid2186278 == tid && $pc2186278 == $pc;
 assume $recorded.state2186278 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (26.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2186278);                                                              
 assert $pc != PhaseError;                                                                                 // (26.6): Reduction failure
 Inc.y[this] := 0;                                                                                  
                                                                                                    
                                                                                                    
 // 27.6: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2186282 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2186282 := m#moverPath(moverPath2186282);                                                     
 path2186282 := p#moverPath(moverPath2186282);                                                      
 assume Inc._state2186282 == Inc._state && Inc.x2186282 == Inc.x && Inc.y2186282 == Inc.y && Inc._lock2186282 == Inc._lock && this2186282 == this && tid2186282 == tid && $pc2186282 == $pc;
 assume $recorded.state2186282 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (27.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2186282);                                                              
 assert $pc != PhaseError;                                                                                 // (27.6): Reduction failure
 Inc.x[this] := 0;                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (28.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Inc._lock[this] == tid;                                                                            // (28.4): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (28.4): Reduction failure
 Inc._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 24.22: // return;                                                                               
                                                                                                    
 assume Inc._state2186287 == Inc._state && Inc.x2186287 == Inc.x && Inc.y2186287 == Inc.y && Inc._lock2186287 == Inc._lock && this2186287 == this && tid2186287 == tid;
 assume $recorded.state2186287 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc._state: [Inc]State,Inc.x: [Inc]int,Inc.y: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): Inc.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.5): Inc.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.x[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): Inc.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.5): Inc.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Inc.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                       
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.x[x];                                                                              
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.x[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Inc.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.y(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Inc.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.y(u: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (12.5): Inc.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.y[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.y[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.y(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Inc.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.y[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.y(u: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): Inc.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.y(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Inc.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.y(t: Tid, u: Tid, v: int, w: int, x: Inc)                       
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.y[x];                                                                              
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.y[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.y(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Inc.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.y(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.y(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.y.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.y.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.y[x];                                                                                  
 Inc.y[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.y[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.y.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.y[x];                                                                                  
 Inc.y[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.y[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.y.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.y.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.y.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.y.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.y[x];                                                                                  
 Inc.y[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.y[x] := tmpV;                                                                                  
 Inc.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.y.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc.y_mid: [Inc]int;                                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.y[x];                                                                                  
 Inc.y[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc.y_mid == Inc.y && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.y[x] := tmpV;                                                                                  
 Inc.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.y.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.y(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.y(t: Tid,x: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.y.Inc.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.y;                                                                                    
 modifies Inc.y;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.y_pre: [Inc]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Inc.y_post: [Inc]int;                                                                          
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.y(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.y(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc.y,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.y[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc.y_post == Inc.y && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.y(u: Tid,y: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                       
requires ValidTid(tid);                                                                             
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc.y;                                                                                     
modifies Inc._lock;                                                                                 
ensures StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                        
ensures Y(tid , old(Inc._state), old(Inc.x), old(Inc.y), old(Inc._lock) , Inc._state, Inc.x, Inc.y, Inc._lock);
                                                                                                    
// Inc.x:                                                                                           
                                                                                                    
function {:inline} Y_Inc.x(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock)), _R)) ==> (Inc.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.x(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.x(u: Tid,this: Inc,newValue: int,Inc._state,Inc.x,Inc.y,Inc._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, Inc.x[this] , Inc._state, Inc.x, Inc.y, Inc._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Transitive(tid : Tid, this: Inc, newValue : int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc.y_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Inc.y_pre: [Inc]int;                                                                            
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var Inc.y_post: [Inc]int;                                                                           
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.x, Inc.y, Inc._lock , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p); 
 assume Y_Inc.x(tid, this, newValue , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);                 
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc.y_post == Inc.y_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.x(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                         
}                                                                                                   
// Inc.y:                                                                                           
                                                                                                    
function {:inline} Y_Inc.y(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.y(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock)), _R)) ==> (Inc.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.y(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.y.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.y(u: Tid,this: Inc,newValue: int,Inc._state,Inc.x,Inc.y,Inc._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.y(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Inc.y.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.y(tid, this, Inc.y[this] , Inc._state, Inc.x, Inc.y, Inc._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Inc.y.Transitive(tid : Tid, this: Inc, newValue : int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc.y_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Inc.y_pre: [Inc]int;                                                                            
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var Inc.y_post: [Inc]int;                                                                           
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.x, Inc.y, Inc._lock , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p); 
 assume Y_Inc.y(tid, this, newValue , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);                 
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc.y_post == Inc.y_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.y(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                         
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Inc._state,Inc.x,Inc.y,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock)), _N);
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc.y_yield: [Inc]int;                                                                          
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc.y_yield == Inc.y && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Inc._state, Inc.x, Inc.y, Inc._lock);              
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc.y_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                      
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Inc.y_pre: [Inc]int;                                                                            
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var Inc.y_post: [Inc]int;                                                                           
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc.y_pre == Inc.y && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.x, Inc.y, Inc._lock , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p); 
 assume Y_Inc._lock(tid, this, newValue , Inc._state_p, Inc.x_p, Inc.y_p, Inc._lock_p);             
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc.y_post == Inc.y_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.x, Inc.y, Inc._lock);                     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc.y: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc.y_p: [Inc]int, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Inc :: Y_Inc.x(tid : Tid, this, Inc.x_p[this] , Inc._state, Inc.x, Inc.y, Inc._lock))
 && (forall this: Inc :: Y_Inc.y(tid : Tid, this, Inc.y_p[this] , Inc._state, Inc.x, Inc.y, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Inc._state, Inc.x, Inc.y, Inc._lock))
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 568.1-678.2: (Method:17.2)
// 576.1-576.24: (17.2): Bad tid
// 577.1-577.37: (17.2): this is not global
// 621.1-621.27: (18.17): Cannot have potential null deference in left-mover part.
// 625.1-625.27: (18.17): Reduction failure
// 628.2-644.19: (class anchor.sink.Write:19.6)
// 640.1-640.27: (19.6): Cannot have potential null deference in left-mover part.
// 643.1-643.27: (19.6): Reduction failure
// 646.2-662.19: (class anchor.sink.Write:20.6)
// 658.1-658.27: (20.6): Cannot have potential null deference in left-mover part.
// 661.1-661.27: (20.6): Reduction failure
// 666.1-666.27: (21.4): Cannot have potential null deference in left-mover part.
// 668.1-668.32: (21.4): lock not held
// 670.1-670.27: (21.4): Reduction failure
// 672.2-677.9: (class anchor.sink.Return:17.21)
// 679.1-789.2: (Method:24.2)
// 687.1-687.24: (24.2): Bad tid
// 688.1-688.37: (24.2): this is not global
// 732.1-732.27: (25.17): Cannot have potential null deference in left-mover part.
// 736.1-736.27: (25.17): Reduction failure
// 739.2-755.19: (class anchor.sink.Write:26.6)
// 751.1-751.27: (26.6): Cannot have potential null deference in left-mover part.
// 754.1-754.27: (26.6): Reduction failure
// 757.2-773.19: (class anchor.sink.Write:27.6)
// 769.1-769.27: (27.6): Cannot have potential null deference in left-mover part.
// 772.1-772.27: (27.6): Reduction failure
// 777.1-777.27: (28.4): Cannot have potential null deference in left-mover part.
// 779.1-779.32: (28.4): lock not held
// 781.1-781.27: (28.4): Reduction failure
// 783.2-788.9: (class anchor.sink.Return:24.22)
// 865.1-865.34: (7.5): Inc.x failed Write-Write Right-Mover Check
// 924.1-924.30: (7.5): Inc.x failed Write-Read Right-Mover Check
// 987.1-987.34: (7.5): Inc.x failed Write-Write Left-Mover Check
// 1047.1-1047.30: (7.5): Inc.x failed Write-Read Left-Mover Check
// 1104.1-1104.34: (7.5): Inc.x failed Read-Write Right-Mover Check
// 1164.1-1164.34: (7.5): Inc.x failed Read-Write Left-Mover Check
// 1223.1-1223.34: (12.5): Inc.y failed Write-Write Right-Mover Check
// 1282.1-1282.30: (12.5): Inc.y failed Write-Read Right-Mover Check
// 1345.1-1345.34: (12.5): Inc.y failed Write-Write Left-Mover Check
// 1405.1-1405.30: (12.5): Inc.y failed Write-Read Left-Mover Check
// 1462.1-1462.34: (12.5): Inc.y failed Read-Write Right-Mover Check
// 1522.1-1522.34: (12.5): Inc.y failed Read-Write Left-Mover Check
// 1593.1-1593.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 1594.1-1594.101: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 1595.1-1595.158: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 1691.1-1691.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
// 1792.1-1792.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
// 1793.1-1793.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
// 1864.1-1864.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
// 1865.1-1865.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
// 1866.1-1866.146: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
// 1936.1-1936.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
// 1937.1-1937.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
// 1938.1-1938.99: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
// 2010.1-2010.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.1)
// 2011.1-2011.101: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.2)
// 2012.1-2012.158: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.3)
// 2108.1-2108.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case C)
// 2209.1-2209.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case D)
// 2210.1-2210.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case R)
// 2281.1-2281.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case F)
// 2282.1-2282.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case H)
// 2283.1-2283.146: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case I)
// 2353.1-2353.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case J)
// 2354.1-2354.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case K)
// 2355.1-2355.99: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case L)
// 2427.1-2427.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.1)
// 2428.1-2428.101: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.2)
// 2429.1-2429.158: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.3)
// 2525.1-2525.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case C)
// 2626.1-2626.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case D)
// 2627.1-2627.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case R)
// 2698.1-2698.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case F)
// 2699.1-2699.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case H)
// 2700.1-2700.146: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case I)
// 2770.1-2770.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case J)
// 2771.1-2771.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case K)
// 2772.1-2772.99: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case L)
// 2844.1-2844.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.1)
// 2845.1-2845.101: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.2)
// 2846.1-2846.158: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.3)
// 2942.1-2942.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case C)
// 3043.1-3043.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case D)
// 3044.1-3044.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case R)
// 3115.1-3115.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case F)
// 3116.1-3116.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case H)
// 3117.1-3117.146: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case I)
// 3187.1-3187.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case J)
// 3188.1-3188.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case K)
// 3189.1-3189.99: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case L)
// 3221.1-3241.2: (7.5): yields_as clause for Inc.x is not valid
// 3246.1-3261.2: (7.5): yields_as clause for Inc.x is not reflexive
// 3267.1-3297.2: (7.5): yields_as clause for Inc.x is not transitive
// 3316.1-3336.2: (12.5): yields_as clause for Inc.y is not valid
// 3341.1-3356.2: (12.5): yields_as clause for Inc.y is not reflexive
// 3362.1-3392.2: (12.5): yields_as clause for Inc.y is not transitive
// 3412.1-3432.2: (7.32): yields_as clause for Inc._lock is not valid
// 3437.1-3452.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 3458.1-3488.2: (7.32): yields_as clause for Inc._lock is not transitive
