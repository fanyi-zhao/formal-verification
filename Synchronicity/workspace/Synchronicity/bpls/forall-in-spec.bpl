                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/forall-in-spec.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int a isLocal(this, tid)                                                                     
       ? isLocal(this, tid) ? B : E                                                                 
       : this.locks.length > 0 && (forall int i ::0 <= i && i < this.locks.length ==> isShared(this.locks[i]) && holds(this.locks[i], tid)) ? B : E
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        assume this.a == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int a isLocal(this, tid)                                                                     
       ? isLocal(this, tid) ? B : E                                                                 
       : this.locks.length > 0 && (forall int i ::0 <= i && i < this.locks.length ==> isShared(this.locks[i]) && holds(this.locks[i], tid)) ? B : E
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        assume this.a == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int a isLocal(this, tid)                                                                     
       ? isLocal(this, tid) ? B : E                                                                 
       : this.locks.length > 0 && (forall int i ::0 <= i && i < this.locks.length ==> isShared(this.locks[i]) && holds(this.locks[i], tid)) ? B : E
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        assume this.a == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       int a isLocal(this, tid)                                                                     
       ? isLocal(this, tid) ? B : E                                                                 
       : this.locks.length > 0 && (forall int i ::0 <= i && i < this.locks.length ==> isShared(this.locks[i]) && holds(this.locks[i], tid)) ? B : E
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        assume this.a == 0;                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Lock ***/                                                                           
                                                                                                    
type Lock;                                                                                          
const unique Lock.null: Lock;                                                                       
var Lock._state: [Lock]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Lock._lock: [Lock]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Lock._lock(tid: Tid,this : Lock,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Lock._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Lock._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Lock._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Lock._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Lock._lock(tid: Tid,this : Lock,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Lock._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Lock._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Lock._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Lock._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl HashSet ***/                                                                        
                                                                                                    
type HashSet;                                                                                       
const unique HashSet.null: HashSet;                                                                 
var HashSet._state: [HashSet]State;                                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var HashSet.locks: [HashSet]Array.HashSet.LOCK;                                                     
                                                                                                    
function {:inline} ReadEval.HashSet.locks(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.HashSet.LOCK.null;                                                          
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
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
                                                                                                    
function {:inline} WriteEval.HashSet.locks(tid: Tid,this : HashSet,newValue: Array.HashSet.LOCK,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
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
                                                                                                    
var HashSet.a: [HashSet]int;                                                                        
                                                                                                    
function {:inline} ReadEval.HashSet.a(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((Array.HashSet.LOCK._length[HashSet.locks[this]]>0)&&(forall i: int ::  ((((0<=i)&&(i<Array.HashSet.LOCK._length[HashSet.locks[this]]))==>(isShared(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]])&&(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]] == tid))))))) then
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.HashSet.a(tid: Tid,this : HashSet,newValue: int,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((Array.HashSet.LOCK._length[HashSet.locks[this]]>0)&&(forall i: int ::  ((((0<=i)&&(i<Array.HashSet.LOCK._length[HashSet.locks[this]]))==>(isShared(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]])&&(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][i]] == tid))))))) then
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var HashSet._lock: [HashSet]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.HashSet._lock(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((HashSet._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((HashSet._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((HashSet._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.HashSet._lock(tid: Tid,this : HashSet,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((HashSet._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((HashSet._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((HashSet._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.HashSet.1750844(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
 (HashSet.locks[this]!=Array.HashSet.LOCK.null)                                                     
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/*** Array Array.HashSet.LOCK ***/                                                                  
                                                                                                    
type Array.HashSet.LOCK;                                                                            
const unique Array.HashSet.LOCK.null: Array.HashSet.LOCK;                                           
var Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State;                                           
                                                                                                    
const Array.HashSet.LOCK._this : [Array.HashSet.LOCK]HashSet;                                       
const Array.HashSet.LOCK._length : [Array.HashSet.LOCK]int;                                         
var Array.HashSet.LOCK._elems  : [Array.HashSet.LOCK]([int]Lock);                                   
                                                                                                    
axiom (forall $this : Array.HashSet.LOCK :: Array.HashSet.LOCK._length[$this] >= 0);                
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.HashSet.LOCK: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.HashSet.LOCK(tid: Tid,this : HashSet,athis : Array.HashSet.LOCK,index : int,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (isLocal(Array.HashSet.LOCK._state[athis], tid)) then                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.HashSet.LOCK: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.HashSet.LOCK(tid: Tid,this : HashSet,athis : Array.HashSet.LOCK,index : int,newValue: Lock,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Array.HashSet.LOCK._state[athis], tid)) then                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet.a: [HashSet]int,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Lock  :: _i == Lock.null <==> isNull(Lock._state[_i])) &&                             
  (forall _i: HashSet  :: _i == HashSet.null <==> isNull(HashSet._state[_i])) &&                    
  (forall _i: Array.HashSet.LOCK  :: _i == Array.HashSet.LOCK.null <==> isNull(Array.HashSet.LOCK._state[_i])) &&
  (forall _t: Tid, _i: Array.HashSet.LOCK  :: ValidTid(_t) && isAccessible(Array.HashSet.LOCK._state[_i], _t) ==> isAccessible(HashSet._state[Array.HashSet.LOCK._this[_i]], _t)) &&
  (forall _i: HashSet ::  (isShared(HashSet._state[_i]) ==> isSharedAssignable(Array.HashSet.LOCK._state[HashSet.locks[_i]]))) &&
  (forall _i: HashSet ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(HashSet._state[_i],_t) ==> isLocalAssignable(Array.HashSet.LOCK._state[HashSet.locks[_i]], _t)))) &&
  (forall _i: HashSet :: { HashSet.locks[_i] } Array.HashSet.LOCK._this[HashSet.locks[_i]] == _i) &&
  (forall _i: Array.HashSet.LOCK, _index: int ::  (isShared(Array.HashSet.LOCK._state[_i]) && 0 <= _index && _index < Array.HashSet.LOCK._length[_i]) ==> isSharedAssignable(Lock._state[Array.HashSet.LOCK._elems[_i][_index]])) &&
  (forall _i: Array.HashSet.LOCK, _index: int ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Array.HashSet.LOCK._state[_i],_t) && 0 <= _index && _index < Array.HashSet.LOCK._length[_i]) ==> isLocalAssignable(Lock._state[Array.HashSet.LOCK._elems[_i][_index]], _t))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): HashSet.locks failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.HashSet.locks(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): HashSet.locks failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 HashSet.locks[x] := havocValue;                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): HashSet.locks failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.HashSet.locks(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): HashSet.locks failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): HashSet.locks failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 HashSet.locks[x] := havocValue;                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): HashSet.locks failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)        
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.a(u: Tid,x: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (10.5): HashSet.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)         
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.HashSet.a(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (10.5): HashSet.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)         
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.a[x];                                                                          
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 HashSet.a[x] := havocValue;                                                                        
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.a(u: Tid,x: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (10.5): HashSet.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)          
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.a[x];                                                                          
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.HashSet.a(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (10.5): HashSet.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)              
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.HashSet.a(u: Tid,x: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (10.5): HashSet.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.HashSet.a(t: Tid, u: Tid, v: int, w: int, x: HashSet)               
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == HashSet.a[x];                                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 HashSet.a[x] := havocValue;                                                                        
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.HashSet.a(u: Tid,x: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (10.5): HashSet.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.5): Array Array.HashSet.LOCK failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := havocValue;                                                     
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.5): Array Array.HashSet.LOCK failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.HashSet.LOCK._elems[x][i] := havocValue;                                                     
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[y] := w;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.locks.HashSet.a(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.locks.HashSet.a(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var w_mid: int;                                                                                    
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.locks.HashSet.a(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var w_mid: int;                                                                                    
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.locks.HashSet.a(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[y] := w;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.locks.HashSet.a(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.a.HashSet.locks(t: Tid, u: Tid, v: int, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.a.HashSet.locks(t: Tid, u: Tid, v: int, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.a.HashSet.locks(t: Tid, u: Tid, v: int, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.a.HashSet.locks(t: Tid, u: Tid, v: int, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[y] := w;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.a.HashSet.locks(t: Tid, u: Tid, v: int, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.a.HashSet.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.a.HashSet.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var w_mid: int;                                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.a.HashSet.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var w_mid: int;                                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.a.HashSet.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[y] := w;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.a.HashSet.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.a;                                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.a.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: int, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.a;                                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.a.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: int, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.a;                                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.a.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: int, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.a;                                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.a[x];                                                                              
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.a[x] := tmpV;                                                                              
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.a.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: int, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.a;                                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.a(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.a.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: int, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.a;                                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var v_pre: int;                                                                                    
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var v_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.a(t: Tid,x: HashSet,v: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[x] := v;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[y] := w;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.HashSet.LOCK._elems.HashSet.a(t: Tid, u: Tid, v: Lock, w: int, w0: int, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.HashSet.LOCK._elems.HashSet.a(t: Tid, u: Tid, v: Lock, w: int, w0: int, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w_mid: int;                                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.HashSet.LOCK._elems.HashSet.a(t: Tid, u: Tid, v: Lock, w: int, w0: int, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w_mid: int;                                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var HashSet.a_mid: [HashSet]int;                                                                   
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.a[y] := w;                                                                                 
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.HashSet.LOCK._elems.HashSet.a(t: Tid, u: Tid, v: Lock, w: int, w0: int, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.a(u: Tid,y: HashSet,w: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.a[y] := w;                                                                                 
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.HashSet.LOCK._elems.HashSet.a(t: Tid, u: Tid, v: Lock, w: int, w0: int, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.a;                                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var w_pre: int;                                                                                    
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var HashSet.a_post: [HashSet]int;                                                                  
 var w_post: int;                                                                                   
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.a(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w_mid: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var HashSet.a_mid: [HashSet]int;                                                                   
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w_mid: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet.a_mid == HashSet.a && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var HashSet.a_pre: [HashSet]int;                                                                   
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var HashSet.a_post: [HashSet]int;                                                                  
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet.a_post == HashSet.a && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
requires ValidTid(tid);                                                                             
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet.locks;                                                                             
modifies HashSet.a;                                                                                 
modifies HashSet._lock;                                                                             
modifies Array.HashSet.LOCK._state;                                                                 
modifies Array.HashSet.LOCK._elems;                                                                 
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures Y(tid , old(Lock._state), old(Lock._lock), old(HashSet._state), old(HashSet.locks), old(HashSet.a), old(HashSet._lock), old(Array.HashSet.LOCK._state), old(Array.HashSet.LOCK._elems), old(Array.HashSet.LOCK._length) , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Lock._lock:                                                                                      
                                                                                                    
function {:inline} Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(Lock._state[this], tid) && leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (Lock._lock[this] == newValue))
 &&(((Lock._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Subsumes.W(tid : Tid, u : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume isAccessible(Lock._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Lock._lock(u: Tid,this: Lock,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
 assume leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Reflexive(tid : Tid, this: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, Lock._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Transitive(tid : Tid, this: Lock, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var this_pre: Lock;                                                                                 
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var HashSet.a_pre: [HashSet]int;                                                                    
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
                                                                                                    
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var this_post: Lock;                                                                                
var HashSet.a_post: [HashSet]int;                                                                   
var newValue_post: Tid;                                                                             
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_Lock._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet.a_post == HashSet.a_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// HashSet.locks:                                                                                   
                                                                                                    
function {:inline} Y_HashSet.locks(tid : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (HashSet.locks[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet.locks(tid : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var newValue_yield: Array.HashSet.LOCK;                                                             
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet.locks(u: Tid,this: HashSet,newValue: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
                                                                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.locks(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.locks(tid, this, HashSet.locks[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Transitive(tid : Tid, this: HashSet, newValue : Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (8.28): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var newValue_pre: Array.HashSet.LOCK;                                                               
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var HashSet.a_pre: [HashSet]int;                                                                    
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var newValue_post: Array.HashSet.LOCK;                                                              
var HashSet._lock_post: [HashSet]Tid;                                                               
var HashSet.a_post: [HashSet]int;                                                                   
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_HashSet.locks(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet.a_post == HashSet.a_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet.locks(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// HashSet.a:                                                                                       
                                                                                                    
function {:inline} Y_HashSet.a(tid : Tid, this: HashSet, newValue: int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet.a(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (HashSet.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet.a(tid : Tid, this: HashSet, newValue: int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet.a.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet.a(u: Tid,this: HashSet,newValue: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
                                                                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.a(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.a.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.a(tid, this, HashSet.a[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.a.Transitive(tid : Tid, this: HashSet, newValue : int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (10.22): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var newValue_pre: int;                                                                              
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var HashSet.a_pre: [HashSet]int;                                                                    
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var HashSet.a_post: [HashSet]int;                                                                   
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_HashSet.a(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet.a_post == HashSet.a_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet.a(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// HashSet._lock:                                                                                   
                                                                                                    
function {:inline} Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (HashSet._lock[this] == newValue))
 &&(((HashSet._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var newValue_yield: Tid;                                                                            
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet._lock(u: Tid,this: HashSet,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
 assume leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, HashSet._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Transitive(tid : Tid, this: HashSet, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (4.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var HashSet.a_pre: [HashSet]int;                                                                    
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var HashSet.a_post: [HashSet]int;                                                                   
var newValue_post: Tid;                                                                             
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_HashSet._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet.a_post == HashSet.a_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// Array.HashSet.LOCK:                                                                              
                                                                                                    
function {:inline} Y_Array.HashSet.LOCK(tid : Tid, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
(var this := Array.HashSet.LOCK._this[athis];                                                       
 ((isAccessible(Array.HashSet.LOCK._state[athis], tid) && leq(m#moverPath(ReadEval.Array.HashSet.LOCK(tid: Tid,Array.HashSet.LOCK._this[athis]: HashSet,athis: Array.HashSet.LOCK,index: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (Array.HashSet.LOCK._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.HashSet.LOCK(tid : Tid, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
(var this := Array.HashSet.LOCK._this[athis];                                                       
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Subsumes.W(tid : Tid, u : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.HashSet.LOCK._this[athis];                                                  
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var athis_yield: Array.HashSet.LOCK;                                                                
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var index_yield: int;                                                                               
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.HashSet.LOCK._state[athis], u);                                          
 assume !isError(m#moverPath(WriteEval.Array.HashSet.LOCK(u: Tid,Array.HashSet.LOCK._this[athis]: HashSet,athis: Array.HashSet.LOCK,index: int,newValue: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
                                                                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Reflexive(tid : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.HashSet.LOCK._this[athis];                                                  
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var athis_yield: Array.HashSet.LOCK;                                                                
var HashSet._state_yield: [HashSet]State;                                                           
var HashSet.a_yield: [HashSet]int;                                                                  
var Lock._state_yield: [Lock]State;                                                                 
var index_yield: int;                                                                               
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.HashSet.LOCK._state[athis], tid);                                        
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet.a_yield == HashSet.a && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.HashSet.LOCK(tid, athis, index, Array.HashSet.LOCK._elems[athis][index] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Transitive(tid : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int, newValue : Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1750844(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet.a,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (6.32): Object invariant may not hold.
                                                                                                    
 requires this == Array.HashSet.LOCK._this[athis];                                                  
 requires ValidTid(tid);                                                                            
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var athis_pre: Array.HashSet.LOCK;                                                                  
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var index_pre: int;                                                                                 
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var HashSet.a_pre: [HashSet]int;                                                                    
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var HashSet.a_post: [HashSet]int;                                                                   
var index_post: int;                                                                                
var athis_post: Array.HashSet.LOCK;                                                                 
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet.a_pre == HashSet.a && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet.a_post == HashSet.a_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.HashSet.LOCK._state[athis], tid);                                        
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet.a_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assert Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet.a: [HashSet]int, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet.a_p: [HashSet]int, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 (forall this: Lock :: Y_Lock._lock(tid : Tid, this, Lock._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall this: HashSet :: Y_HashSet.locks(tid : Tid, this, HashSet.locks_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall this: HashSet :: Y_HashSet.a(tid : Tid, this, HashSet.a_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall this: HashSet :: Y_HashSet._lock(tid : Tid, this, HashSet._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall athis: Array.HashSet.LOCK, index: int :: Y_Array.HashSet.LOCK(tid : Tid, athis, index, Array.HashSet.LOCK._elems_p[athis][index] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet.a, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall _i : Lock :: isShared(Lock._state[_i]) ==> isShared(Lock._state_p[_i]))                 
 && (forall _i : Lock :: isLocal(Lock._state[_i], tid) <==> isLocal(Lock._state_p[_i], tid))        
 && (forall _i : HashSet :: isShared(HashSet._state[_i]) ==> isShared(HashSet._state_p[_i]))        
 && (forall _i : HashSet :: isLocal(HashSet._state[_i], tid) <==> isLocal(HashSet._state_p[_i], tid))
 && (forall _i : Array.HashSet.LOCK :: isShared(Array.HashSet.LOCK._state[_i]) ==> isShared(Array.HashSet.LOCK._state_p[_i]))
 && (forall _i : Array.HashSet.LOCK :: Array.HashSet.LOCK._length[_i] == Array.HashSet.LOCK._length_p[_i])
 && (forall _i : Array.HashSet.LOCK :: isLocal(Array.HashSet.LOCK._state[_i], tid) <==> isLocal(Array.HashSet.LOCK._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 769.1-769.34: (8.5): HashSet.locks failed Write-Write Right-Mover Check
// 838.1-838.30: (8.5): HashSet.locks failed Write-Read Right-Mover Check
// 911.1-911.34: (8.5): HashSet.locks failed Write-Write Left-Mover Check
// 981.1-981.30: (8.5): HashSet.locks failed Write-Read Left-Mover Check
// 1048.1-1048.34: (8.5): HashSet.locks failed Read-Write Right-Mover Check
// 1118.1-1118.34: (8.5): HashSet.locks failed Read-Write Left-Mover Check
// 1187.1-1187.34: (10.5): HashSet.a failed Write-Write Right-Mover Check
// 1256.1-1256.30: (10.5): HashSet.a failed Write-Read Right-Mover Check
// 1329.1-1329.34: (10.5): HashSet.a failed Write-Write Left-Mover Check
// 1399.1-1399.30: (10.5): HashSet.a failed Write-Read Left-Mover Check
// 1466.1-1466.34: (10.5): HashSet.a failed Read-Write Right-Mover Check
// 1536.1-1536.34: (10.5): HashSet.a failed Read-Write Left-Mover Check
// 1611.1-1611.34: (6.5): Array Array.HashSet.LOCK failed Write-Write Right-Mover Check
// 1686.1-1686.30: (6.5): Array Array.HashSet.LOCK failed Write-Read Right-Mover Check
// 1765.1-1765.34: (6.5): Array Array.HashSet.LOCK failed Write-Write Left-Mover Check
// 1841.1-1841.30: (6.5): Array Array.HashSet.LOCK failed Write-Read Left-Mover Check
// 1914.1-1914.34: (6.5): Array Array.HashSet.LOCK failed Read-Write Right-Mover Check
// 1990.1-1990.34: (6.5): Array Array.HashSet.LOCK failed Read-Write Left-Mover Check
// 2071.1-2071.140: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.1)
// 2072.1-2072.101: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.2)
// 2073.1-2073.158: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.3)
// 2184.1-2184.140: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case C)
// 2300.1-2300.144: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case D)
// 2301.1-2301.144: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case R)
// 2382.1-2382.136: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case F)
// 2383.1-2383.136: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case H)
// 2384.1-2384.146: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case I)
// 2464.1-2464.136: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case J)
// 2465.1-2465.136: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case K)
// 2466.1-2466.99: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case L)
// 2548.1-2548.140: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.1)
// 2549.1-2549.101: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.2)
// 2550.1-2550.158: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case A.3)
// 2661.1-2661.140: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case C)
// 2777.1-2777.144: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case D)
// 2778.1-2778.144: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case R)
// 2859.1-2859.136: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case F)
// 2860.1-2860.136: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case H)
// 2861.1-2861.146: (8.5): HashSet.locks is not Read-Write Stable with respect to HashSet.a (case I)
// 2941.1-2941.136: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case J)
// 2942.1-2942.136: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case K)
// 2943.1-2943.99: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.locks (case L)
// 3030.1-3030.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.1)
// 3031.1-3031.101: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.2)
// 3032.1-3032.156: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.3)
// 3150.1-3150.140: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
// 3273.1-3273.144: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
// 3274.1-3274.144: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
// 3360.1-3360.136: (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
// 3361.1-3361.136: (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
// 3362.1-3362.144: (8.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
// 3447.1-3447.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case J)
// 3448.1-3448.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case K)
// 3449.1-3449.99: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case L)
// 3531.1-3531.140: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.1)
// 3532.1-3532.101: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.2)
// 3533.1-3533.158: (8.5): HashSet.locks is not Write-Write Stable with respect to HashSet.a (case A.3)
// 3644.1-3644.140: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case C)
// 3760.1-3760.144: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case D)
// 3761.1-3761.144: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.locks (case R)
// 3842.1-3842.136: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case F)
// 3843.1-3843.136: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case H)
// 3844.1-3844.146: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.locks (case I)
// 3924.1-3924.136: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case J)
// 3925.1-3925.136: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case K)
// 3926.1-3926.99: (8.5): HashSet.locks is not Write-Read Stable with respect to HashSet.a (case L)
// 4008.1-4008.140: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.1)
// 4009.1-4009.101: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.2)
// 4010.1-4010.158: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case A.3)
// 4121.1-4121.140: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case C)
// 4237.1-4237.144: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case D)
// 4238.1-4238.144: (10.5): HashSet.a is not Write-Write Stable with respect to HashSet.a (case R)
// 4319.1-4319.136: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case F)
// 4320.1-4320.136: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case H)
// 4321.1-4321.146: (10.5): HashSet.a is not Read-Write Stable with respect to HashSet.a (case I)
// 4401.1-4401.136: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case J)
// 4402.1-4402.136: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case K)
// 4403.1-4403.99: (10.5): HashSet.a is not Write-Read Stable with respect to HashSet.a (case L)
// 4490.1-4490.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.1)
// 4491.1-4491.101: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.2)
// 4492.1-4492.156: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case A.3)
// 4610.1-4610.140: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
// 4733.1-4733.144: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
// 4734.1-4734.144: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
// 4820.1-4820.136: (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
// 4821.1-4821.136: (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
// 4822.1-4822.144: (10.5): HashSet.a is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
// 4907.1-4907.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case J)
// 4908.1-4908.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case K)
// 4909.1-4909.99: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.a (case L)
// 4996.1-4996.140: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
// 4997.1-4997.101: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
// 4998.1-4998.156: (8.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
// 5116.1-5116.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case C)
// 5239.1-5239.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case D)
// 5240.1-5240.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case R)
// 5326.1-5326.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case F)
// 5327.1-5327.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case H)
// 5328.1-5328.144: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case I)
// 5413.1-5413.136: (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
// 5414.1-5414.136: (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
// 5415.1-5415.99: (8.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
// 5502.1-5502.140: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
// 5503.1-5503.101: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
// 5504.1-5504.156: (10.5): HashSet.a is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
// 5622.1-5622.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case C)
// 5745.1-5745.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case D)
// 5746.1-5746.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.a (case R)
// 5832.1-5832.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case F)
// 5833.1-5833.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case H)
// 5834.1-5834.144: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.a (case I)
// 5919.1-5919.136: (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
// 5920.1-5920.136: (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
// 5921.1-5921.99: (10.5): HashSet.a is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
// 6013.1-6013.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
// 6014.1-6014.101: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
// 6015.1-6015.156: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
// 6140.1-6140.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
// 6270.1-6270.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
// 6271.1-6271.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
// 6362.1-6362.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
// 6363.1-6363.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
// 6364.1-6364.144: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
// 6454.1-6454.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
// 6455.1-6455.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
// 6456.1-6456.99: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
// 6463.1-6463.326: (<undefined position>): Object invariant may not hold.
// 6474.1-6474.325: (<undefined position>): Object invariant may not hold.
// 6495.1-6520.2: (7.32): yields_as clause for Lock._lock is not valid
// 6525.1-6545.2: (7.32): yields_as clause for Lock._lock is not reflexive
// 6551.1-6551.326: (2.1): Object invariant may not hold.
// 6552.1-6592.2: (7.32): yields_as clause for Lock._lock is not transitive
// 6611.1-6636.2: (8.5): yields_as clause for HashSet.locks is not valid
// 6641.1-6661.2: (8.5): yields_as clause for HashSet.locks is not reflexive
// 6667.1-6667.326: (8.28): Object invariant may not hold.
// 6668.1-6708.2: (8.5): yields_as clause for HashSet.locks is not transitive
// 6727.1-6752.2: (10.5): yields_as clause for HashSet.a is not valid
// 6757.1-6777.2: (10.5): yields_as clause for HashSet.a is not reflexive
// 6783.1-6783.326: (10.22): Object invariant may not hold.
// 6784.1-6824.2: (10.5): yields_as clause for HashSet.a is not transitive
// 6844.1-6869.2: (7.32): yields_as clause for HashSet._lock is not valid
// 6874.1-6894.2: (7.32): yields_as clause for HashSet._lock is not reflexive
// 6900.1-6900.326: (4.1): Object invariant may not hold.
// 6901.1-6941.2: (7.32): yields_as clause for HashSet._lock is not transitive
// 6959.1-6988.2: (6.5): yields_as clause for Array.HashSet.LOCK is not valid
// 6989.1-7015.2: (6.5): yields_as clause for Array.HashSet.LOCK is not reflexive
// 7020.1-7020.326: (6.32): Object invariant may not hold.
// 7021.1-7065.2: (6.5): yields_as clause for Array.HashSet.LOCK is not transitive
