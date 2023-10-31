                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/commits.anchor:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void a() {                                                                             
        commit;                                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void b() {                                                                             
        commit;                                                                                     
        commit;                                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void c() {                                                                             
        acquire(this);                                                                              
        commit;                                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void d() {                                                                             
        acquire(this);                                                                              
        release(this);                                                                              
        commit;                                                                                     
        // return;                                                                                  
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void a() {                                                                             
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void b() {                                                                             
        commit;                                                                                     
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void c() {                                                                             
        acquire(this);                                                                              
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void d() {                                                                             
        acquire(this);                                                                              
        release(this);                                                                              
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void a() {                                                                             
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void b() {                                                                             
        commit;                                                                                     
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void c() {                                                                             
        acquire(this);                                                                              
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void d() {                                                                             
        acquire(this);                                                                              
        release(this);                                                                              
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void a() {                                                                             
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void b() {                                                                             
        commit;                                                                                     
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void c() {                                                                             
        acquire(this);                                                                              
        commit;                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void d() {                                                                             
        acquire(this);                                                                              
        release(this);                                                                              
        commit;                                                                                     
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
                                                                                                    
                                                                                                    
/*** Class Decl Lock ***/                                                                           
                                                                                                    
type Lock;                                                                                          
const unique Lock.null: Lock;                                                                       
var Lock._state: [Lock]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Lock._lock: [Lock]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Lock._lock(tid: Tid,this : Lock,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet._lock: [HashSet]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Lock._lock(tid: Tid,this : Lock,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet._lock: [HashSet]Tid) returns (MoverPath) {
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
                                                                                                    
var HashSet._lock: [HashSet]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.HashSet._lock(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet._lock: [HashSet]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.HashSet._lock(tid: Tid,this : HashSet,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet._lock: [HashSet]Tid) returns (MoverPath) {
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
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  HashSet.a(tid:Tid, this : HashSet)                                                       
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (6.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                    
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                     
{                                                                                                   
 var this928462: HashSet;                                                                           
 var Lock._lock928463: [Lock]Tid;                                                                   
 var $recorded.state928462: int;                                                                    
 var tid928462: Tid;                                                                                
 var $recorded.state928463: int;                                                                    
 var HashSet._state928463: [HashSet]State;                                                          
 var this928463: HashSet;                                                                           
 var $pc928462: Phase;                                                                              
 var Lock._state928463: [Lock]State;                                                                
 var HashSet._state928462: [HashSet]State;                                                          
 var Lock._lock928462: [Lock]Tid;                                                                   
 var HashSet._lock928463: [HashSet]Tid;                                                             
 var HashSet._lock928462: [HashSet]Tid;                                                             
 var Lock._state928462: [Lock]State;                                                                
 var $pc928463: Phase;                                                                              
 var tid928463: Tid;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Lock._state928462 == Lock._state && Lock._lock928462 == Lock._lock && HashSet._state928462 == HashSet._state && HashSet._lock928462 == HashSet._lock && this928462 == this && tid928462 == tid;
 assume $recorded.state928462 == 1;                                                                 
 assert $$pc == PreCommit;                                                                                 // (7.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 6.21: // return;                                                                                
                                                                                                    
 assume Lock._state928463 == Lock._state && Lock._lock928463 == Lock._lock && HashSet._state928463 == HashSet._state && HashSet._lock928463 == HashSet._lock && this928463 == this && tid928463 == tid;
 assume $recorded.state928463 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  HashSet.b(tid:Tid, this : HashSet)                                                       
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (10.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                    
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                     
{                                                                                                   
 var this928468: HashSet;                                                                           
 var Lock._state928468: [Lock]State;                                                                
 var Lock._state928469: [Lock]State;                                                                
 var HashSet._lock928468: [HashSet]Tid;                                                             
 var HashSet._lock928467: [HashSet]Tid;                                                             
 var $pc928469: Phase;                                                                              
 var Lock._lock928467: [Lock]Tid;                                                                   
 var $pc928467: Phase;                                                                              
 var this928469: HashSet;                                                                           
 var $recorded.state928467: int;                                                                    
 var HashSet._state928467: [HashSet]State;                                                          
 var HashSet._lock928469: [HashSet]Tid;                                                             
 var tid928468: Tid;                                                                                
 var tid928467: Tid;                                                                                
 var tid928469: Tid;                                                                                
 var Lock._lock928469: [Lock]Tid;                                                                   
 var Lock._lock928468: [Lock]Tid;                                                                   
 var HashSet._state928469: [HashSet]State;                                                          
 var HashSet._state928468: [HashSet]State;                                                          
 var Lock._state928467: [Lock]State;                                                                
 var this928467: HashSet;                                                                           
 var $recorded.state928468: int;                                                                    
 var $pc928468: Phase;                                                                              
 var $recorded.state928469: int;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Lock._state928467 == Lock._state && Lock._lock928467 == Lock._lock && HashSet._state928467 == HashSet._state && HashSet._lock928467 == HashSet._lock && this928467 == this && tid928467 == tid;
 assume $recorded.state928467 == 1;                                                                 
 assert $$pc == PreCommit;                                                                                 // (11.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
 assume Lock._state928468 == Lock._state && Lock._lock928468 == Lock._lock && HashSet._state928468 == HashSet._state && HashSet._lock928468 == HashSet._lock && this928468 == this && tid928468 == tid;
 assume $recorded.state928468 == 1;                                                                 
 assert $$pc == PreCommit;                                                                                 // (12.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 10.21: // return;                                                                               
                                                                                                    
 assume Lock._state928469 == Lock._state && Lock._lock928469 == Lock._lock && HashSet._state928469 == HashSet._state && HashSet._lock928469 == HashSet._lock && this928469 == this && tid928469 == tid;
 assume $recorded.state928469 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  HashSet.c(tid:Tid, this : HashSet)                                                       
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (15.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                    
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                     
{                                                                                                   
 var HashSet._lock928476: [HashSet]Tid;                                                             
 var Lock._lock928476: [Lock]Tid;                                                                   
 var HashSet._lock928475: [HashSet]Tid;                                                             
 var this928475: HashSet;                                                                           
 var tid928475: Tid;                                                                                
 var Lock._state928476: [Lock]State;                                                                
 var $recorded.state928476: int;                                                                    
 var tid928476: Tid;                                                                                
 var Lock._lock928475: [Lock]Tid;                                                                   
 var $pc928475: Phase;                                                                              
 var HashSet._state928476: [HashSet]State;                                                          
 var $recorded.state928475: int;                                                                    
 var Lock._state928475: [Lock]State;                                                                
 var HashSet._state928475: [HashSet]State;                                                          
 var this928476: HashSet;                                                                           
 var $pc928476: Phase;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != HashSet.null;                                                                      
 } else {                                                                                           
  assert this != HashSet.null;                                                                             // (16.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume HashSet._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (16.7): Reduction failure
 HashSet._lock[this] := tid;                                                                        
 assume Lock._state928475 == Lock._state && Lock._lock928475 == Lock._lock && HashSet._state928475 == HashSet._state && HashSet._lock928475 == HashSet._lock && this928475 == this && tid928475 == tid;
 assume $recorded.state928475 == 1;                                                                 
 assert $$pc == PreCommit;                                                                                 // (17.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 15.21: // return;                                                                               
                                                                                                    
 assume Lock._state928476 == Lock._state && Lock._lock928476 == Lock._lock && HashSet._state928476 == HashSet._state && HashSet._lock928476 == HashSet._lock && this928476 == this && tid928476 == tid;
 assume $recorded.state928476 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  HashSet.d(tid:Tid, this : HashSet)                                                       
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (20.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (20.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                    
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                     
{                                                                                                   
 var Lock._lock928484: [Lock]Tid;                                                                   
 var HashSet._state928485: [HashSet]State;                                                          
 var Lock._state928484: [Lock]State;                                                                
 var Lock._state928485: [Lock]State;                                                                
 var this928485: HashSet;                                                                           
 var HashSet._lock928484: [HashSet]Tid;                                                             
 var HashSet._state928484: [HashSet]State;                                                          
 var tid928485: Tid;                                                                                
 var this928484: HashSet;                                                                           
 var $pc928485: Phase;                                                                              
 var $recorded.state928484: int;                                                                    
 var tid928484: Tid;                                                                                
 var Lock._lock928485: [Lock]Tid;                                                                   
 var $recorded.state928485: int;                                                                    
 var $pc928484: Phase;                                                                              
 var HashSet._lock928485: [HashSet]Tid;                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != HashSet.null;                                                                      
 } else {                                                                                           
  assert this != HashSet.null;                                                                             // (21.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume HashSet._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.7): Reduction failure
 HashSet._lock[this] := tid;                                                                        
 if ($pc == PreCommit) {                                                                            
  assume this != HashSet.null;                                                                      
 } else {                                                                                           
  assert this != HashSet.null;                                                                             // (22.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert HashSet._lock[this] == tid;                                                                        // (22.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.7): Reduction failure
 HashSet._lock[this] := Tid.null;                                                                   
 assume Lock._state928484 == Lock._state && Lock._lock928484 == Lock._lock && HashSet._state928484 == HashSet._state && HashSet._lock928484 == HashSet._lock && this928484 == this && tid928484 == tid;
 assume $recorded.state928484 == 1;                                                                 
 assert $$pc == PreCommit;                                                                                 // (23.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 20.21: // return;                                                                               
                                                                                                    
 assume Lock._state928485 == Lock._state && Lock._lock928485 == Lock._lock && HashSet._state928485 == HashSet._state && HashSet._lock928485 == HashSet._lock && this928485 == this && tid928485 == tid;
 assume $recorded.state928485 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet._lock: [HashSet]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Lock  :: _i == Lock.null <==> isNull(Lock._state[_i])) &&                             
  (forall _i: HashSet  :: _i == HashSet.null <==> isNull(HashSet._state[_i])) &&                    
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                    
requires ValidTid(tid);                                                                             
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet._lock;                                                                             
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                     
ensures Y(tid , old(Lock._state), old(Lock._lock), old(HashSet._state), old(HashSet._lock) , Lock._state, Lock._lock, HashSet._state, HashSet._lock);
                                                                                                    
// Lock._lock:                                                                                      
                                                                                                    
function {:inline} Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid): bool
{                                                                                                   
 ((isAccessible(Lock._state[this], tid) && leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet._lock)), _R)) ==> (Lock._lock[this] == newValue))
 &&(((Lock._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Subsumes.W(tid : Tid, u : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var Lock._state_yield: [Lock]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume isAccessible(Lock._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Lock._lock(u: Tid,this: Lock,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet._lock)));
 assume leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet._lock)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet._lock_yield == HashSet._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet._lock); 
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Reflexive(tid : Tid, this: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet._lock_yield == HashSet._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, Lock._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet._lock);
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Transitive(tid : Tid, this: Lock, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet._lock_p: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var this_pre: Lock;                                                                                 
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
                                                                                                    
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var this_post: Lock;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet._lock_pre == HashSet._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet._lock , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);
 assume Y_Lock._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet._lock_post == HashSet._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet._lock); 
}                                                                                                   
// HashSet._lock:                                                                                   
                                                                                                    
function {:inline} Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet._lock)), _R)) ==> (HashSet._lock[this] == newValue))
 &&(((HashSet._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var newValue_yield: Tid;                                                                            
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var Lock._state_yield: [Lock]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet._lock(u: Tid,this: HashSet,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet._lock)));
 assume leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet._lock)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet._lock_yield == HashSet._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet._lock);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet._lock_yield == HashSet._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, HashSet._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet._lock);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Transitive(tid : Tid, this: HashSet, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet._lock_p: [HashSet]Tid)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet._lock);                   
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var newValue_post: Tid;                                                                             
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet._lock_pre == HashSet._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet._lock , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);
 assume Y_HashSet._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet._lock_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet._lock_post == HashSet._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet._lock: [HashSet]Tid , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet._lock_p: [HashSet]Tid): bool
{                                                                                                   
 (forall this: Lock :: Y_Lock._lock(tid : Tid, this, Lock._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet._lock))
 && (forall this: HashSet :: Y_HashSet._lock(tid : Tid, this, HashSet._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet._lock))
 && (forall _i : Lock :: isShared(Lock._state[_i]) ==> isShared(Lock._state_p[_i]))                 
 && (forall _i : Lock :: isLocal(Lock._state[_i], tid) <==> isLocal(Lock._state_p[_i], tid))        
 && (forall _i : HashSet :: isShared(HashSet._state[_i]) ==> isShared(HashSet._state_p[_i]))        
 && (forall _i : HashSet :: isLocal(HashSet._state[_i], tid) <==> isLocal(HashSet._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 649.1-695.2: (Method:6.5)
// 657.1-657.24: (6.5): Bad tid
// 658.1-658.41: (6.5): this is not global
// 687.1-687.27: (7.7): Can only commit when in pre-commit phase.
// 689.2-694.9: (class anchor.sink.Return:6.21)
// 696.1-754.2: (Method:10.5)
// 704.1-704.24: (10.5): Bad tid
// 705.1-705.41: (10.5): this is not global
// 742.1-742.27: (11.7): Can only commit when in pre-commit phase.
// 746.1-746.27: (12.7): Can only commit when in pre-commit phase.
// 748.2-753.9: (class anchor.sink.Return:10.21)
// 755.1-810.2: (Method:15.5)
// 763.1-763.24: (15.5): Bad tid
// 764.1-764.41: (15.5): this is not global
// 794.1-794.31: (16.7): Cannot have potential null deference in left-mover part.
// 798.1-798.27: (16.7): Reduction failure
// 802.1-802.27: (17.7): Can only commit when in pre-commit phase.
// 804.2-809.9: (class anchor.sink.Return:15.21)
// 811.1-875.2: (Method:20.5)
// 819.1-819.24: (20.5): Bad tid
// 820.1-820.41: (20.5): this is not global
// 850.1-850.31: (21.7): Cannot have potential null deference in left-mover part.
// 854.1-854.27: (21.7): Reduction failure
// 859.1-859.31: (22.7): Cannot have potential null deference in left-mover part.
// 861.1-861.36: (22.7): lock not held
// 863.1-863.27: (22.7): Reduction failure
// 867.1-867.27: (23.7): Can only commit when in pre-commit phase.
// 869.2-874.9: (class anchor.sink.Return:20.21)
// 925.1-945.2: (7.32): yields_as clause for Lock._lock is not valid
// 950.1-965.2: (7.32): yields_as clause for Lock._lock is not reflexive
// 971.1-1001.2: (7.32): yields_as clause for Lock._lock is not transitive
// 1021.1-1041.2: (7.32): yields_as clause for HashSet._lock is not valid
// 1046.1-1061.2: (7.32): yields_as clause for HashSet._lock is not reflexive
// 1067.1-1097.2: (7.32): yields_as clause for HashSet._lock is not transitive
