                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/aba.anchor:                              
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class ABATest {                                                                                 
      noABA int x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue >= this.x;                                                               
                                                                                                    
                                                                                                    
      noABA int x2 isRead                                                                           
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as true;                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        assume this.x2 == 0;                                                                        
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Moo {                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class ABATestPtr {                                                                              
      noABA Moo x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : isLocal(newValue, tid)                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue == this.x || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Moo.null;
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == Moo.null;                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ABATest {                                                                                 
      noABA int x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue >= this.x;                                                               
                                                                                                    
                                                                                                    
      noABA int x2 isRead                                                                           
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as true;                                                                             
                                                                                                    
                                                                                                    
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
        assume this.x2 == 0;                                                                        
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Moo {                                                                                     
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
    class ABATestPtr {                                                                              
      noABA Moo x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : isLocal(newValue, tid)                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue == this.x || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Moo.null;
                                                                                                    
                                                                                                    
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
        assume this.x == Moo.null;                                                                  
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class ABATest {                                                                                 
      noABA int x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue >= this.x;                                                               
                                                                                                    
                                                                                                    
      noABA int x2 isRead                                                                           
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as true;                                                                             
                                                                                                    
                                                                                                    
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
        assume this.x2 == 0;                                                                        
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Moo {                                                                                     
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
    class ABATestPtr {                                                                              
      noABA Moo x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : isLocal(newValue, tid)                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue == this.x || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Moo.null;
                                                                                                    
                                                                                                    
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
        assume this.x == Moo.null;                                                                  
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ABATest {                                                                                 
      noABA int x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue >= this.x;                                                               
                                                                                                    
                                                                                                    
      noABA int x2 isRead                                                                           
       ? holds(this, tid) ? B : E                                                                   
       : newValue == this.x + 1                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as true;                                                                             
                                                                                                    
                                                                                                    
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
        assume this.x2 == 0;                                                                        
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Moo {                                                                                     
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
    class ABATestPtr {                                                                              
      noABA Moo x isRead                                                                            
       ? holds(this, tid) ? B : E                                                                   
       : isLocal(newValue, tid)                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : E                                                                                        
        yields_as newValue == this.x || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Moo.null;
                                                                                                    
                                                                                                    
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
        assume this.x == Moo.null;                                                                  
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
                                                                                                    
                                                                                                    
/*** Class Decl ABATest ***/                                                                        
                                                                                                    
type ABATest;                                                                                       
const unique ABATest.null: ABATest;                                                                 
var ABATest._state: [ABATest]State;                                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var ABATest.x: [ABATest]int;                                                                        
                                                                                                    
function {:inline} ReadEval.ABATest.x(tid: Tid,this : ABATest,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                 
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((newValue==(ABATest.x[this]+1))) then                                                         
   if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ABATest.x(tid: Tid,this : ABATest,newValue: int,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                 
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((newValue==(ABATest.x[this]+1))) then                                                         
   if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ABATest.x2: [ABATest]int;                                                                       
                                                                                                    
function {:inline} ReadEval.ABATest.x2(tid: Tid,this : ABATest,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                 
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((newValue==(ABATest.x[this]+1))) then                                                         
   if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ABATest.x2(tid: Tid,this : ABATest,newValue: int,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                 
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((newValue==(ABATest.x[this]+1))) then                                                         
   if ((isAccessible(ABATest._state[this], tid) && ABATest._lock[this] == tid)) then                
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ABATest._lock: [ABATest]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.ABATest._lock(tid: Tid,this : ABATest,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(ABATest._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ABATest._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ABATest._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ABATest._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ABATest._lock(tid: Tid,this : ABATest,newValue: Tid,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ABATest._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ABATest._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ABATest._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ABATest._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Moo ***/                                                                            
                                                                                                    
type Moo;                                                                                           
const unique Moo.null: Moo;                                                                         
var Moo._state: [Moo]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Moo._lock: [Moo]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Moo._lock(tid: Tid,this : Moo,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Moo._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Moo._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Moo._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Moo._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Moo._lock(tid: Tid,this : Moo,newValue: Tid,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Moo._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Moo._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Moo._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Moo._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl ABATestPtr ***/                                                                     
                                                                                                    
type ABATestPtr;                                                                                    
const unique ABATestPtr.null: ABATestPtr;                                                           
var ABATestPtr._state: [ABATestPtr]State;                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var ABATestPtr.x: [ABATestPtr]Moo;                                                                  
                                                                                                    
function {:inline} ReadEval.ABATestPtr.x(tid: Tid,this : ABATestPtr,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Moo.null;                                                                         
 if (isRead) then                                                                                   
  if ((isAccessible(ABATestPtr._state[this], tid) && ABATestPtr._lock[this] == tid)) then           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isLocal(Moo._state[newValue], tid)) then                                                      
   if ((isAccessible(ABATestPtr._state[this], tid) && ABATestPtr._lock[this] == tid)) then          
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ABATestPtr.x(tid: Tid,this : ABATestPtr,newValue: Moo,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((isAccessible(ABATestPtr._state[this], tid) && ABATestPtr._lock[this] == tid)) then           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isLocal(Moo._state[newValue], tid)) then                                                      
   if ((isAccessible(ABATestPtr._state[this], tid) && ABATestPtr._lock[this] == tid)) then          
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ABATestPtr._lock: [ABATestPtr]Tid;                                                              
                                                                                                    
function {:inline} ReadEval.ABATestPtr._lock(tid: Tid,this : ABATestPtr,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(ABATestPtr._state[this], tid)) then                                                    
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ABATestPtr._lock[this]==tid)) then                                                          
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ABATestPtr._lock[this]==Tid.null)&&(newValue==tid))) then                                  
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ABATestPtr._lock[this]==tid)&&(newValue==Tid.null))) then                                 
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ABATestPtr._lock(tid: Tid,this : ABATestPtr,newValue: Tid,ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ABATestPtr._state[this], tid)) then                                                    
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ABATestPtr._lock[this]==tid)) then                                                          
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ABATestPtr._lock[this]==Tid.null)&&(newValue==tid))) then                                  
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ABATestPtr._lock[this]==tid)&&(newValue==Tid.null))) then                                 
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
                                                                                                    
 function {:inline} StateInvariant(ABATest._state: [ABATest]State,ABATest.x: [ABATest]int,ABATest.x2: [ABATest]int,ABATest._lock: [ABATest]Tid,Moo._state: [Moo]State,Moo._lock: [Moo]Tid,ABATestPtr._state: [ABATestPtr]State,ABATestPtr.x: [ABATestPtr]Moo,ABATestPtr._lock: [ABATestPtr]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: ABATest  :: _i == ABATest.null <==> isNull(ABATest._state[_i])) &&                    
  (forall _i: Moo  :: _i == Moo.null <==> isNull(Moo._state[_i])) &&                                
  (forall _i: ABATestPtr  :: _i == ABATestPtr.null <==> isNull(ABATestPtr._state[_i])) &&           
  (forall _i: ABATestPtr ::  (isShared(ABATestPtr._state[_i]) ==> isSharedAssignable(Moo._state[ABATestPtr.x[_i]]))) &&
  (forall _i: ABATestPtr ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(ABATestPtr._state[_i],_t) ==> isLocalAssignable(Moo._state[ABATestPtr.x[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)        
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATest.x(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): ABATest.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)         
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ABATest.x(u: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): ABATest.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)         
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATest.x[x];                                                                          
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ABATest.x[x] := havocValue;                                                                        
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATest.x(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): ABATest.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)          
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATest.x[x];                                                                          
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ABATest.x(u: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): ABATest.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)              
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ABATest.x(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): ABATest.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ABATest.x(t: Tid, u: Tid, v: int, w: int, x: ABATest)               
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ABATest.x[x];                                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ABATest.x[x] := havocValue;                                                                        
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ABATest.x(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): ABATest.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)       
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATest.x2(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.3): ABATest.x2 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)        
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ABATest.x2(u: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.3): ABATest.x2 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)        
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATest.x2[x];                                                                         
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ABATest.x2[x] := havocValue;                                                                       
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATest.x2(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.3): ABATest.x2 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)         
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATest.x2[x];                                                                         
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ABATest.x2(u: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.3): ABATest.x2 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)             
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ABATest.x2(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.3): ABATest.x2 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ABATest.x2(t: Tid, u: Tid, v: int, w: int, x: ABATest)              
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[x], u);                                                       
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ABATest.x2[x];                                                                         
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ABATest.x2[x] := havocValue;                                                                       
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ABATest.x2(u: Tid,x: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.3): ABATest.x2 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)  
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,x: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (20.3): ABATestPtr.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)   
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ABATestPtr.x(u: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (20.3): ABATestPtr.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)   
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Moo;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATestPtr.x[x];                                                                       
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ABATestPtr.x[x] := havocValue;                                                                     
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,x: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (20.3): ABATestPtr.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)    
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Moo;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ABATestPtr.x[x];                                                                       
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ABATestPtr.x(u: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (20.3): ABATestPtr.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)        
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,x: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (20.3): ABATestPtr.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, x: ABATestPtr)         
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[x], u);                                                    
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Moo;                                                                              
 var Moo._state_pre: [Moo]State;                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ABATestPtr.x[x];                                                                       
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ABATestPtr.x[x] := havocValue;                                                                     
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,x: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (20.3): ABATestPtr.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[y] := w;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[y] := w;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x;                                                                                
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x;                                                                                
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x;                                                                                
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x;                                                                                
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x[x];                                                                              
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x[x] := tmpV;                                                                              
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x;                                                                                
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[y] := w;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x;                                                                                
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[x] := v;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x2.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x2.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x2.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x2.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[y] := w;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x2.ABATest.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x2.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x2.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x2.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x2.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[y] := w;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x2.ABATest.x2(t: Tid, u: Tid, v: int, w: int, w0: int, x: ABATest, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATest.x2;                                                                               
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATest.x2.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x2;                                                                               
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATest.x2.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x2;                                                                               
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATest.x2.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x2;                                                                               
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var x_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: int;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATest.x2[x];                                                                             
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATest.x2[x] := tmpV;                                                                             
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATest.x2.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x2;                                                                               
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[y] := w;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATest.x2(t: Tid,x: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATest.x2.ABATestPtr.x(t: Tid, u: Tid, v: int, w: Moo, w0: Moo, x: ABATest, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATest._state[x], t);                                                       
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATest.x2;                                                                               
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var v_pre: int;                                                                                    
 var ABATest._state_pre: [ABATest]State;                                                            
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var x_pre: ABATest;                                                                                
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: int;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var x_post: ABATest;                                                                               
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATest.x2(t: Tid,x: ABATest,v: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[x] := v;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATestPtr.x.ABATest.x(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATestPtr.x.ABATest.x(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATestPtr.x.ABATest.x(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATest.x[y] := w;                                                                                 
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATestPtr.x.ABATest.x(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x[y] := w;                                                                                 
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATestPtr.x.ABATest.x(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x;                                                                                
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATestPtr.x.ABATest.x2(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATestPtr.x.ABATest.x2(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATestPtr.x.ABATest.x2(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x2;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var y_mid: ABATest;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var w_mid: int;                                                                                    
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATest.x2[y] := w;                                                                                
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATestPtr.x.ABATest.x2(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATest.x2(u: Tid,y: ABATest,w: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATest.x2[y] := w;                                                                                
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATestPtr.x.ABATest.x2(t: Tid, u: Tid, v: Moo, w: int, w0: int, x: ABATestPtr, y: ABATest)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATest._state[y], u);                                                       
 modifies ABATestPtr.x;                                                                             
 modifies ABATest.x2;                                                                               
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var y_pre: ABATest;                                                                                
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var w_pre: int;                                                                                    
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: ABATest;                                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var w_post: int;                                                                                   
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATest.x2(u: Tid,y: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ABATestPtr.x.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, w0: Moo, x: ABATestPtr, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATestPtr.x;                                                                             
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ABATestPtr.x.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, w0: Moo, x: ABATestPtr, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATestPtr.x;                                                                             
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
                                                                                                    
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ABATestPtr.x.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, w0: Moo, x: ABATestPtr, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATestPtr.x;                                                                             
 modifies ABATestPtr.x;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Moo;                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Moo;                                                                                   
 var Moo._lock_mid: [Moo]Tid;                                                                       
 var t_mid: Tid;                                                                                    
 var ABATestPtr._lock_mid: [ABATestPtr]Tid;                                                         
 var ABATestPtr._state_mid: [ABATestPtr]State;                                                      
 var w_mid: Moo;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Moo._state_mid: [Moo]State;                                                                    
 var ABATest._state_mid: [ABATest]State;                                                            
 var ABATest.x_mid: [ABATest]int;                                                                   
 var ABATest._lock_mid: [ABATest]Tid;                                                               
 var y_mid: ABATestPtr;                                                                             
 var x_mid: ABATestPtr;                                                                             
 var ABATest.x2_mid: [ABATest]int;                                                                  
 var v_mid: Moo;                                                                                    
 var ABATestPtr.x_mid: [ABATestPtr]Moo;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ABATestPtr.x[x];                                                                           
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_mid == ABATest._state && ABATest.x_mid == ABATest.x && ABATest.x2_mid == ABATest.x2 && ABATest._lock_mid == ABATest._lock && Moo._state_mid == Moo._state && Moo._lock_mid == Moo._lock && ABATestPtr._state_mid == ABATestPtr._state && ABATestPtr.x_mid == ABATestPtr.x && ABATestPtr._lock_mid == ABATestPtr._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ABATestPtr.x[x] := tmpV;                                                                           
 ABATestPtr.x[y] := w;                                                                              
 _writeByTPost := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ABATestPtr.x.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, w0: Moo, x: ABATestPtr, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATestPtr.x;                                                                             
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ABATestPtr.x(u: Tid,y: ABATestPtr,w: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[y] := w;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ABATestPtr.x(t: Tid,x: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ABATestPtr.x.ABATestPtr.x(t: Tid, u: Tid, v: Moo, w: Moo, w0: Moo, x: ABATestPtr, y: ABATestPtr)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ABATestPtr._state[x], t);                                                    
 requires isAccessible(ABATestPtr._state[y], u);                                                    
 modifies ABATestPtr.x;                                                                             
 modifies ABATestPtr.x;                                                                             
                                                                                                    
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
 var Moo._state_pre: [Moo]State;                                                                    
 var w0_pre: Moo;                                                                                   
 var ABATest._state_pre: [ABATest]State;                                                            
 var x_pre: ABATestPtr;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ABATestPtr._state_pre: [ABATestPtr]State;                                                      
 var w_pre: Moo;                                                                                    
 var ABATest.x_pre: [ABATest]int;                                                                   
 var ABATest._lock_pre: [ABATest]Tid;                                                               
 var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                             
 var ABATest.x2_pre: [ABATest]int;                                                                  
 var y_pre: ABATestPtr;                                                                             
 var v_pre: Moo;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Moo._lock_pre: [Moo]Tid;                                                                       
 var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: ABATestPtr;                                                                            
 var $recorded.state_post: int;                                                                     
 var w_post: Moo;                                                                                   
 var t_post: Tid;                                                                                   
 var x_post: ABATestPtr;                                                                            
 var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                        
 var Moo._state_post: [Moo]State;                                                                   
 var Moo._lock_post: [Moo]Tid;                                                                      
 var $pc_post: Phase;                                                                               
 var ABATest.x2_post: [ABATest]int;                                                                 
 var w0_post: Moo;                                                                                  
 var ABATestPtr.x_post: [ABATestPtr]Moo;                                                            
 var v_post: Moo;                                                                                   
 var ABATestPtr._state_post: [ABATestPtr]State;                                                     
 var ABATest._state_post: [ABATest]State;                                                           
 var ABATest.x_post: [ABATest]int;                                                                  
 var ABATest._lock_post: [ABATest]Tid;                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ABATestPtr.x(t: Tid,x: ABATestPtr,v: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ABATestPtr.x[x] := v;                                                                              
 assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ABATestPtr.x(u: Tid,y: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
requires ValidTid(tid);                                                                             
modifies ABATest._state;                                                                            
modifies ABATest.x;                                                                                 
modifies ABATest.x2;                                                                                
modifies ABATest._lock;                                                                             
modifies Moo._state;                                                                                
modifies Moo._lock;                                                                                 
modifies ABATestPtr._state;                                                                         
modifies ABATestPtr.x;                                                                              
modifies ABATestPtr._lock;                                                                          
ensures StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
ensures Y(tid , old(ABATest._state), old(ABATest.x), old(ABATest.x2), old(ABATest._lock), old(Moo._state), old(Moo._lock), old(ABATestPtr._state), old(ABATestPtr.x), old(ABATestPtr._lock) , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
                                                                                                    
// ABATest.x:                                                                                       
                                                                                                    
function {:inline} Y_ABATest.x(tid : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(ABATest._state[this], tid) && leq(m#moverPath(ReadEval.ABATest.x(tid: Tid,this: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (ABATest.x[this] == newValue))
 &&((newValue>=ABATest.x[this]))                                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ABATest.x(tid : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
 &&((newValue>=ABATest.x[this]))                                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x.Subsumes.W(tid : Tid, u : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume isAccessible(ABATest._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.ABATest.x(u: Tid,this: ABATest,newValue: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
                                                                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest.x(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x.Reflexive(tid : Tid, this: ABATest , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest.x(tid, this, ABATest.x[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x.Transitive(tid : Tid, this: ABATest, newValue : int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var this_pre: ABATest;                                                                              
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var newValue_pre: int;                                                                              
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATest;                                                                             
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_ABATest.x(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ABATest.x(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Check_ABATest.x.ABAFree(tid : Tid, this: ABATest, A : int, B : int)                       
 modifies ABATest.x;                                                                                
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ABATest.x[this] == A;                                                                     
 requires isAccessible(ABATest._state[this], tid);                                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var A_pre: int;                                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var this_pre: ABATest;                                                                              
var B_pre: int;                                                                                     
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var B_post: int;                                                                                    
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATest;                                                                             
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var A_post: int;                                                                                    
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_ABATest.x(tid, this, B , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 assume A != B;                                                                                     
ABATest.x[this] := B;                                                                               
assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_ABATest.x(tid, this, A , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock));
}                                                                                                   
// ABATest.x2:                                                                                      
                                                                                                    
function {:inline} Y_ABATest.x2(tid : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(ABATest._state[this], tid) && leq(m#moverPath(ReadEval.ABATest.x2(tid: Tid,this: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (ABATest.x2[this] == newValue))
 &&(true)                                                                                           
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ABATest.x2(tid : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x2.Subsumes.W(tid : Tid, u : Tid, this: ABATest, newValue: int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume isAccessible(ABATest._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.ABATest.x2(u: Tid,this: ABATest,newValue: int,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
                                                                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest.x2(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x2.Reflexive(tid : Tid, this: ABATest , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest.x2(tid, this, ABATest.x2[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest.x2.Transitive(tid : Tid, this: ABATest, newValue : int , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var this_pre: ABATest;                                                                              
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var newValue_pre: int;                                                                              
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATest;                                                                             
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_ABATest.x2(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ABATest.x2(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Check_ABATest.x2.ABAFree(tid : Tid, this: ABATest, A : int, B : int)                      
 modifies ABATest.x2;                                                                               
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ABATest.x2[this] == A;                                                                    
 requires isAccessible(ABATest._state[this], tid);                                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var A_pre: int;                                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var this_pre: ABATest;                                                                              
var B_pre: int;                                                                                     
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var B_post: int;                                                                                    
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATest;                                                                             
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var A_post: int;                                                                                    
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_ABATest.x2(tid, this, B , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 assume A != B;                                                                                     
ABATest.x2[this] := B;                                                                              
assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_ABATest.x2(tid, this, A , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock));
}                                                                                                   
// ABATest._lock:                                                                                   
                                                                                                    
function {:inline} Y_ABATest._lock(tid : Tid, this: ABATest, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(ABATest._state[this], tid) && leq(m#moverPath(ReadEval.ABATest._lock(tid: Tid,this: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (ABATest._lock[this] == newValue))
 &&(((ABATest._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ABATest._lock(tid : Tid, this: ABATest, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ABATest._lock.Subsumes.W(tid : Tid, u : Tid, this: ABATest, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume isAccessible(ABATest._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.ABATest._lock(u: Tid,this: ABATest,newValue: Tid,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
 assume leq(m#moverPath(ReadEval.ABATest._lock(tid: Tid,this: ABATest,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _N);
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest._lock.Reflexive(tid : Tid, this: ABATest , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: ABATest;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATest._lock(tid, this, ABATest._lock[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATest._lock.Transitive(tid : Tid, this: ABATest, newValue : Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var this_pre: ABATest;                                                                              
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var newValue_pre: Tid;                                                                              
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATest;                                                                             
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ABATest._state[this], tid);                                                    
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_ABATest._lock(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ABATest._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
// Moo._lock:                                                                                       
                                                                                                    
function {:inline} Y_Moo._lock(tid : Tid, this: Moo, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(Moo._state[this], tid) && leq(m#moverPath(ReadEval.Moo._lock(tid: Tid,this: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (Moo._lock[this] == newValue))
 &&(((Moo._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Moo._lock(tid : Tid, this: Moo, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Moo._lock.Subsumes.W(tid : Tid, u : Tid, this: Moo, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var this_yield: Moo;                                                                                
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Moo._state[this], tid);                                                        
 assume isAccessible(Moo._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Moo._lock(u: Tid,this: Moo,newValue: Tid,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
 assume leq(m#moverPath(ReadEval.Moo._lock(tid: Tid,this: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _N);
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Moo._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_Moo._lock.Reflexive(tid : Tid, this: Moo , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Moo;                                                                                
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Moo._state[this], tid);                                                        
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Moo._lock(tid, this, Moo._lock[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_Moo._lock.Transitive(tid : Tid, this: Moo, newValue : Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var this_pre: Moo;                                                                                  
var newValue_pre: Tid;                                                                              
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var this_post: Moo;                                                                                 
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Moo._state[this], tid);                                                        
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_Moo._lock(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Moo._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
// ABATestPtr.x:                                                                                    
                                                                                                    
function {:inline} Y_ABATestPtr.x(tid : Tid, this: ABATestPtr, newValue: Moo , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(ABATestPtr._state[this], tid) && leq(m#moverPath(ReadEval.ABATestPtr.x(tid: Tid,this: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (ABATestPtr.x[this] == newValue))
 &&(((newValue==ABATestPtr.x[this])||((!(isLocal(Moo._state[newValue], tid))&&!(isShared(Moo._state[newValue])))&&(newValue!=Moo.null))))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ABATestPtr.x(tid : Tid, this: ABATestPtr, newValue: Moo , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr.x.Subsumes.W(tid : Tid, u : Tid, this: ABATestPtr, newValue: Moo , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var newValue_yield: Moo;                                                                            
var this_yield: ABATestPtr;                                                                         
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
 assume isAccessible(ABATestPtr._state[this], u);                                                   
 assume !isError(m#moverPath(WriteEval.ABATestPtr.x(u: Tid,this: ABATestPtr,newValue: Moo,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
                                                                                                    
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATestPtr.x(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr.x.Reflexive(tid : Tid, this: ABATestPtr , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var this_yield: ABATestPtr;                                                                         
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATestPtr.x(tid, this, ABATestPtr.x[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr.x.Transitive(tid : Tid, this: ABATestPtr, newValue : Moo , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var this_pre: ABATestPtr;                                                                           
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
var newValue_pre: Moo;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var newValue_post: Moo;                                                                             
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATestPtr;                                                                          
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_ABATestPtr.x(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ABATestPtr.x(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Check_ABATestPtr.x.ABAFree(tid : Tid, this: ABATestPtr, A : Moo, B : Moo)                 
 modifies ABATestPtr.x;                                                                             
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ABATestPtr.x[this] == A;                                                                  
 requires isAccessible(ABATestPtr._state[this], tid);                                               
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var A_pre: Moo;                                                                                     
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var this_pre: ABATestPtr;                                                                           
var B_pre: Moo;                                                                                     
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var B_post: Moo;                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var A_post: Moo;                                                                                    
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATestPtr;                                                                          
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_ABATestPtr.x(tid, this, B , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 assume A != B;                                                                                     
ABATestPtr.x[this] := B;                                                                            
assume ABATest._state_post == ABATest._state && ABATest.x_post == ABATest.x && ABATest.x2_post == ABATest.x2 && ABATest._lock_post == ABATest._lock && Moo._state_post == Moo._state && Moo._lock_post == Moo._lock && ABATestPtr._state_post == ABATestPtr._state && ABATestPtr.x_post == ABATestPtr.x && ABATestPtr._lock_post == ABATestPtr._lock && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_ABATestPtr.x(tid, this, A , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock));
}                                                                                                   
// ABATestPtr._lock:                                                                                
                                                                                                    
function {:inline} Y_ABATestPtr._lock(tid : Tid, this: ABATestPtr, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 ((isAccessible(ABATestPtr._state[this], tid) && leq(m#moverPath(ReadEval.ABATestPtr._lock(tid: Tid,this: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _R)) ==> (ABATestPtr._lock[this] == newValue))
 &&(((ABATestPtr._lock[this]==tid)==(newValue==tid)))                                               
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ABATestPtr._lock(tid : Tid, this: ABATestPtr, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr._lock.Subsumes.W(tid : Tid, u : Tid, this: ABATestPtr, newValue: Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var this_yield: ABATestPtr;                                                                         
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var u_yield: Tid;                                                                                   
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
 assume isAccessible(ABATestPtr._state[this], u);                                                   
 assume !isError(m#moverPath(WriteEval.ABATestPtr._lock(u: Tid,this: ABATestPtr,newValue: Tid,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)));
 assume leq(m#moverPath(ReadEval.ABATestPtr._lock(tid: Tid,this: ABATestPtr,ABATest._state,ABATest.x,ABATest.x2,ABATest._lock,Moo._state,Moo._lock,ABATestPtr._state,ABATestPtr.x,ABATestPtr._lock)), _N);
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATestPtr._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr._lock.Reflexive(tid : Tid, this: ABATestPtr , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ABATestPtr._state_yield: [ABATestPtr]State;                                                     
var tid_yield: Tid;                                                                                 
var ABATestPtr.x_yield: [ABATestPtr]Moo;                                                            
var this_yield: ABATestPtr;                                                                         
var ABATestPtr._lock_yield: [ABATestPtr]Tid;                                                        
var Moo._state_yield: [Moo]State;                                                                   
var $pc_yield: Phase;                                                                               
var ABATest.x_yield: [ABATest]int;                                                                  
var Moo._lock_yield: [Moo]Tid;                                                                      
var ABATest.x2_yield: [ABATest]int;                                                                 
var ABATest._lock_yield: [ABATest]Tid;                                                              
var ABATest._state_yield: [ABATest]State;                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
assume ABATest._state_yield == ABATest._state && ABATest.x_yield == ABATest.x && ABATest.x2_yield == ABATest.x2 && ABATest._lock_yield == ABATest._lock && Moo._state_yield == Moo._state && Moo._lock_yield == Moo._lock && ABATestPtr._state_yield == ABATestPtr._state && ABATestPtr.x_yield == ABATestPtr.x && ABATestPtr._lock_yield == ABATestPtr._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ABATestPtr._lock(tid, this, ABATestPtr._lock[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
procedure Y_ABATestPtr._lock.Transitive(tid : Tid, this: ABATestPtr, newValue : Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid)
 requires StateInvariant(ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
 requires StateInvariant(ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Moo._state_pre: [Moo]State;                                                                     
var ABATest._state_pre: [ABATest]State;                                                             
var $recorded.state_pre: int;                                                                       
var ABATestPtr._state_pre: [ABATestPtr]State;                                                       
var ABATest.x_pre: [ABATest]int;                                                                    
var ABATest._lock_pre: [ABATest]Tid;                                                                
var ABATestPtr.x_pre: [ABATestPtr]Moo;                                                              
var tid_pre: Tid;                                                                                   
var ABATest.x2_pre: [ABATest]int;                                                                   
var $pc_pre: Phase;                                                                                 
var Moo._lock_pre: [Moo]Tid;                                                                        
var newValue_pre: Tid;                                                                              
var this_pre: ABATestPtr;                                                                           
var ABATestPtr._lock_pre: [ABATestPtr]Tid;                                                          
                                                                                                    
var $recorded.state_post: int;                                                                      
var ABATestPtr._lock_post: [ABATestPtr]Tid;                                                         
var Moo._state_post: [Moo]State;                                                                    
var Moo._lock_post: [Moo]Tid;                                                                       
var $pc_post: Phase;                                                                                
var ABATest.x2_post: [ABATest]int;                                                                  
var ABATestPtr.x_post: [ABATestPtr]Moo;                                                             
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var ABATestPtr._state_post: [ABATestPtr]State;                                                      
var this_post: ABATestPtr;                                                                          
var ABATest._state_post: [ABATest]State;                                                            
var ABATest.x_post: [ABATest]int;                                                                   
var ABATest._lock_post: [ABATest]Tid;                                                               
                                                                                                    
assume ABATest._state_pre == ABATest._state && ABATest.x_pre == ABATest.x && ABATest.x2_pre == ABATest.x2 && ABATest._lock_pre == ABATest._lock && Moo._state_pre == Moo._state && Moo._lock_pre == Moo._lock && ABATestPtr._state_pre == ABATestPtr._state && ABATestPtr.x_pre == ABATestPtr.x && ABATestPtr._lock_pre == ABATestPtr._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ABATestPtr._state[this], tid);                                                 
 assume Y(tid , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
 assume Y_ABATestPtr._lock(tid, this, newValue , ABATest._state_p, ABATest.x_p, ABATest.x2_p, ABATest._lock_p, Moo._state_p, Moo._lock_p, ABATestPtr._state_p, ABATestPtr.x_p, ABATestPtr._lock_p);
assume ABATest._state_post == ABATest._state_p && ABATest.x_post == ABATest.x_p && ABATest.x2_post == ABATest.x2_p && ABATest._lock_post == ABATest._lock_p && Moo._state_post == Moo._state_p && Moo._lock_post == Moo._lock_p && ABATestPtr._state_post == ABATestPtr._state_p && ABATestPtr.x_post == ABATestPtr.x_p && ABATestPtr._lock_post == ABATestPtr._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ABATestPtr._lock(tid, this, newValue , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , ABATest._state: [ABATest]State, ABATest.x: [ABATest]int, ABATest.x2: [ABATest]int, ABATest._lock: [ABATest]Tid, Moo._state: [Moo]State, Moo._lock: [Moo]Tid, ABATestPtr._state: [ABATestPtr]State, ABATestPtr.x: [ABATestPtr]Moo, ABATestPtr._lock: [ABATestPtr]Tid , ABATest._state_p: [ABATest]State, ABATest.x_p: [ABATest]int, ABATest.x2_p: [ABATest]int, ABATest._lock_p: [ABATest]Tid, Moo._state_p: [Moo]State, Moo._lock_p: [Moo]Tid, ABATestPtr._state_p: [ABATestPtr]State, ABATestPtr.x_p: [ABATestPtr]Moo, ABATestPtr._lock_p: [ABATestPtr]Tid): bool
{                                                                                                   
 (forall this: ABATest :: Y_ABATest.x(tid : Tid, this, ABATest.x_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall this: ABATest :: Y_ABATest.x2(tid : Tid, this, ABATest.x2_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall this: ABATest :: Y_ABATest._lock(tid : Tid, this, ABATest._lock_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall this: Moo :: Y_Moo._lock(tid : Tid, this, Moo._lock_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall this: ABATestPtr :: Y_ABATestPtr.x(tid : Tid, this, ABATestPtr.x_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall this: ABATestPtr :: Y_ABATestPtr._lock(tid : Tid, this, ABATestPtr._lock_p[this] , ABATest._state, ABATest.x, ABATest.x2, ABATest._lock, Moo._state, Moo._lock, ABATestPtr._state, ABATestPtr.x, ABATestPtr._lock))
 && (forall _i : ABATest :: isShared(ABATest._state[_i]) ==> isShared(ABATest._state_p[_i]))        
 && (forall _i : ABATest :: isLocal(ABATest._state[_i], tid) <==> isLocal(ABATest._state_p[_i], tid))
 && (forall _i : Moo :: isShared(Moo._state[_i]) ==> isShared(Moo._state_p[_i]))                    
 && (forall _i : Moo :: isLocal(Moo._state[_i], tid) <==> isLocal(Moo._state_p[_i], tid))           
 && (forall _i : ABATestPtr :: isShared(ABATestPtr._state[_i]) ==> isShared(ABATestPtr._state_p[_i]))
 && (forall _i : ABATestPtr :: isLocal(ABATestPtr._state[_i], tid) <==> isLocal(ABATestPtr._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 981.1-981.34: (4.3): ABATest.x failed Write-Write Right-Mover Check
// 1050.1-1050.30: (4.3): ABATest.x failed Write-Read Right-Mover Check
// 1123.1-1123.34: (4.3): ABATest.x failed Write-Write Left-Mover Check
// 1193.1-1193.30: (4.3): ABATest.x failed Write-Read Left-Mover Check
// 1260.1-1260.34: (4.3): ABATest.x failed Read-Write Right-Mover Check
// 1330.1-1330.34: (4.3): ABATest.x failed Read-Write Left-Mover Check
// 1399.1-1399.34: (8.3): ABATest.x2 failed Write-Write Right-Mover Check
// 1468.1-1468.30: (8.3): ABATest.x2 failed Write-Read Right-Mover Check
// 1541.1-1541.34: (8.3): ABATest.x2 failed Write-Write Left-Mover Check
// 1611.1-1611.30: (8.3): ABATest.x2 failed Write-Read Left-Mover Check
// 1678.1-1678.34: (8.3): ABATest.x2 failed Read-Write Right-Mover Check
// 1748.1-1748.34: (8.3): ABATest.x2 failed Read-Write Left-Mover Check
// 1817.1-1817.34: (20.3): ABATestPtr.x failed Write-Write Right-Mover Check
// 1886.1-1886.30: (20.3): ABATestPtr.x failed Write-Read Right-Mover Check
// 1959.1-1959.34: (20.3): ABATestPtr.x failed Write-Write Left-Mover Check
// 2029.1-2029.30: (20.3): ABATestPtr.x failed Write-Read Left-Mover Check
// 2096.1-2096.34: (20.3): ABATestPtr.x failed Read-Write Right-Mover Check
// 2166.1-2166.34: (20.3): ABATestPtr.x failed Read-Write Left-Mover Check
// 2247.1-2247.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.1)
// 2248.1-2248.101: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.2)
// 2249.1-2249.158: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case A.3)
// 2360.1-2360.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case C)
// 2476.1-2476.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case D)
// 2477.1-2477.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x (case R)
// 2558.1-2558.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case F)
// 2559.1-2559.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case H)
// 2560.1-2560.146: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x (case I)
// 2640.1-2640.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case J)
// 2641.1-2641.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case K)
// 2642.1-2642.99: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x (case L)
// 2724.1-2724.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.1)
// 2725.1-2725.101: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.2)
// 2726.1-2726.158: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case A.3)
// 2837.1-2837.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case C)
// 2953.1-2953.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case D)
// 2954.1-2954.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case R)
// 3035.1-3035.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case F)
// 3036.1-3036.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case H)
// 3037.1-3037.146: (4.3): ABATest.x is not Read-Write Stable with respect to ABATest.x2 (case I)
// 3117.1-3117.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case J)
// 3118.1-3118.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case K)
// 3119.1-3119.99: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x (case L)
// 3201.1-3201.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.1)
// 3202.1-3202.101: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.2)
// 3203.1-3203.156: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case A.3)
// 3314.1-3314.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case C)
// 3430.1-3430.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case D)
// 3431.1-3431.144: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case R)
// 3512.1-3512.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case F)
// 3513.1-3513.136: (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case H)
// 3514.1-3514.144: (4.3): ABATest.x is not Read-Write Stable with respect to ABATestPtr.x (case I)
// 3594.1-3594.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case J)
// 3595.1-3595.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case K)
// 3596.1-3596.99: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x (case L)
// 3678.1-3678.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.1)
// 3679.1-3679.101: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.2)
// 3680.1-3680.158: (4.3): ABATest.x is not Write-Write Stable with respect to ABATest.x2 (case A.3)
// 3791.1-3791.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case C)
// 3907.1-3907.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case D)
// 3908.1-3908.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x (case R)
// 3989.1-3989.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case F)
// 3990.1-3990.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case H)
// 3991.1-3991.146: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x (case I)
// 4071.1-4071.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case J)
// 4072.1-4072.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case K)
// 4073.1-4073.99: (4.3): ABATest.x is not Write-Read Stable with respect to ABATest.x2 (case L)
// 4155.1-4155.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.1)
// 4156.1-4156.101: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.2)
// 4157.1-4157.158: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case A.3)
// 4268.1-4268.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case C)
// 4384.1-4384.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case D)
// 4385.1-4385.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATest.x2 (case R)
// 4466.1-4466.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case F)
// 4467.1-4467.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case H)
// 4468.1-4468.146: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATest.x2 (case I)
// 4548.1-4548.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case J)
// 4549.1-4549.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case K)
// 4550.1-4550.99: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATest.x2 (case L)
// 4632.1-4632.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.1)
// 4633.1-4633.101: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.2)
// 4634.1-4634.156: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case A.3)
// 4745.1-4745.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case C)
// 4861.1-4861.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case D)
// 4862.1-4862.144: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case R)
// 4943.1-4943.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case F)
// 4944.1-4944.136: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case H)
// 4945.1-4945.144: (8.3): ABATest.x2 is not Read-Write Stable with respect to ABATestPtr.x (case I)
// 5025.1-5025.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case J)
// 5026.1-5026.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case K)
// 5027.1-5027.99: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATest.x2 (case L)
// 5109.1-5109.140: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
// 5110.1-5110.101: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
// 5111.1-5111.156: (4.3): ABATest.x is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
// 5222.1-5222.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case C)
// 5338.1-5338.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case D)
// 5339.1-5339.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x (case R)
// 5420.1-5420.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case F)
// 5421.1-5421.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case H)
// 5422.1-5422.144: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x (case I)
// 5502.1-5502.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case J)
// 5503.1-5503.136: (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case K)
// 5504.1-5504.99: (4.3): ABATest.x is not Write-Read Stable with respect to ABATestPtr.x (case L)
// 5586.1-5586.140: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
// 5587.1-5587.101: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
// 5588.1-5588.156: (8.3): ABATest.x2 is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
// 5699.1-5699.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case C)
// 5815.1-5815.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case D)
// 5816.1-5816.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATest.x2 (case R)
// 5897.1-5897.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case F)
// 5898.1-5898.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case H)
// 5899.1-5899.144: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATest.x2 (case I)
// 5979.1-5979.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case J)
// 5980.1-5980.136: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case K)
// 5981.1-5981.99: (8.3): ABATest.x2 is not Write-Read Stable with respect to ABATestPtr.x (case L)
// 6063.1-6063.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.1)
// 6064.1-6064.101: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.2)
// 6065.1-6065.158: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case A.3)
// 6176.1-6176.140: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case C)
// 6292.1-6292.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case D)
// 6293.1-6293.144: (20.3): ABATestPtr.x is not Write-Write Stable with respect to ABATestPtr.x (case R)
// 6374.1-6374.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case F)
// 6375.1-6375.136: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case H)
// 6376.1-6376.146: (20.3): ABATestPtr.x is not Read-Write Stable with respect to ABATestPtr.x (case I)
// 6456.1-6456.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case J)
// 6457.1-6457.136: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case K)
// 6458.1-6458.99: (20.3): ABATestPtr.x is not Write-Read Stable with respect to ABATestPtr.x (case L)
// 6497.1-6522.2: (5.37): yields_as clause for ABATest.x is not valid
// 6527.1-6547.2: (5.37): yields_as clause for ABATest.x is not reflexive
// 6553.1-6593.2: (5.37): yields_as clause for ABATest.x is not transitive
// 6601.1-6643.2: (5.37): ABATest.x is not ABA-free
// 6663.1-6688.2: (9.28): yields_as clause for ABATest.x2 is not valid
// 6693.1-6713.2: (9.28): yields_as clause for ABATest.x2 is not reflexive
// 6719.1-6759.2: (9.28): yields_as clause for ABATest.x2 is not transitive
// 6767.1-6809.2: (9.28): ABATest.x2 is not ABA-free
// 6829.1-6854.2: (7.32): yields_as clause for ABATest._lock is not valid
// 6859.1-6879.2: (7.32): yields_as clause for ABATest._lock is not reflexive
// 6885.1-6925.2: (7.32): yields_as clause for ABATest._lock is not transitive
// 6945.1-6970.2: (7.32): yields_as clause for Moo._lock is not valid
// 6975.1-6995.2: (7.32): yields_as clause for Moo._lock is not reflexive
// 7001.1-7041.2: (7.32): yields_as clause for Moo._lock is not transitive
// 7061.1-7086.2: (23.24): yields_as clause for ABATestPtr.x is not valid
// 7091.1-7111.2: (23.24): yields_as clause for ABATestPtr.x is not reflexive
// 7117.1-7157.2: (23.24): yields_as clause for ABATestPtr.x is not transitive
// 7165.1-7207.2: (23.24): ABATestPtr.x is not ABA-free
// 7227.1-7252.2: (7.32): yields_as clause for ABATestPtr._lock is not valid
// 7257.1-7277.2: (7.32): yields_as clause for ABATestPtr._lock is not reflexive
// 7283.1-7323.2: (7.32): yields_as clause for ABATestPtr._lock is not transitive
