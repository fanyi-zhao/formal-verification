                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/method-specs-sim.anchor:                
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class List {                                                                                    
      volatile int x holds(this, tid) ? B : E                                                       
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures pred == old(this.x);                                                                
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) < 10;                                                                     
        ensures pred == old(pred) + 1;                                                              
      }*                                                                                            
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) >= 10;                                                                    
      }                                                                                             
      public boolean add(int item) {                                                                
        synchronized (this) {                                                                       
          pred := this.x;                                                                           
          int tmp1;                                                                                 
          tmp1 = 0;                                                                                 
          this.x := tmp1;                                                                           
        }                                                                                           
        yield;                                                                                      
        while (true)                                                                                
          invariant pred < 10 ==> NextSpecStep(1);                                                  
          invariant pred >= 10 ==> NextSpecStep(2);                                                 
          {                                                                                         
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            tmp3 = pred >= 10;                                                                      
            if (tmp3 /* == pred >= 10 */) {                                                         
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            pred = pred + 1;                                                                        
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
         return false;                                                                              
        // return false;                                                                            
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class List {                                                                                    
      volatile int x holds(this, tid) ? B : E                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures pred == old(this.x);                                                                
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) < 10;                                                                     
        ensures pred == old(pred) + 1;                                                              
      }*                                                                                            
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) >= 10;                                                                    
      }                                                                                             
      public boolean add(int item) {                                                                
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            pred := this.x;                                                                         
            int tmp1;                                                                               
            tmp1 = 0;                                                                               
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        while (true)                                                                                
          invariant pred < 10 ==> NextSpecStep(1);                                                  
          invariant pred >= 10 ==> NextSpecStep(2);                                                 
          {                                                                                         
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            tmp3 = pred >= 10;                                                                      
            if (tmp3 /* == pred >= 10 */) {                                                         
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            pred = pred + 1;                                                                        
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class List {                                                                                    
      volatile int x holds(this, tid) ? B : E                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures pred == old(this.x);                                                                
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) < 10;                                                                     
        ensures pred == old(pred) + 1;                                                              
      }*                                                                                            
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) >= 10;                                                                    
      }                                                                                             
      public boolean add(int item) {                                                                
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            pred := this.x;                                                                         
            int tmp1;                                                                               
            tmp1 = 0;                                                                               
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        while (true)                                                                                
          invariant pred < 10 ==> NextSpecStep(1);                                                  
          invariant pred >= 10 ==> NextSpecStep(2);                                                 
          {                                                                                         
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            tmp3 = pred >= 10;                                                                      
            if (tmp3 /* == pred >= 10 */) {                                                         
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            pred = pred + 1;                                                                        
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class List {                                                                                    
      volatile int x holds(this, tid) ? B : E                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures pred == old(this.x);                                                                
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) < 10;                                                                     
        ensures pred == old(pred) + 1;                                                              
      }*                                                                                            
        yield;                                                                                      
      {                                                                                             
        ensures old(pred) >= 10;                                                                    
      }                                                                                             
      public boolean add(int item) {                                                                
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            pred := this.x;                                                                         
            int tmp1;                                                                               
            tmp1 = 0;                                                                               
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        while (true)                                                                                
          invariant pred < 10 ==> NextSpecStep(1);                                                  
          invariant pred >= 10 ==> NextSpecStep(2);                                                 
          {                                                                                         
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            tmp3 = pred >= 10;                                                                      
            if (tmp3 /* == pred >= 10 */) {                                                         
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            pred = pred + 1;                                                                        
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return false;                                                                            
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl List ***/                                                                           
                                                                                                    
type List;                                                                                          
const unique List.null: List;                                                                       
var List._state: [List]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var List.x: [List]int;                                                                              
                                                                                                    
function {:inline} ReadEval.List.x(tid: Tid,this : List,List._state: [List]State,List.x: [List]int,List._lock: [List]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(List._state[this], tid) && List._lock[this] == tid)) then                        
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.List.x(tid: Tid,this : List,newValue: int,List._state: [List]State,List.x: [List]int,List._lock: [List]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(List._state[this], tid) && List._lock[this] == tid)) then                        
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var List._lock: [List]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.List._lock(tid: Tid,this : List,List._state: [List]State,List.x: [List]int,List._lock: [List]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(List._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((List._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((List._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((List._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.List._lock(tid: Tid,this : List,newValue: Tid,List._state: [List]State,List.x: [List]int,List._lock: [List]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(List._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((List._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((List._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((List._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  List.add(tid:Tid, this : List, item : int)                                               
returns ($result : bool)                                                                            
modifies List._state;                                                                               
modifies List.x;                                                                                    
modifies List._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(List._state[this]);                                                                      // (7.5): this is not global
                                                                                                    
requires StateInvariant(List._state, List.x, List._lock);                                           
                                                                                                    
ensures StateInvariant(List._state, List.x, List._lock);                                            
{                                                                                                   
 var item2652043_post: int;                                                                         
 var this2652043_post: List;                                                                        
 var tmp12652004: int;                                                                              
 var tid2652049: Tid;                                                                               
 var pred2652043: int;                                                                              
 var $pc2652043_post: Phase;                                                                        
 var List._lock2652049: [List]Tid;                                                                  
 var List._state2652043_post: [List]State;                                                          
 var item2652049: int;                                                                              
 var List._lock2652009: [List]Tid;                                                                  
 var List._state2652046_bottom: [List]State;                                                        
 var path2652004: int;                                                                              
 var List._lock2652004: [List]Tid;                                                                  
 var phase2652046: Phase;                                                                           
 var item2652046_bottom: int;                                                                       
 var List.x2652049: [List]int;                                                                      
 var item2652046: int;                                                                              
 var $recorded.state2652004: int;                                                                   
 var pred2652043_post: int;                                                                         
 var item2651994: int;                                                                              
 var tid2652046: Tid;                                                                               
 var List.x2652009: [List]int;                                                                      
 var tid2651994: Tid;                                                                               
 var tid2652046_bottom: Tid;                                                                        
 var tid2652043: Tid;                                                                               
 var $pc2651994: Phase;                                                                             
 var $recorded.state2652053: int;                                                                   
 var pred2652004: int;                                                                              
 var this2651994: List;                                                                             
 var $result2652009: bool;                                                                          
 var $recorded.state2651994: int;                                                                   
 var List._lock2652043: [List]Tid;                                                                  
 var List.x2652009_post: [List]int;                                                                 
 var tid2652053: Tid;                                                                               
 var List.x2652043_post: [List]int;                                                                 
 var moverPath2651994: MoverPath;                                                                   
 var this2652004: List;                                                                             
 var tmp2: bool;                                                                                    
 var List._state2652009_post: [List]State;                                                          
 var List._lock2652046_bottom: [List]Tid;                                                           
 var $result2652053: bool;                                                                          
 var $pc2652009: Phase;                                                                             
 var List.x2652053: [List]int;                                                                      
 var List._state2652009: [List]State;                                                               
 var List._state2652004: [List]State;                                                               
 var $pc2652004: Phase;                                                                             
 var item2652004: int;                                                                              
 var pred2652046_bottom: int;                                                                       
 var pred2652009_post: int;                                                                         
 var $recorded.state2652009_post: int;                                                              
 var $result2652049: bool;                                                                          
 var List._state2652049: [List]State;                                                               
 var pred2652053: int;                                                                              
 var $pc2652046_bottom: Phase;                                                                      
 var List._state2651994: [List]State;                                                               
 var $pc2652043: Phase;                                                                             
 var pred2652049: int;                                                                              
 var $pc2652009_post: Phase;                                                                        
 var mover2651994: Mover;                                                                           
 var List._lock2652046: [List]Tid;                                                                  
 var tid2652009_post: Tid;                                                                          
 var item2652009: int;                                                                              
 var List.x2652004: [List]int;                                                                      
 var $recorded.state2652046: int;                                                                   
 var $recorded.state2652009: int;                                                                   
 var $result2652043: bool;                                                                          
 var this2652009: List;                                                                             
 var List._state2652053: [List]State;                                                               
 var List._lock2652009_post: [List]Tid;                                                             
 var pred2651994: int;                                                                              
 var tid2652009: Tid;                                                                               
 var $recorded.state2652043_post: int;                                                              
 var tmp1: int;                                                                                     
 var this2652009_post: List;                                                                        
 var moverPath2652004: MoverPath;                                                                   
 var $pc2652049: Phase;                                                                             
 var this2652046: List;                                                                             
 var item2652043: int;                                                                              
 var List._state2652043: [List]State;                                                               
 var List._state2652046: [List]State;                                                               
 var tmp22652043_post: bool;                                                                        
 var $recorded.state2652049: int;                                                                   
 var mover2652004: Mover;                                                                           
 var path2651994: int;                                                                              
 var $recorded.state2652046_bottom: int;                                                            
 var List.x2652043: [List]int;                                                                      
 var $result2652009_post: bool;                                                                     
 var $result2652046: bool;                                                                          
 var pred2652046: int;                                                                              
 var pred2652009: int;                                                                              
 var $result2651994: bool;                                                                          
 var $recorded.state2652043: int;                                                                   
 var this2652049: List;                                                                             
 var tmp3: bool;                                                                                    
 var List.x2652046_bottom: [List]int;                                                               
 var List._lock2652053: [List]Tid;                                                                  
 var item2652009_post: int;                                                                         
 var tmp22652043: bool;                                                                             
 var this2652053: List;                                                                             
 var List._lock2652043_post: [List]Tid;                                                             
 var List.x2651994: [List]int;                                                                      
 var tid2652004: Tid;                                                                               
 var tmp32652043: bool;                                                                             
 var List.x2652046: [List]int;                                                                      
 var List._lock2651994: [List]Tid;                                                                  
 var tid2652043_post: Tid;                                                                          
 var this2652043: List;                                                                             
 var this2652046_bottom: List;                                                                      
 var $result2652043_post: bool;                                                                     
 var tmp32652043_post: bool;                                                                        
 var pred: int;                                                                                     
 var item2652053: int;                                                                              
 var $result2652046_bottom: bool;                                                                   
 var $result2652004: bool;                                                                          
 var $pc2652053: Phase;                                                                             
 var $pc2652046: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != List.null;                                                                         
 } else {                                                                                           
  assert this != List.null;                                                                                // (23.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume List._lock[this] == Tid.null;                                                               
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (23.22): Reduction failure
 List._lock[this] := tid;                                                                           
                                                                                                    
 // 24.13: pred := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2651994 := ReadEval.List.x(tid: Tid,this: List,List._state,List.x,List._lock);            
 mover2651994 := m#moverPath(moverPath2651994);                                                     
 path2651994 := p#moverPath(moverPath2651994);                                                      
 assume List._state2651994 == List._state && List.x2651994 == List.x && List._lock2651994 == List._lock && pred2651994 == pred && $result2651994 == $result && item2651994 == item && this2651994 == this && tid2651994 == tid && $pc2651994 == $pc;
 assume $recorded.state2651994 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != List.null;                                                                         
 } else {                                                                                           
  assert this != List.null;                                                                                // (24.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2651994);                                                              
 assert $pc != PhaseError;                                                                                 // (24.13): Reduction failure
 pred := List.x[this];                                                                              
                                                                                                    
 // 25.13: int tmp1;                                                                                
                                                                                                    
                                                                                                    
 // 25.13: tmp1 = 0;                                                                                
                                                                                                    
 tmp1 := 0;                                                                                         
                                                                                                    
                                                                                                    
 // 25.13: this.x := tmp1;                                                                          
                                                                                                    
                                                                                                    
 moverPath2652004 := WriteEval.List.x(tid: Tid,this: List,tmp1: int,List._state,List.x,List._lock); 
 mover2652004 := m#moverPath(moverPath2652004);                                                     
 path2652004 := p#moverPath(moverPath2652004);                                                      
 assume List._state2652004 == List._state && List.x2652004 == List.x && List._lock2652004 == List._lock && tmp12652004 == tmp1 && pred2652004 == pred && $result2652004 == $result && item2652004 == item && this2652004 == this && tid2652004 == tid && $pc2652004 == $pc;
 assume $recorded.state2652004 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != List.null;                                                                         
 } else {                                                                                           
  assert this != List.null;                                                                                // (25.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2652004);                                                              
 assert $pc != PhaseError;                                                                                 // (25.13): Reduction failure
 List.x[this] := tmp1;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != List.null;                                                                         
 } else {                                                                                           
  assert this != List.null;                                                                                // (26.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert List._lock[this] == tid;                                                                           // (26.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (26.9): Reduction failure
 List._lock[this] := Tid.null;                                                                      
                                                                                                    
 // 27.9: yield;                                                                                    
                                                                                                    
 assume List._state2652009 == List._state && List.x2652009 == List.x && List._lock2652009 == List._lock && pred2652009 == pred && $result2652009 == $result && item2652009 == item && this2652009 == this && tid2652009 == tid;
 assume $recorded.state2652009 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume List._state2652009_post == List._state && List.x2652009_post == List.x && List._lock2652009_post == List._lock && pred2652009_post == pred && $result2652009_post == $result && item2652009_post == item && this2652009_post == this && tid2652009_post == tid;
 assume $recorded.state2652009_post == 1;                                                           
 assume List._state2652046 == List._state && List.x2652046 == List.x && List._lock2652046 == List._lock && pred2652046 == pred && $result2652046 == $result && item2652046 == item && this2652046 == this && tid2652046 == tid;
 assume $recorded.state2652046 == 1;                                                                
                                                                                                    
 // 28.10: while (true)                                                                             
                                                                                                    
 phase2652046 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (7.5): Bad tid
  invariant isShared(List._state[this]);                                                                   // (7.5): this is not global
                                                                                                    
  invariant StateInvariant(List._state, List.x, List._lock);                                        
  invariant ((pred<10)==>true);                                                                     
  invariant ((pred>=10)==>true);                                                                    
  invariant (forall _this : List :: Invariant.Y_List.x(tid : Tid, _this, List.x[_this] ,List._state2652046,List.x2652046,List._lock2652046));       // (28.10): Loop does not preserve yields_as annotation for field x
  invariant phase2652046 == $pc;                                                                           // (28.10): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (28.10): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 28.17: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 28.17: tmp2 = true;                                                                            
                                                                                                    
  tmp2 := true;                                                                                     
  if (!(tmp2)) {                                                                                    
                                                                                                    
   // 28.10: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 32.13: boolean tmp3;                                                                           
                                                                                                    
                                                                                                    
  // 32.13: tmp3 = pred >= 10;                                                                      
                                                                                                    
  tmp3 := (pred>=10);                                                                               
  if (tmp3 /* lowered (pred>=10) */) {                                                              
                                                                                                    
   // 33.15: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 35.13: pred = pred + 1;                                                                        
                                                                                                    
  pred := (pred+1);                                                                                 
                                                                                                    
  // 36.13: yield;                                                                                  
                                                                                                    
  assume List._state2652043 == List._state && List.x2652043 == List.x && List._lock2652043 == List._lock && tmp32652043 == tmp3 && tmp22652043 == tmp2 && pred2652043 == pred && $result2652043 == $result && item2652043 == item && this2652043 == this && tid2652043 == tid;
  assume $recorded.state2652043 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume List._state2652043_post == List._state && List.x2652043_post == List.x && List._lock2652043_post == List._lock && tmp32652043_post == tmp3 && tmp22652043_post == tmp2 && pred2652043_post == pred && $result2652043_post == $result && item2652043_post == item && this2652043_post == this && tid2652043_post == tid;
  assume $recorded.state2652043_post == 1;                                                          
  assume List._state2652046_bottom == List._state && List.x2652046_bottom == List.x && List._lock2652046_bottom == List._lock && pred2652046_bottom == pred && $result2652046_bottom == $result && item2652046_bottom == item && this2652046_bottom == this && tid2652046_bottom == tid;
  assume $recorded.state2652046_bottom == 1;                                                        
  assert phase2652046 == $pc;                                                                              // (28.10): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 38.10:  return false;                                                                           
                                                                                                    
 assume List._state2652049 == List._state && List.x2652049 == List.x && List._lock2652049 == List._lock && pred2652049 == pred && $result2652049 == $result && item2652049 == item && this2652049 == this && tid2652049 == tid;
 assume $recorded.state2652049 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
                                                                                                    
 // 22.34: // return false;                                                                         
                                                                                                    
 assume List._state2652053 == List._state && List.x2652053 == List.x && List._lock2652053 == List._lock && pred2652053 == pred && $result2652053 == $result && item2652053 == item && this2652053 == this && tid2652053 == tid;
 assume $recorded.state2652053 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(List._state: [List]State,List.x: [List]int,List._lock: [List]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: List  :: _i == List.null <==> isNull(List._state[_i])) &&                             
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)              
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 List.x[x] := v;                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.List.x(u: Tid,x: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): List.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)               
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 List.x[x] := v;                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.List.x(u: Tid,x: List,List._state,List.x,List._lock);                         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): List.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)               
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == List.x[x];                                                                             
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 List.x[x] := havocValue;                                                                           
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.List.x(u: Tid,x: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): List.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)                
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == List.x[x];                                                                             
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.List.x(u: Tid,x: List,List._state,List.x,List._lock);                         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): List.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)                    
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.List.x(t: Tid,x: List,List._state,List.x,List._lock);                         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.List.x(u: Tid,x: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): List.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.List.x(t: Tid, u: Tid, v: int, w: int, x: List)                     
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[x], u);                                                          
 modifies List.x;                                                                                   
                                                                                                    
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
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == List.x[x];                                                                             
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.List.x(t: Tid,x: List,List._state,List.x,List._lock);                         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 List.x[x] := havocValue;                                                                           
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.List.x(u: Tid,x: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): List.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.List.x.List.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: List, y: List)  
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[y], u);                                                          
 modifies List.x;                                                                                   
 modifies List.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: List;                                                                                   
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: List;                                                                                  
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 List.x[x] := v;                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);            
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.List.x.List.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: List, y: List)  
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[y], u);                                                          
 modifies List.x;                                                                                   
 modifies List.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: List;                                                                                   
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: List;                                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var List._lock_mid: [List]Tid;                                                                     
 var w_mid: int;                                                                                    
 var List._state_mid: [List]State;                                                                  
 var y_mid: List;                                                                                   
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var List.x_mid: [List]int;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: List;                                                                                  
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := List.x[x];                                                                                 
 List.x[x] := v;                                                                                    
                                                                                                    
 assume List._state_mid == List._state && List.x_mid == List.x && List._lock_mid == List._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 List.x[x] := tmpV;                                                                                 
 List.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);            
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.List.x.List.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: List, y: List) 
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[y], u);                                                          
 modifies List.x;                                                                                   
 modifies List.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: List;                                                                                   
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: List;                                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var List._lock_mid: [List]Tid;                                                                     
 var w_mid: int;                                                                                    
 var List._state_mid: [List]State;                                                                  
 var y_mid: List;                                                                                   
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var List.x_mid: [List]int;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: List;                                                                                  
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := List.x[x];                                                                                 
 List.x[x] := v;                                                                                    
 assume List._state_mid == List._state && List.x_mid == List.x && List._lock_mid == List._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);            
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 List.x[x] := tmpV;                                                                                 
 List.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);            
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): List.x is not Write-Write Stable with respect to List.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.List.x.List.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: List, y: List)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[y], u);                                                          
 modifies List.x;                                                                                   
 modifies List.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: List;                                                                                   
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: List;                                                                                  
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.List.x(t: Tid,x: List,List._state,List.x,List._lock);                         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.List.x(u: Tid,y: List,w: int,List._state,List.x,List._lock);                
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 List.x[y] := w;                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.List.x(t: Tid,x: List,List._state,List.x,List._lock);                     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): List.x is not Read-Write Stable with respect to List.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): List.x is not Read-Write Stable with respect to List.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): List.x is not Read-Write Stable with respect to List.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.List.x.List.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: List, y: List)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(List._state[x], t);                                                          
 requires isAccessible(List._state[y], u);                                                          
 modifies List.x;                                                                                   
 modifies List.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: List;                                                                                   
 var List.x_pre: [List]int;                                                                         
 var w_pre: int;                                                                                    
 var List._state_pre: [List]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: List;                                                                                   
 var List._lock_pre: [List]Tid;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var List._lock_post: [List]Tid;                                                                    
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: List;                                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: List;                                                                                  
 var List._state_post: [List]State;                                                                 
 var List.x_post: [List]int;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.List.x(u: Tid,y: List,List._state,List.x,List._lock);                         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.List.x(t: Tid,x: List,v: int,List._state,List.x,List._lock);                
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 List.x[x] := v;                                                                                    
 assume List._state_post == List._state && List.x_post == List.x && List._lock_post == List._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.List.x(u: Tid,y: List,List._state,List.x,List._lock);                     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): List.x is not Write-Read Stable with respect to List.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): List.x is not Write-Read Stable with respect to List.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): List.x is not Write-Read Stable with respect to List.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(List._state, List.x, List._lock);                                           
requires ValidTid(tid);                                                                             
modifies List._state;                                                                               
modifies List.x;                                                                                    
modifies List._lock;                                                                                
ensures StateInvariant(List._state, List.x, List._lock);                                            
ensures Y(tid , old(List._state), old(List.x), old(List._lock) , List._state, List.x, List._lock);  
                                                                                                    
// List.x:                                                                                          
                                                                                                    
function {:inline} Y_List.x(tid : Tid, this: List, newValue: int , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid): bool
{                                                                                                   
 ((isAccessible(List._state[this], tid) && leq(m#moverPath(ReadEval.List.x(tid: Tid,this: List,List._state,List.x,List._lock)), _R)) ==> (List.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_List.x(tid : Tid, this: List, newValue: int , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_List.x.Subsumes.W(tid : Tid, u : Tid, this: List, newValue: int , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var List.x_yield: [List]int;                                                                        
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var List._lock_yield: [List]Tid;                                                                    
var List._state_yield: [List]State;                                                                 
var $recorded.state_yield: int;                                                                     
var this_yield: List;                                                                               
                                                                                                    
 assume isAccessible(List._state[this], tid);                                                       
 assume isAccessible(List._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.List.x(u: Tid,this: List,newValue: int,List._state,List.x,List._lock)));
                                                                                                    
assume List._state_yield == List._state && List.x_yield == List.x && List._lock_yield == List._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_List.x(tid, this, newValue , List._state, List.x, List._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_List.x.Reflexive(tid : Tid, this: List , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var List.x_yield: [List]int;                                                                        
var $pc_yield: Phase;                                                                               
var List._lock_yield: [List]Tid;                                                                    
var List._state_yield: [List]State;                                                                 
var $recorded.state_yield: int;                                                                     
var this_yield: List;                                                                               
                                                                                                    
 assume isAccessible(List._state[this], tid);                                                       
assume List._state_yield == List._state && List.x_yield == List.x && List._lock_yield == List._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_List.x(tid, this, List.x[this] , List._state, List.x, List._lock);                        
}                                                                                                   
                                                                                                    
procedure Y_List.x.Transitive(tid : Tid, this: List, newValue : int , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid , List._state_p: [List]State, List.x_p: [List]int, List._lock_p: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires StateInvariant(List._state_p, List.x_p, List._lock_p);                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var List.x_pre: [List]int;                                                                          
var tid_pre: Tid;                                                                                   
var List._state_pre: [List]State;                                                                   
var $pc_pre: Phase;                                                                                 
var List._lock_pre: [List]Tid;                                                                      
var this_pre: List;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var List._lock_post: [List]Tid;                                                                     
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: List;                                                                                
var tid_post: Tid;                                                                                  
var List._state_post: [List]State;                                                                  
var List.x_post: [List]int;                                                                         
                                                                                                    
assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(List._state[this], tid);                                                       
 assume Y(tid , List._state, List.x, List._lock , List._state_p, List.x_p, List._lock_p);           
 assume Y_List.x(tid, this, newValue , List._state_p, List.x_p, List._lock_p);                      
assume List._state_post == List._state_p && List.x_post == List.x_p && List._lock_post == List._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_List.x(tid, this, newValue , List._state, List.x, List._lock);                            
}                                                                                                   
// List._lock:                                                                                      
                                                                                                    
function {:inline} Y_List._lock(tid : Tid, this: List, newValue: Tid , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid): bool
{                                                                                                   
 ((isAccessible(List._state[this], tid) && leq(m#moverPath(ReadEval.List._lock(tid: Tid,this: List,List._state,List.x,List._lock)), _R)) ==> (List._lock[this] == newValue))
 &&(((List._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_List._lock(tid : Tid, this: List, newValue: Tid , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_List._lock.Subsumes.W(tid : Tid, u : Tid, this: List, newValue: Tid , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var List.x_yield: [List]int;                                                                        
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var List._lock_yield: [List]Tid;                                                                    
var List._state_yield: [List]State;                                                                 
var $recorded.state_yield: int;                                                                     
var this_yield: List;                                                                               
                                                                                                    
 assume isAccessible(List._state[this], tid);                                                       
 assume isAccessible(List._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.List._lock(u: Tid,this: List,newValue: Tid,List._state,List.x,List._lock)));
 assume leq(m#moverPath(ReadEval.List._lock(tid: Tid,this: List,List._state,List.x,List._lock)), _N);
assume List._state_yield == List._state && List.x_yield == List.x && List._lock_yield == List._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_List._lock(tid, this, newValue , List._state, List.x, List._lock);                        
}                                                                                                   
                                                                                                    
procedure Y_List._lock.Reflexive(tid : Tid, this: List , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var List.x_yield: [List]int;                                                                        
var $pc_yield: Phase;                                                                               
var List._lock_yield: [List]Tid;                                                                    
var List._state_yield: [List]State;                                                                 
var $recorded.state_yield: int;                                                                     
var this_yield: List;                                                                               
                                                                                                    
 assume isAccessible(List._state[this], tid);                                                       
assume List._state_yield == List._state && List.x_yield == List.x && List._lock_yield == List._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_List._lock(tid, this, List._lock[this] , List._state, List.x, List._lock);                
}                                                                                                   
                                                                                                    
procedure Y_List._lock.Transitive(tid : Tid, this: List, newValue : Tid , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid , List._state_p: [List]State, List.x_p: [List]int, List._lock_p: [List]Tid)
 requires StateInvariant(List._state, List.x, List._lock);                                          
 requires StateInvariant(List._state_p, List.x_p, List._lock_p);                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var List.x_pre: [List]int;                                                                          
var tid_pre: Tid;                                                                                   
var List._state_pre: [List]State;                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var List._lock_pre: [List]Tid;                                                                      
var this_pre: List;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var List._lock_post: [List]Tid;                                                                     
var $pc_post: Phase;                                                                                
var this_post: List;                                                                                
var tid_post: Tid;                                                                                  
var List._state_post: [List]State;                                                                  
var newValue_post: Tid;                                                                             
var List.x_post: [List]int;                                                                         
                                                                                                    
assume List._state_pre == List._state && List.x_pre == List.x && List._lock_pre == List._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(List._state[this], tid);                                                       
 assume Y(tid , List._state, List.x, List._lock , List._state_p, List.x_p, List._lock_p);           
 assume Y_List._lock(tid, this, newValue , List._state_p, List.x_p, List._lock_p);                  
assume List._state_post == List._state_p && List.x_post == List.x_p && List._lock_post == List._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_List._lock(tid, this, newValue , List._state, List.x, List._lock);                        
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , List._state: [List]State, List.x: [List]int, List._lock: [List]Tid , List._state_p: [List]State, List.x_p: [List]int, List._lock_p: [List]Tid): bool
{                                                                                                   
 (forall this: List :: Y_List.x(tid : Tid, this, List.x_p[this] , List._state, List.x, List._lock)) 
 && (forall this: List :: Y_List._lock(tid : Tid, this, List._lock_p[this] , List._state, List.x, List._lock))
 && (forall _i : List :: isShared(List._state[_i]) ==> isShared(List._state_p[_i]))                 
 && (forall _i : List :: isLocal(List._state[_i], tid) <==> isLocal(List._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 596.1-879.2: (Method:7.5)
// 604.1-604.24: (7.5): Bad tid
// 605.1-605.38: (7.5): this is not global
// 735.1-735.28: (23.22): Cannot have potential null deference in left-mover part.
// 739.1-739.27: (23.22): Reduction failure
// 741.2-758.23: (class anchor.sink.Read:24.13)
// 753.1-753.28: (24.13): Cannot have potential null deference in left-mover part.
// 757.1-757.27: (24.13): Reduction failure
// 759.2-761.2: (class anchor.sink.VarDeclStmt:25.13)
// 762.2-765.12: (class anchor.sink.Assign:25.13)
// 767.2-783.23: (class anchor.sink.Write:25.13)
// 779.1-779.28: (25.13): Cannot have potential null deference in left-mover part.
// 782.1-782.27: (25.13): Reduction failure
// 787.1-787.28: (26.9): Cannot have potential null deference in left-mover part.
// 789.1-789.33: (26.9): lock not held
// 791.1-791.27: (26.9): Reduction failure
// 793.2-801.42: (class anchor.sink.Yield:27.9)
// 804.2-808.14: (class anchor.sink.While:28.10)
// 810.1-810.27: (7.5): Bad tid
// 811.1-811.41: (7.5): this is not global
// 813.61-814.32: (28.10): invariant pred < 10 ==> NextSpecStep(1) may not hold
// 814.32-815.33: (28.10): invariant pred >= 10 ==> NextSpecStep(2) may not hold
// 816.1-816.142: (28.10): Loop does not preserve yields_as annotation for field x
// 817.1-817.33: (28.10): Phase must be invariant at loop head
// 818.1-818.30: (28.10): Potentially infinite loop cannot be in post-commit phase.
// 820.3-822.3: (class anchor.sink.VarDeclStmt:28.17)
// 823.3-826.16: (class anchor.sink.Assign:28.17)
// 828.4-831.10: (class anchor.sink.Break:28.10)
// 834.3-836.3: (class anchor.sink.VarDeclStmt:32.13)
// 837.3-840.22: (class anchor.sink.Assign:32.13)
// 842.4-845.10: (class anchor.sink.Break:33.15)
// 848.3-851.20: (class anchor.sink.Assign:35.13)
// 852.3-860.43: (class anchor.sink.Yield:36.13)
// 863.1-863.30: (28.10): Phase must be invariant at loop head
// 865.2-871.9: (class anchor.sink.Return:38.10)
// 872.2-878.9: (class anchor.sink.Return:22.34)
// 953.1-953.34: (5.5): List.x failed Write-Write Right-Mover Check
// 1010.1-1010.30: (5.5): List.x failed Write-Read Right-Mover Check
// 1071.1-1071.34: (5.5): List.x failed Write-Write Left-Mover Check
// 1129.1-1129.30: (5.5): List.x failed Write-Read Left-Mover Check
// 1184.1-1184.34: (5.5): List.x failed Read-Write Right-Mover Check
// 1242.1-1242.34: (5.5): List.x failed Read-Write Left-Mover Check
// 1311.1-1311.140: (5.5): List.x is not Write-Write Stable with respect to List.x (case A.1)
// 1312.1-1312.101: (5.5): List.x is not Write-Write Stable with respect to List.x (case A.2)
// 1313.1-1313.158: (5.5): List.x is not Write-Write Stable with respect to List.x (case A.3)
// 1406.1-1406.140: (5.5): List.x is not Write-Write Stable with respect to List.x (case C)
// 1504.1-1504.144: (5.5): List.x is not Write-Write Stable with respect to List.x (case D)
// 1505.1-1505.144: (5.5): List.x is not Write-Write Stable with respect to List.x (case R)
// 1574.1-1574.136: (5.5): List.x is not Read-Write Stable with respect to List.x (case F)
// 1575.1-1575.136: (5.5): List.x is not Read-Write Stable with respect to List.x (case H)
// 1576.1-1576.146: (5.5): List.x is not Read-Write Stable with respect to List.x (case I)
// 1644.1-1644.136: (5.5): List.x is not Write-Read Stable with respect to List.x (case J)
// 1645.1-1645.136: (5.5): List.x is not Write-Read Stable with respect to List.x (case K)
// 1646.1-1646.99: (5.5): List.x is not Write-Read Stable with respect to List.x (case L)
// 1677.1-1696.2: (5.5): yields_as clause for List.x is not valid
// 1701.1-1715.2: (5.5): yields_as clause for List.x is not reflexive
// 1721.1-1749.2: (5.5): yields_as clause for List.x is not transitive
// 1769.1-1788.2: (7.32): yields_as clause for List._lock is not valid
// 1793.1-1807.2: (7.32): yields_as clause for List._lock is not reflexive
// 1813.1-1841.2: (7.32): yields_as clause for List._lock is not transitive
