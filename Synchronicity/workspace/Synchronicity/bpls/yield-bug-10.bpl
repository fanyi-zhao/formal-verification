                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/yield-bug-10.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Queue {                                                                                   
       int size 0 <= this.size && this.size <= 10                                                   
       ? isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : 0 <= newValue && newValue <= 10                                                          
           ? holds(this, tid) ? B : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= newValue && newValue <= 10;                                                  
                                                                                                    
                                                                                                    
       int capacity isRead ? B : E                                                                  
                                                                                                    
      volatile int size2 0 <= this.size2 && this.size2 <= this.capacity                             
       ? isRead                                                                                     
         ? holds(this, tid)                                                                         
           ? isRead ? B : N                                                                         
           : isRead ? N : E                                                                         
         : 0 <= newValue && newValue <= this.capacity                                               
           ? holds(this, tid)                                                                       
             ? isRead ? B : N                                                                       
             : isRead ? N : E                                                                       
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= this.size2 && this.size2 <= this.capacity ==> 0 <= newValue && newValue <= this.capacity;
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.size == 0;                                                                      
        assume this.capacity == 0;                                                                  
        assume this.size2 == 0;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Queue {                                                                                   
       int size 0 <= this.size && this.size <= 10                                                   
       ? isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : 0 <= newValue && newValue <= 10                                                          
           ? holds(this, tid) ? B : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= newValue && newValue <= 10;                                                  
                                                                                                    
                                                                                                    
       int capacity isRead ? B : E                                                                  
                                                                                                    
      volatile int size2 0 <= this.size2 && this.size2 <= this.capacity                             
       ? isRead                                                                                     
         ? holds(this, tid) ? B : N                                                                 
         : 0 <= newValue && newValue <= this.capacity                                               
           ? holds(this, tid) ? N : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= this.size2 && this.size2 <= this.capacity ==> 0 <= newValue && newValue <= this.capacity;
                                                                                                    
                                                                                                    
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
        assume this.size == 0;                                                                      
        assume this.capacity == 0;                                                                  
        assume this.size2 == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Queue {                                                                                   
       int size 0 <= this.size && this.size <= 10                                                   
       ? isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : 0 <= newValue && newValue <= 10                                                          
           ? holds(this, tid) ? B : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= newValue && newValue <= 10;                                                  
                                                                                                    
                                                                                                    
       int capacity isRead ? B : E                                                                  
                                                                                                    
      volatile int size2 0 <= this.size2 && this.size2 <= this.capacity                             
       ? isRead                                                                                     
         ? holds(this, tid) ? B : N                                                                 
         : 0 <= newValue && newValue <= this.capacity                                               
           ? holds(this, tid) ? N : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= this.size2 && this.size2 <= this.capacity ==> 0 <= newValue && newValue <= this.capacity;
                                                                                                    
                                                                                                    
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
        assume this.size == 0;                                                                      
        assume this.capacity == 0;                                                                  
        assume this.size2 == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Queue {                                                                                   
       int size 0 <= this.size && this.size <= 10                                                   
       ? isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : 0 <= newValue && newValue <= 10                                                          
           ? holds(this, tid) ? B : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= newValue && newValue <= 10;                                                  
                                                                                                    
                                                                                                    
       int capacity isRead ? B : E                                                                  
                                                                                                    
      volatile int size2 0 <= this.size2 && this.size2 <= this.capacity                             
       ? isRead                                                                                     
         ? holds(this, tid) ? B : N                                                                 
         : 0 <= newValue && newValue <= this.capacity                                               
           ? holds(this, tid) ? N : E                                                               
           : E                                                                                      
       : E                                                                                          
        yields_as 0 <= this.size2 && this.size2 <= this.capacity ==> 0 <= newValue && newValue <= this.capacity;
                                                                                                    
                                                                                                    
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
        assume this.size == 0;                                                                      
        assume this.capacity == 0;                                                                  
        assume this.size2 == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Queue ***/                                                                          
                                                                                                    
type Queue;                                                                                         
const unique Queue.null: Queue;                                                                     
var Queue._state: [Queue]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue.size: [Queue]int;                                                                         
                                                                                                    
function {:inline} ReadEval.Queue.size(tid: Tid,this : Queue,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (((0<=Queue.size[this])&&(Queue.size[this]<=10))) then                                          
  if (isRead) then                                                                                  
   if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                    
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_E, 3)                                                                                
  else                                                                                              
   if (((0<=newValue)&&(newValue<=10))) then                                                        
    if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                   
     moverPath(_B, 13)                                                                              
    else                                                                                            
     moverPath(_E, 5)                                                                               
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue.size(tid: Tid,this : Queue,newValue: int,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (((0<=Queue.size[this])&&(Queue.size[this]<=10))) then                                          
  if (isRead) then                                                                                  
   if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                    
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_E, 3)                                                                                
  else                                                                                              
   if (((0<=newValue)&&(newValue<=10))) then                                                        
    if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                   
     moverPath(_B, 13)                                                                              
    else                                                                                            
     moverPath(_E, 5)                                                                               
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue.capacity: [Queue]int;                                                                     
                                                                                                    
function {:inline} ReadEval.Queue.capacity(tid: Tid,this : Queue,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue.capacity(tid: Tid,this : Queue,newValue: int,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue.size2: [Queue]int;                                                                        
                                                                                                    
function {:inline} ReadEval.Queue.size2(tid: Tid,this : Queue,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (((0<=Queue.size2[this])&&(Queue.size2[this]<=Queue.capacity[this]))) then                      
  if (isRead) then                                                                                  
   if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                    
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (((0<=newValue)&&(newValue<=Queue.capacity[this]))) then                                      
    if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                   
     moverPath(_N, 13)                                                                              
    else                                                                                            
     moverPath(_E, 5)                                                                               
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue.size2(tid: Tid,this : Queue,newValue: int,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (((0<=Queue.size2[this])&&(Queue.size2[this]<=Queue.capacity[this]))) then                      
  if (isRead) then                                                                                  
   if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                    
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (((0<=newValue)&&(newValue<=Queue.capacity[this]))) then                                      
    if ((isAccessible(Queue._state[this], tid) && Queue._lock[this] == tid)) then                   
     moverPath(_N, 13)                                                                              
    else                                                                                            
     moverPath(_E, 5)                                                                               
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue._lock: [Queue]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Queue._lock(tid: Tid,this : Queue,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Queue._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Queue._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Queue._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Queue._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue._lock(tid: Tid,this : Queue,newValue: Tid,Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Queue._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Queue._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Queue._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Queue._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Queue._state: [Queue]State,Queue.size: [Queue]int,Queue.capacity: [Queue]int,Queue.size2: [Queue]int,Queue._lock: [Queue]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Queue  :: _i == Queue.null <==> isNull(Queue._state[_i])) &&                          
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)         
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.size(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Queue.size failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)          
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Queue.size(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Queue.size failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)          
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.size[x];                                                                         
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Queue.size[x] := havocValue;                                                                       
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.size(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Queue.size failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)           
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.size[x];                                                                         
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Queue.size(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Queue.size failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)               
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Queue.size(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Queue.size failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Queue.size(t: Tid, u: Tid, v: int, w: int, x: Queue)                
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Queue.size[x];                                                                         
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Queue.size[x] := havocValue;                                                                       
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Queue.size(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Queue.size failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)     
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.capacity(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.capacity failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)      
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Queue.capacity(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (12.5): Queue.capacity failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)      
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.capacity[x];                                                                     
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Queue.capacity[x] := havocValue;                                                                   
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.capacity(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.capacity failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)       
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.capacity[x];                                                                     
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Queue.capacity(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): Queue.capacity failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)           
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Queue.capacity(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.capacity failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Queue.capacity(t: Tid, u: Tid, v: int, w: int, x: Queue)            
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.capacity;                                                                           
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Queue.capacity[x];                                                                     
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Queue.capacity[x] := havocValue;                                                                   
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Queue.capacity(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.capacity failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)        
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.size2(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (16.5): Queue.size2 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)         
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Queue.size2(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (16.5): Queue.size2 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)         
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.size2[x];                                                                        
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Queue.size2[x] := havocValue;                                                                      
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.size2(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (16.5): Queue.size2 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)          
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Queue.size2[x];                                                                        
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Queue.size2(u: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (16.5): Queue.size2 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)              
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Queue.size2(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (16.5): Queue.size2 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Queue.size2(t: Tid, u: Tid, v: int, w: int, x: Queue)               
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.size2;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Queue.size2[x];                                                                        
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Queue.size2[x] := havocValue;                                                                      
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Queue.size2(u: Tid,x: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (16.5): Queue.size2 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[y] := w;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[y] := w;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size[x];                                                                             
 Queue.size[x] := v;                                                                                
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size[x] := tmpV;                                                                             
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[y] := w;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size;                                                                               
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[x] := v;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.capacity.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.capacity.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.capacity.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.capacity.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[y] := w;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.capacity.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.capacity.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.capacity.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.capacity.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.capacity.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[y] := w;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.capacity.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.capacity.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.capacity.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.capacity.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.capacity[x];                                                                         
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.capacity[x] := tmpV;                                                                         
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.capacity.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[y] := w;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.capacity(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.capacity.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.capacity;                                                                           
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.capacity(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[x] := v;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size2.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size2.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size2.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.size[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size2.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size[y] := w;                                                                                
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size2.Queue.size(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size;                                                                               
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size2.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size2.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size2.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.capacity[y] := w;                                                                            
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size2.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.capacity(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.capacity[y] := w;                                                                            
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size2.Queue.capacity(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.capacity;                                                                           
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.capacity(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.size2.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.size2.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
                                                                                                    
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.size2.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Queue.capacity_mid: [Queue]int;                                                                
 var Queue.size2_mid: [Queue]int;                                                                   
 var v_mid: int;                                                                                    
 var Queue.size_mid: [Queue]int;                                                                    
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.size2[x];                                                                            
 Queue.size2[x] := v;                                                                               
 assume Queue._state_mid == Queue._state && Queue.size_mid == Queue.size && Queue.capacity_mid == Queue.capacity && Queue.size2_mid == Queue.size2 && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.size2[x] := tmpV;                                                                            
 Queue.size2[y] := w;                                                                               
 _writeByTPost := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.size2.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.size2(u: Tid,y: Queue,w: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[y] := w;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.size2(t: Tid,x: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.size2.Queue.size2(t: Tid, u: Tid, v: int, w: int, w0: int, x: Queue, y: Queue)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.size2;                                                                              
 modifies Queue.size2;                                                                              
                                                                                                    
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
 var Queue.size2_pre: [Queue]int;                                                                   
 var x_pre: Queue;                                                                                  
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w_pre: int;                                                                                    
 var Queue.capacity_pre: [Queue]int;                                                                
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Queue.size_pre: [Queue]int;                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Queue.size_post: [Queue]int;                                                                   
 var Queue.capacity_post: [Queue]int;                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Queue;                                                                                 
 var Queue._state_post: [Queue]State;                                                               
 var Queue.size2_post: [Queue]int;                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.size2(t: Tid,x: Queue,v: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.size2[x] := v;                                                                               
 assume Queue._state_post == Queue._state && Queue.size_post == Queue.size && Queue.capacity_post == Queue.capacity && Queue.size2_post == Queue.size2 && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.size2(u: Tid,y: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);        
requires ValidTid(tid);                                                                             
modifies Queue._state;                                                                              
modifies Queue.size;                                                                                
modifies Queue.capacity;                                                                            
modifies Queue.size2;                                                                               
modifies Queue._lock;                                                                               
ensures StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);         
ensures Y(tid , old(Queue._state), old(Queue.size), old(Queue.capacity), old(Queue.size2), old(Queue._lock) , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
                                                                                                    
// Queue.size:                                                                                      
                                                                                                    
function {:inline} Y_Queue.size(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue.size(tid: Tid,this: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)), _R)) ==> (Queue.size[this] == newValue))
 &&(((0<=newValue)&&(newValue<=10)))                                                                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue.size(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue.size.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Queue.size_yield: [Queue]int;                                                                   
var u_yield: Tid;                                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue.size(u: Tid,this: Queue,newValue: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)));
                                                                                                    
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.size(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.size.Reflexive(tid : Tid, this: Queue , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Queue.size_yield: [Queue]int;                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.size(tid, this, Queue.size[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.size.Transitive(tid : Tid, this: Queue, newValue : int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid , Queue._state_p: [Queue]State, Queue.size_p: [Queue]int, Queue.capacity_p: [Queue]int, Queue.size2_p: [Queue]int, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires StateInvariant(Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.size2_pre: [Queue]int;                                                                    
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Queue._lock_pre: [Queue]Tid;                                                                    
var tid_pre: Tid;                                                                                   
var Queue.capacity_pre: [Queue]int;                                                                 
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var this_pre: Queue;                                                                                
var Queue.size_pre: [Queue]int;                                                                     
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Queue.size_post: [Queue]int;                                                                    
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Queue.capacity_post: [Queue]int;                                                                
var Queue._state_post: [Queue]State;                                                                
var Queue.size2_post: [Queue]int;                                                                   
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 assume Y_Queue.size(tid, this, newValue , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
assume Queue._state_post == Queue._state_p && Queue.size_post == Queue.size_p && Queue.capacity_post == Queue.capacity_p && Queue.size2_post == Queue.size2_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue.size(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
// Queue.capacity:                                                                                  
                                                                                                    
function {:inline} Y_Queue.capacity(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue.capacity(tid: Tid,this: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)), _R)) ==> (Queue.capacity[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue.capacity(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue.capacity.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Queue.size_yield: [Queue]int;                                                                   
var u_yield: Tid;                                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue.capacity(u: Tid,this: Queue,newValue: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)));
                                                                                                    
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.capacity(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.capacity.Reflexive(tid : Tid, this: Queue , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Queue.size_yield: [Queue]int;                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.capacity(tid, this, Queue.capacity[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.capacity.Transitive(tid : Tid, this: Queue, newValue : int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid , Queue._state_p: [Queue]State, Queue.size_p: [Queue]int, Queue.capacity_p: [Queue]int, Queue.size2_p: [Queue]int, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires StateInvariant(Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.size2_pre: [Queue]int;                                                                    
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Queue._lock_pre: [Queue]Tid;                                                                    
var tid_pre: Tid;                                                                                   
var Queue.capacity_pre: [Queue]int;                                                                 
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var this_pre: Queue;                                                                                
var Queue.size_pre: [Queue]int;                                                                     
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Queue.size_post: [Queue]int;                                                                    
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Queue.capacity_post: [Queue]int;                                                                
var Queue._state_post: [Queue]State;                                                                
var Queue.size2_post: [Queue]int;                                                                   
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 assume Y_Queue.capacity(tid, this, newValue , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
assume Queue._state_post == Queue._state_p && Queue.size_post == Queue.size_p && Queue.capacity_post == Queue.capacity_p && Queue.size2_post == Queue.size2_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue.capacity(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
// Queue.size2:                                                                                     
                                                                                                    
function {:inline} Y_Queue.size2(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue.size2(tid: Tid,this: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)), _R)) ==> (Queue.size2[this] == newValue))
 &&((((0<=Queue.size2[this])&&(Queue.size2[this]<=Queue.capacity[this]))==>((0<=newValue)&&(newValue<=Queue.capacity[this]))))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue.size2(tid : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue.size2.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Queue.size_yield: [Queue]int;                                                                   
var u_yield: Tid;                                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue.size2(u: Tid,this: Queue,newValue: int,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)));
                                                                                                    
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.size2(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.size2.Reflexive(tid : Tid, this: Queue , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Queue.size_yield: [Queue]int;                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.size2(tid, this, Queue.size2[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.size2.Transitive(tid : Tid, this: Queue, newValue : int , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid , Queue._state_p: [Queue]State, Queue.size_p: [Queue]int, Queue.capacity_p: [Queue]int, Queue.size2_p: [Queue]int, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires StateInvariant(Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.size2_pre: [Queue]int;                                                                    
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Queue._lock_pre: [Queue]Tid;                                                                    
var tid_pre: Tid;                                                                                   
var Queue.capacity_pre: [Queue]int;                                                                 
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var this_pre: Queue;                                                                                
var Queue.size_pre: [Queue]int;                                                                     
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Queue.size_post: [Queue]int;                                                                    
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Queue.capacity_post: [Queue]int;                                                                
var Queue._state_post: [Queue]State;                                                                
var Queue.size2_post: [Queue]int;                                                                   
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 assume Y_Queue.size2(tid, this, newValue , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
assume Queue._state_post == Queue._state_p && Queue.size_post == Queue.size_p && Queue.capacity_post == Queue.capacity_p && Queue.size2_post == Queue.size2_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue.size2(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
// Queue._lock:                                                                                     
                                                                                                    
function {:inline} Y_Queue._lock(tid : Tid, this: Queue, newValue: Tid , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue._lock(tid: Tid,this: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)), _R)) ==> (Queue._lock[this] == newValue))
 &&(((Queue._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue._lock(tid : Tid, this: Queue, newValue: Tid , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: Tid , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Queue.size_yield: [Queue]int;                                                                   
var u_yield: Tid;                                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue._lock(u: Tid,this: Queue,newValue: Tid,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)));
 assume leq(m#moverPath(ReadEval.Queue._lock(tid: Tid,this: Queue,Queue._state,Queue.size,Queue.capacity,Queue.size2,Queue._lock)), _N);
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue._lock(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Reflexive(tid : Tid, this: Queue , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue._state_yield: [Queue]State;                                                               
var Queue.size2_yield: [Queue]int;                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Queue.size_yield: [Queue]int;                                                                   
var Queue._lock_yield: [Queue]Tid;                                                                  
var Queue.capacity_yield: [Queue]int;                                                               
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Queue._state_yield == Queue._state && Queue.size_yield == Queue.size && Queue.capacity_yield == Queue.capacity && Queue.size2_yield == Queue.size2 && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue._lock(tid, this, Queue._lock[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Transitive(tid : Tid, this: Queue, newValue : Tid , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid , Queue._state_p: [Queue]State, Queue.size_p: [Queue]int, Queue.capacity_p: [Queue]int, Queue.size2_p: [Queue]int, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);       
 requires StateInvariant(Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.size2_pre: [Queue]int;                                                                    
var $recorded.state_pre: int;                                                                       
var Queue._lock_pre: [Queue]Tid;                                                                    
var tid_pre: Tid;                                                                                   
var Queue.capacity_pre: [Queue]int;                                                                 
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var this_pre: Queue;                                                                                
var Queue.size_pre: [Queue]int;                                                                     
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Queue.size_post: [Queue]int;                                                                    
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Queue.capacity_post: [Queue]int;                                                                
var Queue._state_post: [Queue]State;                                                                
var newValue_post: Tid;                                                                             
var Queue.size2_post: [Queue]int;                                                                   
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Queue._state_pre == Queue._state && Queue.size_pre == Queue.size && Queue.capacity_pre == Queue.capacity && Queue.size2_pre == Queue.size2 && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
 assume Y_Queue._lock(tid, this, newValue , Queue._state_p, Queue.size_p, Queue.capacity_p, Queue.size2_p, Queue._lock_p);
assume Queue._state_post == Queue._state_p && Queue.size_post == Queue.size_p && Queue.capacity_post == Queue.capacity_p && Queue.size2_post == Queue.size2_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue._lock(tid, this, newValue , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Queue._state: [Queue]State, Queue.size: [Queue]int, Queue.capacity: [Queue]int, Queue.size2: [Queue]int, Queue._lock: [Queue]Tid , Queue._state_p: [Queue]State, Queue.size_p: [Queue]int, Queue.capacity_p: [Queue]int, Queue.size2_p: [Queue]int, Queue._lock_p: [Queue]Tid): bool
{                                                                                                   
 (forall this: Queue :: Y_Queue.size(tid : Tid, this, Queue.size_p[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock))
 && (forall this: Queue :: Y_Queue.capacity(tid : Tid, this, Queue.capacity_p[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock))
 && (forall this: Queue :: Y_Queue.size2(tid : Tid, this, Queue.size2_p[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock))
 && (forall this: Queue :: Y_Queue._lock(tid : Tid, this, Queue._lock_p[this] , Queue._state, Queue.size, Queue.capacity, Queue.size2, Queue._lock))
 && (forall _i : Queue :: isShared(Queue._state[_i]) ==> isShared(Queue._state_p[_i]))              
 && (forall _i : Queue :: isLocal(Queue._state[_i], tid) <==> isLocal(Queue._state_p[_i], tid))     
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 641.1-641.34: (5.5): Queue.size failed Write-Write Right-Mover Check
// 702.1-702.30: (5.5): Queue.size failed Write-Read Right-Mover Check
// 767.1-767.34: (5.5): Queue.size failed Write-Write Left-Mover Check
// 829.1-829.30: (5.5): Queue.size failed Write-Read Left-Mover Check
// 888.1-888.34: (5.5): Queue.size failed Read-Write Right-Mover Check
// 950.1-950.34: (5.5): Queue.size failed Read-Write Left-Mover Check
// 1011.1-1011.34: (12.5): Queue.capacity failed Write-Write Right-Mover Check
// 1072.1-1072.30: (12.5): Queue.capacity failed Write-Read Right-Mover Check
// 1137.1-1137.34: (12.5): Queue.capacity failed Write-Write Left-Mover Check
// 1199.1-1199.30: (12.5): Queue.capacity failed Write-Read Left-Mover Check
// 1258.1-1258.34: (12.5): Queue.capacity failed Read-Write Right-Mover Check
// 1320.1-1320.34: (12.5): Queue.capacity failed Read-Write Left-Mover Check
// 1381.1-1381.34: (16.5): Queue.size2 failed Write-Write Right-Mover Check
// 1442.1-1442.30: (16.5): Queue.size2 failed Write-Read Right-Mover Check
// 1507.1-1507.34: (16.5): Queue.size2 failed Write-Write Left-Mover Check
// 1569.1-1569.30: (16.5): Queue.size2 failed Write-Read Left-Mover Check
// 1628.1-1628.34: (16.5): Queue.size2 failed Read-Write Right-Mover Check
// 1690.1-1690.34: (16.5): Queue.size2 failed Read-Write Left-Mover Check
// 1763.1-1763.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.1)
// 1764.1-1764.101: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.2)
// 1765.1-1765.158: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case A.3)
// 1864.1-1864.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case C)
// 1968.1-1968.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case D)
// 1969.1-1969.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size (case R)
// 2042.1-2042.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case F)
// 2043.1-2043.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case H)
// 2044.1-2044.146: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size (case I)
// 2116.1-2116.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case J)
// 2117.1-2117.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case K)
// 2118.1-2118.99: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size (case L)
// 2192.1-2192.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.1)
// 2193.1-2193.101: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.2)
// 2194.1-2194.158: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case A.3)
// 2293.1-2293.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case C)
// 2397.1-2397.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case D)
// 2398.1-2398.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case R)
// 2471.1-2471.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case F)
// 2472.1-2472.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case H)
// 2473.1-2473.146: (5.5): Queue.size is not Read-Write Stable with respect to Queue.capacity (case I)
// 2545.1-2545.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case J)
// 2546.1-2546.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case K)
// 2547.1-2547.99: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size (case L)
// 2621.1-2621.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.1)
// 2622.1-2622.101: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.2)
// 2623.1-2623.158: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case A.3)
// 2722.1-2722.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case C)
// 2826.1-2826.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case D)
// 2827.1-2827.144: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case R)
// 2900.1-2900.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case F)
// 2901.1-2901.136: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case H)
// 2902.1-2902.146: (5.5): Queue.size is not Read-Write Stable with respect to Queue.size2 (case I)
// 2974.1-2974.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case J)
// 2975.1-2975.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case K)
// 2976.1-2976.99: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size (case L)
// 3050.1-3050.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.1)
// 3051.1-3051.101: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.2)
// 3052.1-3052.158: (5.5): Queue.size is not Write-Write Stable with respect to Queue.capacity (case A.3)
// 3151.1-3151.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case C)
// 3255.1-3255.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case D)
// 3256.1-3256.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size (case R)
// 3329.1-3329.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case F)
// 3330.1-3330.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case H)
// 3331.1-3331.146: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size (case I)
// 3403.1-3403.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case J)
// 3404.1-3404.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case K)
// 3405.1-3405.99: (5.5): Queue.size is not Write-Read Stable with respect to Queue.capacity (case L)
// 3479.1-3479.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.1)
// 3480.1-3480.101: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.2)
// 3481.1-3481.158: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case A.3)
// 3580.1-3580.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case C)
// 3684.1-3684.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case D)
// 3685.1-3685.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.capacity (case R)
// 3758.1-3758.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case F)
// 3759.1-3759.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case H)
// 3760.1-3760.146: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.capacity (case I)
// 3832.1-3832.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case J)
// 3833.1-3833.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case K)
// 3834.1-3834.99: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.capacity (case L)
// 3908.1-3908.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.1)
// 3909.1-3909.101: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.2)
// 3910.1-3910.158: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case A.3)
// 4009.1-4009.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case C)
// 4113.1-4113.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case D)
// 4114.1-4114.144: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case R)
// 4187.1-4187.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case F)
// 4188.1-4188.136: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case H)
// 4189.1-4189.146: (12.5): Queue.capacity is not Read-Write Stable with respect to Queue.size2 (case I)
// 4261.1-4261.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case J)
// 4262.1-4262.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case K)
// 4263.1-4263.99: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.capacity (case L)
// 4337.1-4337.140: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.1)
// 4338.1-4338.101: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.2)
// 4339.1-4339.158: (5.5): Queue.size is not Write-Write Stable with respect to Queue.size2 (case A.3)
// 4438.1-4438.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case C)
// 4542.1-4542.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case D)
// 4543.1-4543.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size (case R)
// 4616.1-4616.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case F)
// 4617.1-4617.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case H)
// 4618.1-4618.146: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size (case I)
// 4690.1-4690.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case J)
// 4691.1-4691.136: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case K)
// 4692.1-4692.99: (5.5): Queue.size is not Write-Read Stable with respect to Queue.size2 (case L)
// 4766.1-4766.140: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.1)
// 4767.1-4767.101: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.2)
// 4768.1-4768.158: (12.5): Queue.capacity is not Write-Write Stable with respect to Queue.size2 (case A.3)
// 4867.1-4867.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case C)
// 4971.1-4971.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case D)
// 4972.1-4972.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.capacity (case R)
// 5045.1-5045.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case F)
// 5046.1-5046.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case H)
// 5047.1-5047.146: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.capacity (case I)
// 5119.1-5119.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case J)
// 5120.1-5120.136: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case K)
// 5121.1-5121.99: (12.5): Queue.capacity is not Write-Read Stable with respect to Queue.size2 (case L)
// 5195.1-5195.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.1)
// 5196.1-5196.101: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.2)
// 5197.1-5197.158: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case A.3)
// 5296.1-5296.140: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case C)
// 5400.1-5400.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case D)
// 5401.1-5401.144: (16.5): Queue.size2 is not Write-Write Stable with respect to Queue.size2 (case R)
// 5474.1-5474.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case F)
// 5475.1-5475.136: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case H)
// 5476.1-5476.146: (16.5): Queue.size2 is not Read-Write Stable with respect to Queue.size2 (case I)
// 5548.1-5548.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case J)
// 5549.1-5549.136: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case K)
// 5550.1-5550.99: (16.5): Queue.size2 is not Write-Read Stable with respect to Queue.size2 (case L)
// 5584.1-5605.2: (9.33): yields_as clause for Queue.size is not valid
// 5610.1-5626.2: (9.33): yields_as clause for Queue.size is not reflexive
// 5632.1-5664.2: (9.33): yields_as clause for Queue.size is not transitive
// 5683.1-5704.2: (12.5): yields_as clause for Queue.capacity is not valid
// 5709.1-5725.2: (12.5): yields_as clause for Queue.capacity is not reflexive
// 5731.1-5763.2: (12.5): yields_as clause for Queue.capacity is not transitive
// 5783.1-5804.2: (19.66): yields_as clause for Queue.size2 is not valid
// 5809.1-5825.2: (19.66): yields_as clause for Queue.size2 is not reflexive
// 5831.1-5863.2: (19.66): yields_as clause for Queue.size2 is not transitive
// 5883.1-5904.2: (7.32): yields_as clause for Queue._lock is not valid
// 5909.1-5925.2: (7.32): yields_as clause for Queue._lock is not reflexive
// 5931.1-5963.2: (7.32): yields_as clause for Queue._lock is not transitive
