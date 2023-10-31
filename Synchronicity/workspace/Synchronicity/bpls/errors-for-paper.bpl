                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/errors-for-paper.anchor:                
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       int value holds(this, tid) ? B : E                                                           
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertMustObeyDiscipline() {                                                      
        int oldValue;                                                                               
        synchronized (this) {                                                                       
          oldValue := this.value;                                                                   
          int tmp1;                                                                                 
          tmp1 = oldValue + 1;                                                                      
          this.value := tmp1;                                                                       
        }                                                                                           
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 := this.value;                                                                         
        tmp2 = tmp3 > oldValue;                                                                     
        assert tmp2 /* == this.value > oldValue */;                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void howToHandleAssumes() {                                                            
        int oldValue;                                                                               
        synchronized (this) {                                                                       
          oldValue := this.value;                                                                   
          int tmp4;                                                                                 
          tmp4 = oldValue + 1;                                                                      
          this.value := tmp4;                                                                       
        }                                                                                           
        synchronized (this) {                                                                       
          boolean tmp5;                                                                             
          int tmp6;                                                                                 
          tmp6 := this.value;                                                                       
          tmp5 = tmp6 > oldValue;                                                                   
          assert tmp5 /* == this.value > oldValue */;                                               
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertionFailure() {                                                              
        int oldValue;                                                                               
        synchronized (this) {                                                                       
          oldValue := this.value;                                                                   
          int tmp7;                                                                                 
          tmp7 = oldValue + 1;                                                                      
          this.value := tmp7;                                                                       
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          boolean tmp8;                                                                             
          int tmp9;                                                                                 
          tmp9 := this.value;                                                                       
          tmp8 = tmp9 > oldValue;                                                                   
          assert tmp8 /* == this.value > oldValue */;                                               
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       int value holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertMustObeyDiscipline() {                                                      
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp1;                                                                               
            tmp1 = oldValue + 1;                                                                    
            this.value := tmp1;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 := this.value;                                                                         
        tmp2 = tmp3 > oldValue;                                                                     
        assert tmp2 /* == this.value > oldValue */;                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void howToHandleAssumes() {                                                            
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp4;                                                                               
            tmp4 = oldValue + 1;                                                                    
            this.value := tmp4;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 := this.value;                                                                     
            tmp5 = tmp6 > oldValue;                                                                 
            assert tmp5 /* == this.value > oldValue */;                                             
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertionFailure() {                                                              
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp7;                                                                               
            tmp7 = oldValue + 1;                                                                    
            this.value := tmp7;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp8;                                                                           
            int tmp9;                                                                               
            tmp9 := this.value;                                                                     
            tmp8 = tmp9 > oldValue;                                                                 
            assert tmp8 /* == this.value > oldValue */;                                             
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       int value holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertMustObeyDiscipline() {                                                      
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp1;                                                                               
            tmp1 = oldValue + 1;                                                                    
            this.value := tmp1;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 := this.value;                                                                         
        tmp2 = tmp3 > oldValue;                                                                     
        assert tmp2 /* == this.value > oldValue */;                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void howToHandleAssumes() {                                                            
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp4;                                                                               
            tmp4 = oldValue + 1;                                                                    
            this.value := tmp4;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 := this.value;                                                                     
            tmp5 = tmp6 > oldValue;                                                                 
            assert tmp5 /* == this.value > oldValue */;                                             
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertionFailure() {                                                              
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp7;                                                                               
            tmp7 = oldValue + 1;                                                                    
            this.value := tmp7;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp8;                                                                           
            int tmp9;                                                                               
            tmp9 := this.value;                                                                     
            tmp8 = tmp9 > oldValue;                                                                 
            assert tmp8 /* == this.value > oldValue */;                                             
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       int value holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertMustObeyDiscipline() {                                                      
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp1;                                                                               
            tmp1 = oldValue + 1;                                                                    
            this.value := tmp1;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 := this.value;                                                                         
        tmp2 = tmp3 > oldValue;                                                                     
        assert tmp2 /* == this.value > oldValue */;                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void howToHandleAssumes() {                                                            
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp4;                                                                               
            tmp4 = oldValue + 1;                                                                    
            this.value := tmp4;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 := this.value;                                                                     
            tmp5 = tmp6 > oldValue;                                                                 
            assert tmp5 /* == this.value > oldValue */;                                             
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void assertionFailure() {                                                              
        int oldValue;                                                                               
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            oldValue := this.value;                                                                 
            int tmp7;                                                                               
            tmp7 = oldValue + 1;                                                                    
            this.value := tmp7;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp8;                                                                           
            int tmp9;                                                                               
            tmp9 := this.value;                                                                     
            tmp8 = tmp9 > oldValue;                                                                 
            assert tmp8 /* == this.value > oldValue */;                                             
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
                                                                                                    
                                                                                                    
/*** Class Decl Example ***/                                                                        
                                                                                                    
type Example;                                                                                       
const unique Example.null: Example;                                                                 
var Example._state: [Example]State;                                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Example.value: [Example]int;                                                                    
                                                                                                    
function {:inline} ReadEval.Example.value(tid: Tid,this : Example,Example._state: [Example]State,Example.value: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(Example._state[this], tid) && Example._lock[this] == tid)) then                  
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example.value(tid: Tid,this : Example,newValue: int,Example._state: [Example]State,Example.value: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Example._state[this], tid) && Example._lock[this] == tid)) then                  
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example._lock: [Example]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.Example._lock(tid: Tid,this : Example,Example._state: [Example]State,Example.value: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Example._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example._lock(tid: Tid,this : Example,newValue: Tid,Example._state: [Example]State,Example.value: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Example._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Example.assertMustObeyDiscipline(tid:Tid, this : Example)                                
modifies Example._state;                                                                            
modifies Example.value;                                                                             
modifies Example._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.3): Bad tid
requires isShared(Example._state[this]);                                                                   // (6.3): this is not global
                                                                                                    
requires StateInvariant(Example._state, Example.value, Example._lock);                              
                                                                                                    
ensures StateInvariant(Example._state, Example.value, Example._lock);                               
{                                                                                                   
 var this1264096: Example;                                                                          
 var oldValue1264083: int;                                                                          
 var $pc1264096: Phase;                                                                             
 var $recorded.state1264123: int;                                                                   
 var tmp21264123: bool;                                                                             
 var oldValue1264096: int;                                                                          
 var Example._state1264083: [Example]State;                                                         
 var tid1264096: Tid;                                                                               
 var $recorded.state1264124: int;                                                                   
 var moverPath1264096: MoverPath;                                                                   
 var path1264109: int;                                                                              
 var oldValue1264123: int;                                                                          
 var oldValue1264124: int;                                                                          
 var Example.value1264123: [Example]int;                                                            
 var Example._state1264109: [Example]State;                                                         
 var tid1264123: Tid;                                                                               
 var $recorded.state1264096: int;                                                                   
 var tmp2: bool;                                                                                    
 var oldValue1264109: int;                                                                          
 var mover1264096: Mover;                                                                           
 var tid1264124: Tid;                                                                               
 var $pc1264123: Phase;                                                                             
 var Example._lock1264123: [Example]Tid;                                                            
 var this1264083: Example;                                                                          
 var mover1264083: Mover;                                                                           
 var tmp31264109: int;                                                                              
 var moverPath1264083: MoverPath;                                                                   
 var Example.value1264109: [Example]int;                                                            
 var $pc1264109: Phase;                                                                             
 var $pc1264124: Phase;                                                                             
 var tmp11264096: int;                                                                              
 var tmp31264124: int;                                                                              
 var moverPath1264109: MoverPath;                                                                   
 var $recorded.state1264109: int;                                                                   
 var this1264124: Example;                                                                          
 var $pc1264083: Phase;                                                                             
 var this1264109: Example;                                                                          
 var path1264083: int;                                                                              
 var tmp1: int;                                                                                     
 var Example.value1264083: [Example]int;                                                            
 var mover1264109: Mover;                                                                           
 var tid1264109: Tid;                                                                               
 var tmp21264109: bool;                                                                             
 var Example._state1264123: [Example]State;                                                         
 var tmp21264124: bool;                                                                             
 var Example._lock1264124: [Example]Tid;                                                            
 var path1264096: int;                                                                              
 var tmp31264123: int;                                                                              
 var oldValue: int;                                                                                 
 var Example._lock1264109: [Example]Tid;                                                            
 var Example._state1264096: [Example]State;                                                         
 var Example.value1264096: [Example]int;                                                            
 var tmp3: int;                                                                                     
 var $recorded.state1264083: int;                                                                   
 var Example._lock1264096: [Example]Tid;                                                            
 var Example.value1264124: [Example]int;                                                            
 var tid1264083: Tid;                                                                               
 var Example._lock1264083: [Example]Tid;                                                            
 var this1264123: Example;                                                                          
 var Example._state1264124: [Example]State;                                                         
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.5: int oldValue;                                                                              
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (8.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Example._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (8.18): Reduction failure
 Example._lock[this] := tid;                                                                        
                                                                                                    
 // 9.7: oldValue := this.value;                                                                    
                                                                                                    
                                                                                                    
 moverPath1264083 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264083 := m#moverPath(moverPath1264083);                                                     
 path1264083 := p#moverPath(moverPath1264083);                                                      
 assume Example._state1264083 == Example._state && Example.value1264083 == Example.value && Example._lock1264083 == Example._lock && oldValue1264083 == oldValue && this1264083 == this && tid1264083 == tid && $pc1264083 == $pc;
 assume $recorded.state1264083 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (9.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264083);                                                              
 assert $pc != PhaseError;                                                                                 // (9.7): Reduction failure
 oldValue := Example.value[this];                                                                   
                                                                                                    
 // 10.7: int tmp1;                                                                                 
                                                                                                    
                                                                                                    
 // 10.7: tmp1 = oldValue + 1;                                                                      
                                                                                                    
 tmp1 := (oldValue+1);                                                                              
                                                                                                    
                                                                                                    
 // 10.7: this.value := tmp1;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264096 := WriteEval.Example.value(tid: Tid,this: Example,tmp1: int,Example._state,Example.value,Example._lock);
 mover1264096 := m#moverPath(moverPath1264096);                                                     
 path1264096 := p#moverPath(moverPath1264096);                                                      
 assume Example._state1264096 == Example._state && Example.value1264096 == Example.value && Example._lock1264096 == Example._lock && tmp11264096 == tmp1 && oldValue1264096 == oldValue && this1264096 == this && tid1264096 == tid && $pc1264096 == $pc;
 assume $recorded.state1264096 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (10.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1264096);                                                              
 assert $pc != PhaseError;                                                                                 // (10.7): Reduction failure
 Example.value[this] := tmp1;                                                                       
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (11.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Example._lock[this] == tid;                                                                        // (11.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (11.5): Reduction failure
 Example._lock[this] := Tid.null;                                                                   
                                                                                                    
 // 12.5: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 12.5: int tmp3;                                                                                 
                                                                                                    
                                                                                                    
 // 12.5: tmp3 := this.value;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264109 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264109 := m#moverPath(moverPath1264109);                                                     
 path1264109 := p#moverPath(moverPath1264109);                                                      
 assume Example._state1264109 == Example._state && Example.value1264109 == Example.value && Example._lock1264109 == Example._lock && tmp31264109 == tmp3 && tmp21264109 == tmp2 && oldValue1264109 == oldValue && this1264109 == this && tid1264109 == tid && $pc1264109 == $pc;
 assume $recorded.state1264109 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (12.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264109);                                                              
 assert $pc != PhaseError;                                                                                 // (12.5): Reduction failure
 tmp3 := Example.value[this];                                                                       
                                                                                                    
 // 12.5: tmp2 = tmp3 > oldValue;                                                                   
                                                                                                    
 tmp2 := (tmp3>oldValue);                                                                           
                                                                                                    
 // 12.5: assert tmp2 /* == this.value > oldValue */;                                               
                                                                                                    
 assume Example._state1264123 == Example._state && Example.value1264123 == Example.value && Example._lock1264123 == Example._lock && tmp31264123 == tmp3 && tmp21264123 == tmp2 && oldValue1264123 == oldValue && this1264123 == this && tid1264123 == tid;
 assume $recorded.state1264123 == 1;                                                                
 assert tmp2 /* lowered (Example.value[this]>oldValue) */;                                                 // (12.5): This assertion may not hold.
                                                                                                    
 // 6.43: // return;                                                                                
                                                                                                    
 assume Example._state1264124 == Example._state && Example.value1264124 == Example.value && Example._lock1264124 == Example._lock && tmp31264124 == tmp3 && tmp21264124 == tmp2 && oldValue1264124 == oldValue && this1264124 == this && tid1264124 == tid;
 assume $recorded.state1264124 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Example.howToHandleAssumes(tid:Tid, this : Example)                                      
modifies Example._state;                                                                            
modifies Example.value;                                                                             
modifies Example._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.3): Bad tid
requires isShared(Example._state[this]);                                                                   // (15.3): this is not global
                                                                                                    
requires StateInvariant(Example._state, Example.value, Example._lock);                              
                                                                                                    
ensures StateInvariant(Example._state, Example.value, Example._lock);                               
{                                                                                                   
 var tmp61264177: int;                                                                              
 var Example._state1264163: [Example]State;                                                         
 var tid1264163: Tid;                                                                               
 var this1264177: Example;                                                                          
 var Example._state1264148: [Example]State;                                                         
 var Example.value1264163: [Example]int;                                                            
 var tmp5: bool;                                                                                    
 var oldValue1264148: int;                                                                          
 var oldValue1264182: int;                                                                          
 var Example._lock1264135: [Example]Tid;                                                            
 var $recorded.state1264135: int;                                                                   
 var oldValue1264135: int;                                                                          
 var Example.value1264135: [Example]int;                                                            
 var tid1264182: Tid;                                                                               
 var Example.value1264177: [Example]int;                                                            
 var this1264182: Example;                                                                          
 var tmp51264163: bool;                                                                             
 var $recorded.state1264182: int;                                                                   
 var Example._state1264177: [Example]State;                                                         
 var $recorded.state1264148: int;                                                                   
 var $pc1264177: Phase;                                                                             
 var path1264135: int;                                                                              
 var $recorded.state1264163: int;                                                                   
 var Example._lock1264163: [Example]Tid;                                                            
 var Example._lock1264148: [Example]Tid;                                                            
 var $pc1264182: Phase;                                                                             
 var $pc1264135: Phase;                                                                             
 var path1264148: int;                                                                              
 var path1264163: int;                                                                              
 var this1264148: Example;                                                                          
 var tmp41264148: int;                                                                              
 var moverPath1264135: MoverPath;                                                                   
 var mover1264148: Mover;                                                                           
 var tmp51264177: bool;                                                                             
 var mover1264135: Mover;                                                                           
 var moverPath1264163: MoverPath;                                                                   
 var $recorded.state1264177: int;                                                                   
 var $pc1264148: Phase;                                                                             
 var mover1264163: Mover;                                                                           
 var tid1264135: Tid;                                                                               
 var Example._state1264135: [Example]State;                                                         
 var $pc1264163: Phase;                                                                             
 var oldValue: int;                                                                                 
 var this1264163: Example;                                                                          
 var moverPath1264148: MoverPath;                                                                   
 var Example._state1264182: [Example]State;                                                         
 var this1264135: Example;                                                                          
 var Example.value1264182: [Example]int;                                                            
 var tid1264177: Tid;                                                                               
 var oldValue1264163: int;                                                                          
 var Example.value1264148: [Example]int;                                                            
 var oldValue1264177: int;                                                                          
 var tid1264148: Tid;                                                                               
 var Example._lock1264182: [Example]Tid;                                                            
 var Example._lock1264177: [Example]Tid;                                                            
 var tmp4: int;                                                                                     
 var tmp61264163: int;                                                                              
 var tmp6: int;                                                                                     
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 16.5: int oldValue;                                                                             
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (17.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Example._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (17.18): Reduction failure
 Example._lock[this] := tid;                                                                        
                                                                                                    
 // 18.7: oldValue := this.value;                                                                   
                                                                                                    
                                                                                                    
 moverPath1264135 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264135 := m#moverPath(moverPath1264135);                                                     
 path1264135 := p#moverPath(moverPath1264135);                                                      
 assume Example._state1264135 == Example._state && Example.value1264135 == Example.value && Example._lock1264135 == Example._lock && oldValue1264135 == oldValue && this1264135 == this && tid1264135 == tid && $pc1264135 == $pc;
 assume $recorded.state1264135 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (18.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264135);                                                              
 assert $pc != PhaseError;                                                                                 // (18.7): Reduction failure
 oldValue := Example.value[this];                                                                   
                                                                                                    
 // 19.7: int tmp4;                                                                                 
                                                                                                    
                                                                                                    
 // 19.7: tmp4 = oldValue + 1;                                                                      
                                                                                                    
 tmp4 := (oldValue+1);                                                                              
                                                                                                    
                                                                                                    
 // 19.7: this.value := tmp4;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264148 := WriteEval.Example.value(tid: Tid,this: Example,tmp4: int,Example._state,Example.value,Example._lock);
 mover1264148 := m#moverPath(moverPath1264148);                                                     
 path1264148 := p#moverPath(moverPath1264148);                                                      
 assume Example._state1264148 == Example._state && Example.value1264148 == Example.value && Example._lock1264148 == Example._lock && tmp41264148 == tmp4 && oldValue1264148 == oldValue && this1264148 == this && tid1264148 == tid && $pc1264148 == $pc;
 assume $recorded.state1264148 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (19.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1264148);                                                              
 assert $pc != PhaseError;                                                                                 // (19.7): Reduction failure
 Example.value[this] := tmp4;                                                                       
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (20.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Example._lock[this] == tid;                                                                        // (20.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (20.5): Reduction failure
 Example._lock[this] := Tid.null;                                                                   
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (22.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Example._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.18): Reduction failure
 Example._lock[this] := tid;                                                                        
                                                                                                    
 // 23.7: boolean tmp5;                                                                             
                                                                                                    
                                                                                                    
 // 23.7: int tmp6;                                                                                 
                                                                                                    
                                                                                                    
 // 23.7: tmp6 := this.value;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264163 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264163 := m#moverPath(moverPath1264163);                                                     
 path1264163 := p#moverPath(moverPath1264163);                                                      
 assume Example._state1264163 == Example._state && Example.value1264163 == Example.value && Example._lock1264163 == Example._lock && tmp61264163 == tmp6 && tmp51264163 == tmp5 && oldValue1264163 == oldValue && this1264163 == this && tid1264163 == tid && $pc1264163 == $pc;
 assume $recorded.state1264163 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (23.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264163);                                                              
 assert $pc != PhaseError;                                                                                 // (23.7): Reduction failure
 tmp6 := Example.value[this];                                                                       
                                                                                                    
 // 23.7: tmp5 = tmp6 > oldValue;                                                                   
                                                                                                    
 tmp5 := (tmp6>oldValue);                                                                           
                                                                                                    
 // 23.7: assert tmp5 /* == this.value > oldValue */;                                               
                                                                                                    
 assume Example._state1264177 == Example._state && Example.value1264177 == Example.value && Example._lock1264177 == Example._lock && tmp61264177 == tmp6 && tmp51264177 == tmp5 && oldValue1264177 == oldValue && this1264177 == this && tid1264177 == tid;
 assume $recorded.state1264177 == 1;                                                                
 assert tmp5 /* lowered (Example.value[this]>oldValue) */;                                                 // (23.7): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Example._lock[this] == tid;                                                                        // (24.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 Example._lock[this] := Tid.null;                                                                   
                                                                                                    
 // 15.37: // return;                                                                               
                                                                                                    
 assume Example._state1264182 == Example._state && Example.value1264182 == Example.value && Example._lock1264182 == Example._lock && oldValue1264182 == oldValue && this1264182 == this && tid1264182 == tid;
 assume $recorded.state1264182 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Example.assertionFailure(tid:Tid, this : Example)                                        
modifies Example._state;                                                                            
modifies Example.value;                                                                             
modifies Example._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (27.3): Bad tid
requires isShared(Example._state[this]);                                                                   // (27.3): this is not global
                                                                                                    
requires StateInvariant(Example._state, Example.value, Example._lock);                              
                                                                                                    
ensures StateInvariant(Example._state, Example.value, Example._lock);                               
{                                                                                                   
 var tmp91264236: int;                                                                              
 var this1264241: Example;                                                                          
 var path1264206: int;                                                                              
 var this1264236: Example;                                                                          
 var Example._lock1264222: [Example]Tid;                                                            
 var oldValue1264206: int;                                                                          
 var Example.value1264236: [Example]int;                                                            
 var path1264193: int;                                                                              
 var Example._state1264236: [Example]State;                                                         
 var Example._state1264193: [Example]State;                                                         
 var tid1264222: Tid;                                                                               
 var tmp81264236: bool;                                                                             
 var $recorded.state1264193: int;                                                                   
 var this1264211: Example;                                                                          
 var Example._state1264211_post: [Example]State;                                                    
 var moverPath1264193: MoverPath;                                                                   
 var tid1264211: Tid;                                                                               
 var Example.value1264241: [Example]int;                                                            
 var this1264222: Example;                                                                          
 var Example._lock1264206: [Example]Tid;                                                            
 var Example._lock1264211: [Example]Tid;                                                            
 var $recorded.state1264211_post: int;                                                              
 var tid1264236: Tid;                                                                               
 var mover1264222: Mover;                                                                           
 var tmp9: int;                                                                                     
 var Example._lock1264193: [Example]Tid;                                                            
 var Example._lock1264241: [Example]Tid;                                                            
 var tid1264206: Tid;                                                                               
 var path1264222: int;                                                                              
 var tid1264241: Tid;                                                                               
 var Example._lock1264211_post: [Example]Tid;                                                       
 var $pc1264236: Phase;                                                                             
 var Example.value1264211: [Example]int;                                                            
 var oldValue1264211_post: int;                                                                     
 var mover1264193: Mover;                                                                           
 var moverPath1264222: MoverPath;                                                                   
 var oldValue1264241: int;                                                                          
 var oldValue1264222: int;                                                                          
 var $pc1264211_post: Phase;                                                                        
 var tmp81264222: bool;                                                                             
 var Example._state1264241: [Example]State;                                                         
 var oldValue1264211: int;                                                                          
 var Example._lock1264236: [Example]Tid;                                                            
 var tid1264211_post: Tid;                                                                          
 var $pc1264222: Phase;                                                                             
 var oldValue1264236: int;                                                                          
 var $recorded.state1264241: int;                                                                   
 var $recorded.state1264211: int;                                                                   
 var Example.value1264222: [Example]int;                                                            
 var Example._state1264222: [Example]State;                                                         
 var Example._state1264206: [Example]State;                                                         
 var oldValue1264193: int;                                                                          
 var Example.value1264211_post: [Example]int;                                                       
 var $pc1264193: Phase;                                                                             
 var $pc1264206: Phase;                                                                             
 var oldValue: int;                                                                                 
 var this1264211_post: Example;                                                                     
 var tmp7: int;                                                                                     
 var this1264193: Example;                                                                          
 var $pc1264241: Phase;                                                                             
 var $recorded.state1264236: int;                                                                   
 var Example.value1264193: [Example]int;                                                            
 var moverPath1264206: MoverPath;                                                                   
 var this1264206: Example;                                                                          
 var mover1264206: Mover;                                                                           
 var $recorded.state1264222: int;                                                                   
 var tmp8: bool;                                                                                    
 var tmp91264222: int;                                                                              
 var Example.value1264206: [Example]int;                                                            
 var tid1264193: Tid;                                                                               
 var $recorded.state1264206: int;                                                                   
 var $pc1264211: Phase;                                                                             
 var tmp71264206: int;                                                                              
 var Example._state1264211: [Example]State;                                                         
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 28.5: int oldValue;                                                                             
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (29.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Example._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (29.18): Reduction failure
 Example._lock[this] := tid;                                                                        
                                                                                                    
 // 30.7: oldValue := this.value;                                                                   
                                                                                                    
                                                                                                    
 moverPath1264193 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264193 := m#moverPath(moverPath1264193);                                                     
 path1264193 := p#moverPath(moverPath1264193);                                                      
 assume Example._state1264193 == Example._state && Example.value1264193 == Example.value && Example._lock1264193 == Example._lock && oldValue1264193 == oldValue && this1264193 == this && tid1264193 == tid && $pc1264193 == $pc;
 assume $recorded.state1264193 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (30.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264193);                                                              
 assert $pc != PhaseError;                                                                                 // (30.7): Reduction failure
 oldValue := Example.value[this];                                                                   
                                                                                                    
 // 31.7: int tmp7;                                                                                 
                                                                                                    
                                                                                                    
 // 31.7: tmp7 = oldValue + 1;                                                                      
                                                                                                    
 tmp7 := (oldValue+1);                                                                              
                                                                                                    
                                                                                                    
 // 31.7: this.value := tmp7;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264206 := WriteEval.Example.value(tid: Tid,this: Example,tmp7: int,Example._state,Example.value,Example._lock);
 mover1264206 := m#moverPath(moverPath1264206);                                                     
 path1264206 := p#moverPath(moverPath1264206);                                                      
 assume Example._state1264206 == Example._state && Example.value1264206 == Example.value && Example._lock1264206 == Example._lock && tmp71264206 == tmp7 && oldValue1264206 == oldValue && this1264206 == this && tid1264206 == tid && $pc1264206 == $pc;
 assume $recorded.state1264206 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (31.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1264206);                                                              
 assert $pc != PhaseError;                                                                                 // (31.7): Reduction failure
 Example.value[this] := tmp7;                                                                       
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (32.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Example._lock[this] == tid;                                                                        // (32.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (32.5): Reduction failure
 Example._lock[this] := Tid.null;                                                                   
                                                                                                    
 // 33.5: yield;                                                                                    
                                                                                                    
 assume Example._state1264211 == Example._state && Example.value1264211 == Example.value && Example._lock1264211 == Example._lock && oldValue1264211 == oldValue && this1264211 == this && tid1264211 == tid;
 assume $recorded.state1264211 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Example._state1264211_post == Example._state && Example.value1264211_post == Example.value && Example._lock1264211_post == Example._lock && oldValue1264211_post == oldValue && this1264211_post == this && tid1264211_post == tid;
 assume $recorded.state1264211_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (34.18): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Example._lock[this] == Tid.null;                                                            
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (34.18): Reduction failure
 Example._lock[this] := tid;                                                                        
                                                                                                    
 // 35.7: boolean tmp8;                                                                             
                                                                                                    
                                                                                                    
 // 35.7: int tmp9;                                                                                 
                                                                                                    
                                                                                                    
 // 35.7: tmp9 := this.value;                                                                       
                                                                                                    
                                                                                                    
 moverPath1264222 := ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock);
 mover1264222 := m#moverPath(moverPath1264222);                                                     
 path1264222 := p#moverPath(moverPath1264222);                                                      
 assume Example._state1264222 == Example._state && Example.value1264222 == Example.value && Example._lock1264222 == Example._lock && tmp91264222 == tmp9 && tmp81264222 == tmp8 && oldValue1264222 == oldValue && this1264222 == this && tid1264222 == tid && $pc1264222 == $pc;
 assume $recorded.state1264222 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (35.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover1264222);                                                              
 assert $pc != PhaseError;                                                                                 // (35.7): Reduction failure
 tmp9 := Example.value[this];                                                                       
                                                                                                    
 // 35.7: tmp8 = tmp9 > oldValue;                                                                   
                                                                                                    
 tmp8 := (tmp9>oldValue);                                                                           
                                                                                                    
 // 35.7: assert tmp8 /* == this.value > oldValue */;                                               
                                                                                                    
 assume Example._state1264236 == Example._state && Example.value1264236 == Example.value && Example._lock1264236 == Example._lock && tmp91264236 == tmp9 && tmp81264236 == tmp8 && oldValue1264236 == oldValue && this1264236 == this && tid1264236 == tid;
 assume $recorded.state1264236 == 1;                                                                
 assert tmp8 /* lowered (Example.value[this]>oldValue) */;                                                 // (35.7): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (36.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Example._lock[this] == tid;                                                                        // (36.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (36.5): Reduction failure
 Example._lock[this] := Tid.null;                                                                   
                                                                                                    
 // 27.35: // return;                                                                               
                                                                                                    
 assume Example._state1264241 == Example._state && Example.value1264241 == Example.value && Example._lock1264241 == Example._lock && oldValue1264241 == oldValue && this1264241 == this && tid1264241 == tid;
 assume $recorded.state1264241 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Example._state: [Example]State,Example.value: [Example]int,Example._lock: [Example]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Example  :: _i == Example.null <==> isNull(Example._state[_i])) &&                    
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)    
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.value[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.value(u: Tid,x: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example.value failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)     
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.value[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example.value(u: Tid,x: Example,Example._state,Example.value,Example._lock);  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): Example.value failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)     
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.value[x];                                                                      
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example.value[x] := havocValue;                                                                    
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.value(u: Tid,x: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example.value failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)      
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.value[x];                                                                      
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example.value(u: Tid,x: Example,Example._state,Example.value,Example._lock);  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): Example.value failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)          
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.value(t: Tid,x: Example,Example._state,Example.value,Example._lock);  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example.value(u: Tid,x: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example.value failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example.value(t: Tid, u: Tid, v: int, w: int, x: Example)           
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.value;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume w == Example.value[x];                                                                      
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.value(t: Tid,x: Example,Example._state,Example.value,Example._lock);  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example.value[x] := havocValue;                                                                    
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example.value(u: Tid,x: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example.value failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.value.Example.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.value;                                                                            
 modifies Example.value;                                                                            
                                                                                                    
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
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.value[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.value.Example.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.value;                                                                            
 modifies Example.value;                                                                            
                                                                                                    
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
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var Example.value_mid: [Example]int;                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.value[x];                                                                          
 Example.value[x] := v;                                                                             
                                                                                                    
 assume Example._state_mid == Example._state && Example.value_mid == Example.value && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.value[x] := tmpV;                                                                          
 Example.value[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.value.Example.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.value;                                                                            
 modifies Example.value;                                                                            
                                                                                                    
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
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var Example.value_mid: [Example]int;                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.value[x];                                                                          
 Example.value[x] := v;                                                                             
 assume Example._state_mid == Example._state && Example.value_mid == Example.value && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.value[x] := tmpV;                                                                          
 Example.value[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example.value is not Write-Write Stable with respect to Example.value (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.value.Example.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.value;                                                                            
 modifies Example.value;                                                                            
                                                                                                    
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
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.value(t: Tid,x: Example,Example._state,Example.value,Example._lock);  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.value(u: Tid,y: Example,w: int,Example._state,Example.value,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.value[y] := w;                                                                             
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.value(t: Tid,x: Example,Example._state,Example.value,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example.value is not Read-Write Stable with respect to Example.value (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example.value is not Read-Write Stable with respect to Example.value (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example.value is not Read-Write Stable with respect to Example.value (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.value.Example.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.value;                                                                            
 modifies Example.value;                                                                            
                                                                                                    
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
 var Example.value_pre: [Example]int;                                                               
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.value_post: [Example]int;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.value(u: Tid,y: Example,Example._state,Example.value,Example._lock);  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.value(t: Tid,x: Example,v: int,Example._state,Example.value,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.value[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.value_post == Example.value && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.value(u: Tid,y: Example,Example._state,Example.value,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example.value is not Write-Read Stable with respect to Example.value (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example.value is not Write-Read Stable with respect to Example.value (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Example.value is not Write-Read Stable with respect to Example.value (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Example._state, Example.value, Example._lock);                              
requires ValidTid(tid);                                                                             
modifies Example._state;                                                                            
modifies Example.value;                                                                             
modifies Example._lock;                                                                             
ensures StateInvariant(Example._state, Example.value, Example._lock);                               
ensures Y(tid , old(Example._state), old(Example.value), old(Example._lock) , Example._state, Example.value, Example._lock);
                                                                                                    
// Example.value:                                                                                   
                                                                                                    
function {:inline} Y_Example.value(tid : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example.value(tid: Tid,this: Example,Example._state,Example.value,Example._lock)), _R)) ==> (Example.value[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example.value(tid : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example.value.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Example._state_yield: [Example]State;                                                           
var Example.value_yield: [Example]int;                                                              
var u_yield: Tid;                                                                                   
var this_yield: Example;                                                                            
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example.value(u: Tid,this: Example,newValue: int,Example._state,Example.value,Example._lock)));
                                                                                                    
assume Example._state_yield == Example._state && Example.value_yield == Example.value && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.value(tid, this, newValue , Example._state, Example.value, Example._lock);        
}                                                                                                   
                                                                                                    
procedure Y_Example.value.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.value_yield: [Example]int;                                                              
var this_yield: Example;                                                                            
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.value_yield == Example.value && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.value(tid, this, Example.value[this] , Example._state, Example.value, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.value.Transitive(tid : Tid, this: Example, newValue : int , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.value_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires StateInvariant(Example._state_p, Example.value_p, Example._lock_p);                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.value_pre: [Example]int;                                                                
var Example._state_pre: [Example]State;                                                             
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Example._lock_pre: [Example]Tid;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.value_post: [Example]int;                                                               
var Example._lock_post: [Example]Tid;                                                               
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.value, Example._lock , Example._state_p, Example.value_p, Example._lock_p);
 assume Y_Example.value(tid, this, newValue , Example._state_p, Example.value_p, Example._lock_p);  
assume Example._state_post == Example._state_p && Example.value_post == Example.value_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example.value(tid, this, newValue , Example._state, Example.value, Example._lock);        
}                                                                                                   
// Example._lock:                                                                                   
                                                                                                    
function {:inline} Y_Example._lock(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example._lock(tid: Tid,this: Example,Example._state,Example.value,Example._lock)), _R)) ==> (Example._lock[this] == newValue))
 &&(((Example._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example._lock(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.value_yield: [Example]int;                                                              
var u_yield: Tid;                                                                                   
var this_yield: Example;                                                                            
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example._lock(u: Tid,this: Example,newValue: Tid,Example._state,Example.value,Example._lock)));
 assume leq(m#moverPath(ReadEval.Example._lock(tid: Tid,this: Example,Example._state,Example.value,Example._lock)), _N);
assume Example._state_yield == Example._state && Example.value_yield == Example.value && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example._lock(tid, this, newValue , Example._state, Example.value, Example._lock);        
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.value_yield: [Example]int;                                                              
var this_yield: Example;                                                                            
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.value_yield == Example.value && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example._lock(tid, this, Example._lock[this] , Example._state, Example.value, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Transitive(tid : Tid, this: Example, newValue : Tid , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.value_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.value, Example._lock);                             
 requires StateInvariant(Example._state_p, Example.value_p, Example._lock_p);                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.value_pre: [Example]int;                                                                
var Example._state_pre: [Example]State;                                                             
var $recorded.state_pre: int;                                                                       
var Example._lock_pre: [Example]Tid;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.value_post: [Example]int;                                                               
var Example._lock_post: [Example]Tid;                                                               
var newValue_post: Tid;                                                                             
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.value_pre == Example.value && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.value, Example._lock , Example._state_p, Example.value_p, Example._lock_p);
 assume Y_Example._lock(tid, this, newValue , Example._state_p, Example.value_p, Example._lock_p);  
assume Example._state_post == Example._state_p && Example.value_post == Example.value_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example._lock(tid, this, newValue , Example._state, Example.value, Example._lock);        
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Example._state: [Example]State, Example.value: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.value_p: [Example]int, Example._lock_p: [Example]Tid): bool
{                                                                                                   
 (forall this: Example :: Y_Example.value(tid : Tid, this, Example.value_p[this] , Example._state, Example.value, Example._lock))
 && (forall this: Example :: Y_Example._lock(tid : Tid, this, Example._lock_p[this] , Example._state, Example.value, Example._lock))
 && (forall _i : Example :: isShared(Example._state[_i]) ==> isShared(Example._state_p[_i]))        
 && (forall _i : Example :: isLocal(Example._state[_i], tid) <==> isLocal(Example._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 698.1-881.2: (Method:6.3)
// 705.1-705.24: (6.3): Bad tid
// 706.1-706.41: (6.3): this is not global
// 777.2-779.2: (class anchor.sink.VarDeclStmt:7.5)
// 783.1-783.31: (8.18): Cannot have potential null deference in left-mover part.
// 787.1-787.27: (8.18): Reduction failure
// 789.2-806.34: (class anchor.sink.Read:9.7)
// 801.1-801.31: (9.7): Cannot have potential null deference in left-mover part.
// 805.1-805.27: (9.7): Reduction failure
// 807.2-809.2: (class anchor.sink.VarDeclStmt:10.7)
// 810.2-813.23: (class anchor.sink.Assign:10.7)
// 815.2-831.30: (class anchor.sink.Write:10.7)
// 827.1-827.31: (10.7): Cannot have potential null deference in left-mover part.
// 830.1-830.27: (10.7): Reduction failure
// 835.1-835.31: (11.5): Cannot have potential null deference in left-mover part.
// 837.1-837.36: (11.5): lock not held
// 839.1-839.27: (11.5): Reduction failure
// 841.2-843.2: (class anchor.sink.VarDeclStmt:12.5)
// 844.2-846.2: (class anchor.sink.VarDeclStmt:12.5)
// 847.2-864.30: (class anchor.sink.Read:12.5)
// 859.1-859.31: (12.5): Cannot have potential null deference in left-mover part.
// 863.1-863.27: (12.5): Reduction failure
// 865.2-868.26: (class anchor.sink.Assign:12.5)
// 869.2-874.59: (class anchor.sink.Assert:12.5)
// 874.1-874.59: (12.5): This assertion may not hold.
// 875.2-880.9: (class anchor.sink.Return:6.43)
// 882.1-1081.2: (Method:15.3)
// 889.1-889.24: (15.3): Bad tid
// 890.1-890.41: (15.3): this is not global
// 959.2-961.2: (class anchor.sink.VarDeclStmt:16.5)
// 965.1-965.31: (17.18): Cannot have potential null deference in left-mover part.
// 969.1-969.27: (17.18): Reduction failure
// 971.2-988.34: (class anchor.sink.Read:18.7)
// 983.1-983.31: (18.7): Cannot have potential null deference in left-mover part.
// 987.1-987.27: (18.7): Reduction failure
// 989.2-991.2: (class anchor.sink.VarDeclStmt:19.7)
// 992.2-995.23: (class anchor.sink.Assign:19.7)
// 997.2-1013.30: (class anchor.sink.Write:19.7)
// 1009.1-1009.31: (19.7): Cannot have potential null deference in left-mover part.
// 1012.1-1012.27: (19.7): Reduction failure
// 1017.1-1017.31: (20.5): Cannot have potential null deference in left-mover part.
// 1019.1-1019.36: (20.5): lock not held
// 1021.1-1021.27: (20.5): Reduction failure
// 1026.1-1026.31: (22.18): Cannot have potential null deference in left-mover part.
// 1030.1-1030.27: (22.18): Reduction failure
// 1032.2-1034.2: (class anchor.sink.VarDeclStmt:23.7)
// 1035.2-1037.2: (class anchor.sink.VarDeclStmt:23.7)
// 1038.2-1055.30: (class anchor.sink.Read:23.7)
// 1050.1-1050.31: (23.7): Cannot have potential null deference in left-mover part.
// 1054.1-1054.27: (23.7): Reduction failure
// 1056.2-1059.26: (class anchor.sink.Assign:23.7)
// 1060.2-1065.59: (class anchor.sink.Assert:23.7)
// 1065.1-1065.59: (23.7): This assertion may not hold.
// 1069.1-1069.31: (24.5): Cannot have potential null deference in left-mover part.
// 1071.1-1071.36: (24.5): lock not held
// 1073.1-1073.27: (24.5): Reduction failure
// 1075.2-1080.9: (class anchor.sink.Return:15.37)
// 1082.1-1306.2: (Method:27.3)
// 1089.1-1089.24: (27.3): Bad tid
// 1090.1-1090.41: (27.3): this is not global
// 1175.2-1177.2: (class anchor.sink.VarDeclStmt:28.5)
// 1181.1-1181.31: (29.18): Cannot have potential null deference in left-mover part.
// 1185.1-1185.27: (29.18): Reduction failure
// 1187.2-1204.34: (class anchor.sink.Read:30.7)
// 1199.1-1199.31: (30.7): Cannot have potential null deference in left-mover part.
// 1203.1-1203.27: (30.7): Reduction failure
// 1205.2-1207.2: (class anchor.sink.VarDeclStmt:31.7)
// 1208.2-1211.23: (class anchor.sink.Assign:31.7)
// 1213.2-1229.30: (class anchor.sink.Write:31.7)
// 1225.1-1225.31: (31.7): Cannot have potential null deference in left-mover part.
// 1228.1-1228.27: (31.7): Reduction failure
// 1233.1-1233.31: (32.5): Cannot have potential null deference in left-mover part.
// 1235.1-1235.36: (32.5): lock not held
// 1237.1-1237.27: (32.5): Reduction failure
// 1239.2-1247.42: (class anchor.sink.Yield:33.5)
// 1251.1-1251.31: (34.18): Cannot have potential null deference in left-mover part.
// 1255.1-1255.27: (34.18): Reduction failure
// 1257.2-1259.2: (class anchor.sink.VarDeclStmt:35.7)
// 1260.2-1262.2: (class anchor.sink.VarDeclStmt:35.7)
// 1263.2-1280.30: (class anchor.sink.Read:35.7)
// 1275.1-1275.31: (35.7): Cannot have potential null deference in left-mover part.
// 1279.1-1279.27: (35.7): Reduction failure
// 1281.2-1284.26: (class anchor.sink.Assign:35.7)
// 1285.2-1290.59: (class anchor.sink.Assert:35.7)
// 1290.1-1290.59: (35.7): This assertion may not hold.
// 1294.1-1294.31: (36.5): Cannot have potential null deference in left-mover part.
// 1296.1-1296.36: (36.5): lock not held
// 1298.1-1298.27: (36.5): Reduction failure
// 1300.2-1305.9: (class anchor.sink.Return:27.35)
// 1380.1-1380.34: (4.3): Example.value failed Write-Write Right-Mover Check
// 1437.1-1437.30: (4.3): Example.value failed Write-Read Right-Mover Check
// 1498.1-1498.34: (4.3): Example.value failed Write-Write Left-Mover Check
// 1556.1-1556.30: (4.3): Example.value failed Write-Read Left-Mover Check
// 1611.1-1611.34: (4.3): Example.value failed Read-Write Right-Mover Check
// 1669.1-1669.34: (4.3): Example.value failed Read-Write Left-Mover Check
// 1738.1-1738.140: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.1)
// 1739.1-1739.101: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.2)
// 1740.1-1740.158: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case A.3)
// 1833.1-1833.140: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case C)
// 1931.1-1931.144: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case D)
// 1932.1-1932.144: (4.3): Example.value is not Write-Write Stable with respect to Example.value (case R)
// 2001.1-2001.136: (4.3): Example.value is not Read-Write Stable with respect to Example.value (case F)
// 2002.1-2002.136: (4.3): Example.value is not Read-Write Stable with respect to Example.value (case H)
// 2003.1-2003.146: (4.3): Example.value is not Read-Write Stable with respect to Example.value (case I)
// 2071.1-2071.136: (4.3): Example.value is not Write-Read Stable with respect to Example.value (case J)
// 2072.1-2072.136: (4.3): Example.value is not Write-Read Stable with respect to Example.value (case K)
// 2073.1-2073.99: (4.3): Example.value is not Write-Read Stable with respect to Example.value (case L)
// 2104.1-2123.2: (4.3): yields_as clause for Example.value is not valid
// 2128.1-2142.2: (4.3): yields_as clause for Example.value is not reflexive
// 2148.1-2176.2: (4.3): yields_as clause for Example.value is not transitive
// 2196.1-2215.2: (7.32): yields_as clause for Example._lock is not valid
// 2220.1-2234.2: (7.32): yields_as clause for Example._lock is not reflexive
// 2240.1-2268.2: (7.32): yields_as clause for Example._lock is not transitive
