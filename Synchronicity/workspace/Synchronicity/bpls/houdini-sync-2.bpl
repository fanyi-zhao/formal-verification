                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/houdini-sync-2.sink:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? B : N                                                                 
         : holds(this, tid) ? N : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? E : E                                                                 
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        synchronized (this) {                                                                       
          this.x := 0;                                                                              
          int t;                                                                                    
          t := this.x;                                                                              
        }                                                                                           
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        synchronized (this) {                                                                       
          this.y := 0;                                                                              
          this.x := 0;                                                                              
        }                                                                                           
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? B : N                                                                 
         : holds(this, tid) ? N : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? E : E                                                                 
                                                                                                    
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
            int t;                                                                                  
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
         ? holds(this, tid) ? B : N                                                                 
         : holds(this, tid) ? N : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? E : E                                                                 
                                                                                                    
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
            int t;                                                                                  
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
         ? holds(this, tid) ? B : N                                                                 
         : holds(this, tid) ? N : E                                                                 
                                                                                                    
       int y isLocal(this, tid)                                                                     
       ? E                                                                                          
       : isRead                                                                                     
         ? holds(this, tid) ? E : E                                                                 
         : holds(this, tid) ? E : E                                                                 
                                                                                                    
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
            int t;                                                                                  
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
        yield;                                                                                      
        int t;                                                                                      
        t := this.x;                                                                                
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
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_N, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_N, 4)                                                                                
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
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_N, 2)                                                                                
  else                                                                                              
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_N, 4)                                                                                
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
    moverPath(_E, 4)                                                                                
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
    moverPath(_E, 4)                                                                                
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
 var tid2194463_post: Tid;                                                                          
 var tid2194458: Tid;                                                                               
 var tid2194463: Tid;                                                                               
 var this2194470: Inc;                                                                              
 var tid2194452: Tid;                                                                               
 var $pc2194452: Phase;                                                                             
 var tid2194469: Tid;                                                                               
 var path2194452: int;                                                                              
 var mover2194452: Mover;                                                                           
 var Inc._state2194463: [Inc]State;                                                                 
 var Inc.x2194458: [Inc]int;                                                                        
 var Inc._state2194452: [Inc]State;                                                                 
 var moverPath2194458: MoverPath;                                                                   
 var Inc._lock2194463: [Inc]Tid;                                                                    
 var $recorded.state2194469: int;                                                                   
 var path2194458: int;                                                                              
 var this2194463_post: Inc;                                                                         
 var this2194452: Inc;                                                                              
 var Inc._state2194470: [Inc]State;                                                                 
 var $pc2194470: Phase;                                                                             
 var mover2194458: Mover;                                                                           
 var Inc._lock2194470: [Inc]Tid;                                                                    
 var Inc._lock2194458: [Inc]Tid;                                                                    
 var $pc2194458: Phase;                                                                             
 var Inc.y2194463_post: [Inc]int;                                                                   
 var $pc2194463: Phase;                                                                             
 var moverPath2194452: MoverPath;                                                                   
 var $recorded.state2194463_post: int;                                                              
 var this2194458: Inc;                                                                              
 var mover2194469: Mover;                                                                           
 var Inc.x2194463: [Inc]int;                                                                        
 var $pc2194463_post: Phase;                                                                        
 var Inc._state2194458: [Inc]State;                                                                 
 var t2194458: int;                                                                                 
 var $pc2194469: Phase;                                                                             
 var Inc.x2194463_post: [Inc]int;                                                                   
 var Inc._lock2194463_post: [Inc]Tid;                                                               
 var Inc._lock2194452: [Inc]Tid;                                                                    
 var Inc.x2194452: [Inc]int;                                                                        
 var Inc.y2194463: [Inc]int;                                                                        
 var $recorded.state2194470: int;                                                                   
 var Inc._state2194469: [Inc]State;                                                                 
 var Inc._lock2194469: [Inc]Tid;                                                                    
 var $recorded.state2194452: int;                                                                   
 var Inc.x2194469: [Inc]int;                                                                        
 var $recorded.state2194458: int;                                                                   
 var this2194469: Inc;                                                                              
 var t2194470: int;                                                                                 
 var $recorded.state2194463: int;                                                                   
 var Inc.y2194458: [Inc]int;                                                                        
 var tid2194470: Tid;                                                                               
 var path2194469: int;                                                                              
 var t: int;                                                                                        
 var Inc.y2194452: [Inc]int;                                                                        
 var t2194469: int;                                                                                 
 var this2194463: Inc;                                                                              
 var Inc.y2194470: [Inc]int;                                                                        
 var moverPath2194469: MoverPath;                                                                   
 var Inc._state2194463_post: [Inc]State;                                                            
 var Inc.y2194469: [Inc]int;                                                                        
 var Inc.x2194470: [Inc]int;                                                                        
                                                                                                    
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
                                                                                                    
                                                                                                    
 moverPath2194452 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2194452 := m#moverPath(moverPath2194452);                                                     
 path2194452 := p#moverPath(moverPath2194452);                                                      
 assume Inc._state2194452 == Inc._state && Inc.x2194452 == Inc.x && Inc.y2194452 == Inc.y && Inc._lock2194452 == Inc._lock && this2194452 == this && tid2194452 == tid && $pc2194452 == $pc;
 assume $recorded.state2194452 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (19.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2194452);                                                              
 assert $pc != PhaseError;                                                                                 // (19.6): Reduction failure
 Inc.x[this] := 0;                                                                                  
                                                                                                    
 // 20.9: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 20.9: t := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath2194458 := ReadEval.Inc.x(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);           
 mover2194458 := m#moverPath(moverPath2194458);                                                     
 path2194458 := p#moverPath(moverPath2194458);                                                      
 assume Inc._state2194458 == Inc._state && Inc.x2194458 == Inc.x && Inc.y2194458 == Inc.y && Inc._lock2194458 == Inc._lock && t2194458 == t && this2194458 == this && tid2194458 == tid && $pc2194458 == $pc;
 assume $recorded.state2194458 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2194458);                                                              
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 t := Inc.x[this];                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (22.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Inc._lock[this] == tid;                                                                            // (22.4): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.4): Reduction failure
 Inc._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 23.4: yield;                                                                                    
                                                                                                    
 assume Inc._state2194463 == Inc._state && Inc.x2194463 == Inc.x && Inc.y2194463 == Inc.y && Inc._lock2194463 == Inc._lock && this2194463 == this && tid2194463 == tid;
 assume $recorded.state2194463 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Inc._state2194463_post == Inc._state && Inc.x2194463_post == Inc.x && Inc.y2194463_post == Inc.y && Inc._lock2194463_post == Inc._lock && this2194463_post == this && tid2194463_post == tid;
 assume $recorded.state2194463_post == 1;                                                           
                                                                                                    
 // 24.4: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 24.4: t := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath2194469 := ReadEval.Inc.x(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);           
 mover2194469 := m#moverPath(moverPath2194469);                                                     
 path2194469 := p#moverPath(moverPath2194469);                                                      
 assume Inc._state2194469 == Inc._state && Inc.x2194469 == Inc.x && Inc.y2194469 == Inc.y && Inc._lock2194469 == Inc._lock && t2194469 == t && this2194469 == this && tid2194469 == tid && $pc2194469 == $pc;
 assume $recorded.state2194469 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (24.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2194469);                                                              
 assert $pc != PhaseError;                                                                                 // (24.4): Reduction failure
 t := Inc.x[this];                                                                                  
                                                                                                    
 // 17.21: // return;                                                                               
                                                                                                    
 assume Inc._state2194470 == Inc._state && Inc.x2194470 == Inc.x && Inc.y2194470 == Inc.y && Inc._lock2194470 == Inc._lock && t2194470 == t && this2194470 == this && tid2194470 == tid;
 assume $recorded.state2194470 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Inc.inc2(tid:Tid, this : Inc)                                                            
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc.y;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (27.2): Bad tid
requires isShared(Inc._state[this]);                                                                       // (27.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                       
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc.y, Inc._lock);                                        
{                                                                                                   
 var moverPath2194482: MoverPath;                                                                   
 var mover2194486: Mover;                                                                           
 var $pc2194497: Phase;                                                                             
 var $recorded.state2194491_post: int;                                                              
 var tid2194491: Tid;                                                                               
 var this2194486: Inc;                                                                              
 var path2194486: int;                                                                              
 var Inc.y2194491: [Inc]int;                                                                        
 var Inc._lock2194491: [Inc]Tid;                                                                    
 var $recorded.state2194486: int;                                                                   
 var tid2194482: Tid;                                                                               
 var Inc.x2194498: [Inc]int;                                                                        
 var Inc._lock2194491_post: [Inc]Tid;                                                               
 var Inc._state2194482: [Inc]State;                                                                 
 var Inc._lock2194498: [Inc]Tid;                                                                    
 var tid2194498: Tid;                                                                               
 var path2194497: int;                                                                              
 var Inc.y2194482: [Inc]int;                                                                        
 var tid2194486: Tid;                                                                               
 var this2194491: Inc;                                                                              
 var tid2194497: Tid;                                                                               
 var this2194482: Inc;                                                                              
 var $pc2194491_post: Phase;                                                                        
 var Inc.x2194486: [Inc]int;                                                                        
 var Inc.y2194497: [Inc]int;                                                                        
 var Inc._state2194498: [Inc]State;                                                                 
 var $recorded.state2194491: int;                                                                   
 var Inc._lock2194482: [Inc]Tid;                                                                    
 var mover2194497: Mover;                                                                           
 var Inc.y2194491_post: [Inc]int;                                                                   
 var mover2194482: Mover;                                                                           
 var $pc2194482: Phase;                                                                             
 var t2194497: int;                                                                                 
 var this2194498: Inc;                                                                              
 var $pc2194486: Phase;                                                                             
 var tid2194491_post: Tid;                                                                          
 var Inc.x2194497: [Inc]int;                                                                        
 var this2194497: Inc;                                                                              
 var Inc.y2194498: [Inc]int;                                                                        
 var Inc._lock2194486: [Inc]Tid;                                                                    
 var moverPath2194486: MoverPath;                                                                   
 var Inc.x2194491: [Inc]int;                                                                        
 var Inc._state2194491_post: [Inc]State;                                                            
 var Inc._lock2194497: [Inc]Tid;                                                                    
 var path2194482: int;                                                                              
 var $pc2194498: Phase;                                                                             
 var $recorded.state2194498: int;                                                                   
 var this2194491_post: Inc;                                                                         
 var t2194498: int;                                                                                 
 var t: int;                                                                                        
 var Inc.x2194482: [Inc]int;                                                                        
 var $recorded.state2194497: int;                                                                   
 var Inc._state2194497: [Inc]State;                                                                 
 var Inc.y2194486: [Inc]int;                                                                        
 var Inc.x2194491_post: [Inc]int;                                                                   
 var $recorded.state2194482: int;                                                                   
 var $pc2194491: Phase;                                                                             
 var Inc._state2194491: [Inc]State;                                                                 
 var moverPath2194497: MoverPath;                                                                   
 var Inc._state2194486: [Inc]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (28.17): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Inc._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (28.17): Reduction failure
 Inc._lock[this] := tid;                                                                            
                                                                                                    
                                                                                                    
 // 29.6: this.y := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2194482 := WriteEval.Inc.y(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2194482 := m#moverPath(moverPath2194482);                                                     
 path2194482 := p#moverPath(moverPath2194482);                                                      
 assume Inc._state2194482 == Inc._state && Inc.x2194482 == Inc.x && Inc.y2194482 == Inc.y && Inc._lock2194482 == Inc._lock && this2194482 == this && tid2194482 == tid && $pc2194482 == $pc;
 assume $recorded.state2194482 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (29.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2194482);                                                              
 assert $pc != PhaseError;                                                                                 // (29.6): Reduction failure
 Inc.y[this] := 0;                                                                                  
                                                                                                    
                                                                                                    
 // 30.6: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2194486 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc.y,Inc._lock);   
 mover2194486 := m#moverPath(moverPath2194486);                                                     
 path2194486 := p#moverPath(moverPath2194486);                                                      
 assume Inc._state2194486 == Inc._state && Inc.x2194486 == Inc.x && Inc.y2194486 == Inc.y && Inc._lock2194486 == Inc._lock && this2194486 == this && tid2194486 == tid && $pc2194486 == $pc;
 assume $recorded.state2194486 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (30.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2194486);                                                              
 assert $pc != PhaseError;                                                                                 // (30.6): Reduction failure
 Inc.x[this] := 0;                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (31.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Inc._lock[this] == tid;                                                                            // (31.4): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (31.4): Reduction failure
 Inc._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 32.4: yield;                                                                                    
                                                                                                    
 assume Inc._state2194491 == Inc._state && Inc.x2194491 == Inc.x && Inc.y2194491 == Inc.y && Inc._lock2194491 == Inc._lock && this2194491 == this && tid2194491 == tid;
 assume $recorded.state2194491 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Inc._state2194491_post == Inc._state && Inc.x2194491_post == Inc.x && Inc.y2194491_post == Inc.y && Inc._lock2194491_post == Inc._lock && this2194491_post == this && tid2194491_post == tid;
 assume $recorded.state2194491_post == 1;                                                           
                                                                                                    
 // 33.4: int t;                                                                                    
                                                                                                    
                                                                                                    
 // 33.4: t := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath2194497 := ReadEval.Inc.x(tid: Tid,this: Inc,Inc._state,Inc.x,Inc.y,Inc._lock);           
 mover2194497 := m#moverPath(moverPath2194497);                                                     
 path2194497 := p#moverPath(moverPath2194497);                                                      
 assume Inc._state2194497 == Inc._state && Inc.x2194497 == Inc.x && Inc.y2194497 == Inc.y && Inc._lock2194497 == Inc._lock && t2194497 == t && this2194497 == this && tid2194497 == tid && $pc2194497 == $pc;
 assume $recorded.state2194497 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (33.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2194497);                                                              
 assert $pc != PhaseError;                                                                                 // (33.4): Reduction failure
 t := Inc.x[this];                                                                                  
                                                                                                    
 // 27.22: // return;                                                                               
                                                                                                    
 assume Inc._state2194498 == Inc._state && Inc.x2194498 == Inc.x && Inc.y2194498 == Inc.y && Inc._lock2194498 == Inc._lock && t2194498 == t && this2194498 == this && tid2194498 == tid;
 assume $recorded.state2194498 == 1;                                                                
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
                                                                                                    
                                                                                                    
// 596.1-770.2: (Method:17.2)
// 604.1-604.24: (17.2): Bad tid
// 605.1-605.37: (17.2): this is not global
// 680.1-680.27: (18.17): Cannot have potential null deference in left-mover part.
// 684.1-684.27: (18.17): Reduction failure
// 687.2-703.19: (class anchor.sink.Write:19.6)
// 699.1-699.27: (19.6): Cannot have potential null deference in left-mover part.
// 702.1-702.27: (19.6): Reduction failure
// 704.2-706.2: (class anchor.sink.VarDeclStmt:20.9)
// 707.2-724.19: (class anchor.sink.Read:20.9)
// 719.1-719.27: (20.9): Cannot have potential null deference in left-mover part.
// 723.1-723.27: (20.9): Reduction failure
// 728.1-728.27: (22.4): Cannot have potential null deference in left-mover part.
// 730.1-730.32: (22.4): lock not held
// 732.1-732.27: (22.4): Reduction failure
// 734.2-742.42: (class anchor.sink.Yield:23.4)
// 743.2-745.2: (class anchor.sink.VarDeclStmt:24.4)
// 746.2-763.19: (class anchor.sink.Read:24.4)
// 758.1-758.27: (24.4): Cannot have potential null deference in left-mover part.
// 762.1-762.27: (24.4): Reduction failure
// 764.2-769.9: (class anchor.sink.Return:17.21)
// 771.1-941.2: (Method:27.2)
// 779.1-779.24: (27.2): Bad tid
// 780.1-780.37: (27.2): this is not global
// 854.1-854.27: (28.17): Cannot have potential null deference in left-mover part.
// 858.1-858.27: (28.17): Reduction failure
// 861.2-877.19: (class anchor.sink.Write:29.6)
// 873.1-873.27: (29.6): Cannot have potential null deference in left-mover part.
// 876.1-876.27: (29.6): Reduction failure
// 879.2-895.19: (class anchor.sink.Write:30.6)
// 891.1-891.27: (30.6): Cannot have potential null deference in left-mover part.
// 894.1-894.27: (30.6): Reduction failure
// 899.1-899.27: (31.4): Cannot have potential null deference in left-mover part.
// 901.1-901.32: (31.4): lock not held
// 903.1-903.27: (31.4): Reduction failure
// 905.2-913.42: (class anchor.sink.Yield:32.4)
// 914.2-916.2: (class anchor.sink.VarDeclStmt:33.4)
// 917.2-934.19: (class anchor.sink.Read:33.4)
// 929.1-929.27: (33.4): Cannot have potential null deference in left-mover part.
// 933.1-933.27: (33.4): Reduction failure
// 935.2-940.9: (class anchor.sink.Return:27.22)
// 1017.1-1017.34: (7.5): Inc.x failed Write-Write Right-Mover Check
// 1076.1-1076.30: (7.5): Inc.x failed Write-Read Right-Mover Check
// 1139.1-1139.34: (7.5): Inc.x failed Write-Write Left-Mover Check
// 1199.1-1199.30: (7.5): Inc.x failed Write-Read Left-Mover Check
// 1256.1-1256.34: (7.5): Inc.x failed Read-Write Right-Mover Check
// 1316.1-1316.34: (7.5): Inc.x failed Read-Write Left-Mover Check
// 1375.1-1375.34: (12.5): Inc.y failed Write-Write Right-Mover Check
// 1434.1-1434.30: (12.5): Inc.y failed Write-Read Right-Mover Check
// 1497.1-1497.34: (12.5): Inc.y failed Write-Write Left-Mover Check
// 1557.1-1557.30: (12.5): Inc.y failed Write-Read Left-Mover Check
// 1614.1-1614.34: (12.5): Inc.y failed Read-Write Right-Mover Check
// 1674.1-1674.34: (12.5): Inc.y failed Read-Write Left-Mover Check
// 1745.1-1745.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 1746.1-1746.101: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 1747.1-1747.158: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 1843.1-1843.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
// 1944.1-1944.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
// 1945.1-1945.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
// 2016.1-2016.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
// 2017.1-2017.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
// 2018.1-2018.146: (7.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
// 2088.1-2088.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
// 2089.1-2089.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
// 2090.1-2090.99: (7.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
// 2162.1-2162.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.1)
// 2163.1-2163.101: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.2)
// 2164.1-2164.158: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case A.3)
// 2260.1-2260.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case C)
// 2361.1-2361.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case D)
// 2362.1-2362.144: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case R)
// 2433.1-2433.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case F)
// 2434.1-2434.136: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case H)
// 2435.1-2435.146: (7.5): Inc.x is not Read-Write Stable with respect to Inc.y (case I)
// 2505.1-2505.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case J)
// 2506.1-2506.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case K)
// 2507.1-2507.99: (12.5): Inc.y is not Write-Read Stable with respect to Inc.x (case L)
// 2579.1-2579.140: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.1)
// 2580.1-2580.101: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.2)
// 2581.1-2581.158: (7.5): Inc.x is not Write-Write Stable with respect to Inc.y (case A.3)
// 2677.1-2677.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case C)
// 2778.1-2778.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case D)
// 2779.1-2779.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.x (case R)
// 2850.1-2850.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case F)
// 2851.1-2851.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case H)
// 2852.1-2852.146: (12.5): Inc.y is not Read-Write Stable with respect to Inc.x (case I)
// 2922.1-2922.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case J)
// 2923.1-2923.136: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case K)
// 2924.1-2924.99: (7.5): Inc.x is not Write-Read Stable with respect to Inc.y (case L)
// 2996.1-2996.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.1)
// 2997.1-2997.101: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.2)
// 2998.1-2998.158: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case A.3)
// 3094.1-3094.140: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case C)
// 3195.1-3195.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case D)
// 3196.1-3196.144: (12.5): Inc.y is not Write-Write Stable with respect to Inc.y (case R)
// 3267.1-3267.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case F)
// 3268.1-3268.136: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case H)
// 3269.1-3269.146: (12.5): Inc.y is not Read-Write Stable with respect to Inc.y (case I)
// 3339.1-3339.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case J)
// 3340.1-3340.136: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case K)
// 3341.1-3341.99: (12.5): Inc.y is not Write-Read Stable with respect to Inc.y (case L)
// 3373.1-3393.2: (7.5): yields_as clause for Inc.x is not valid
// 3398.1-3413.2: (7.5): yields_as clause for Inc.x is not reflexive
// 3419.1-3449.2: (7.5): yields_as clause for Inc.x is not transitive
// 3468.1-3488.2: (12.5): yields_as clause for Inc.y is not valid
// 3493.1-3508.2: (12.5): yields_as clause for Inc.y is not reflexive
// 3514.1-3544.2: (12.5): yields_as clause for Inc.y is not transitive
// 3564.1-3584.2: (7.32): yields_as clause for Inc._lock is not valid
// 3589.1-3604.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 3610.1-3640.2: (7.32): yields_as clause for Inc._lock is not transitive
