                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/synch-lower.sink:                       
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow a N                                                                                      
                                                                                                    
       Cow b N                                                                                      
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        synchronized (a) {                                                                          
          synchronized (b) {                                                                        
                                                                                                    
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        while (true)   {                                                                            
          synchronized (a) {                                                                        
            synchronized (b) {                                                                      
              break;                                                                                
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        synchronized (a) {                                                                          
          while (true)   {                                                                          
            synchronized (b) {                                                                      
              break;                                                                                
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        synchronized (a) {                                                                          
          while (true)   {                                                                          
            synchronized (b) {                                                                      
                                                                                                    
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow a N                                                                                      
                                                                                                    
       Cow b N                                                                                      
                                                                                                    
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
      public void f() {                                                                             
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            {                                                                                       
              acquire(b);                                                                           
              {                                                                                     
                                                                                                    
              }                                                                                     
              release(b);                                                                           
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        while (true)   {                                                                            
          {                                                                                         
            acquire(a);                                                                             
            {                                                                                       
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    release(a);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
            release(a);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                                                                                                    
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow a N                                                                                      
                                                                                                    
       Cow b N                                                                                      
                                                                                                    
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
      public void f() {                                                                             
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            {                                                                                       
              acquire(b);                                                                           
              {                                                                                     
                                                                                                    
              }                                                                                     
              release(b);                                                                           
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        while (true)   {                                                                            
          {                                                                                         
            acquire(a);                                                                             
            {                                                                                       
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    release(a);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
            release(a);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                                                                                                    
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       Cow a N                                                                                      
                                                                                                    
       Cow b N                                                                                      
                                                                                                    
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
      public void f() {                                                                             
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            {                                                                                       
              acquire(b);                                                                           
              {                                                                                     
                                                                                                    
              }                                                                                     
              release(b);                                                                           
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        while (true)   {                                                                            
          {                                                                                         
            acquire(a);                                                                             
            {                                                                                       
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    release(a);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
            release(a);                                                                             
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f3() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                  {                                                                                 
                    release(b);                                                                     
                    break;                                                                          
                  }                                                                                 
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        Cow a;                                                                                      
        a := this.a;                                                                                
        Cow b;                                                                                      
        b := this.b;                                                                                
        {                                                                                           
          acquire(a);                                                                               
          {                                                                                         
            while (true)                                                                            
              invariant holds(a, tid);                                                              
              {                                                                                     
              {                                                                                     
                acquire(b);                                                                         
                {                                                                                   
                                                                                                    
                }                                                                                   
                release(b);                                                                         
              }                                                                                     
            }                                                                                       
          }                                                                                         
          release(a);                                                                               
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
                                                                                                    
var Cow.a: [Cow]Cow;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.a(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.a(tid: Tid,this : Cow,newValue: Cow,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.b: [Cow]Cow;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.b(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.b(tid: Tid,this : Cow,newValue: Cow,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow.b;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                       
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                        
{                                                                                                   
 var Cow.a4430260: [Cow]Cow;                                                                        
 var $recorded.state4430260: int;                                                                   
 var b: Cow;                                                                                        
 var $recorded.state4430254: int;                                                                   
 var Cow._state4430273: [Cow]State;                                                                 
 var Cow._lock4430254: [Cow]Tid;                                                                    
 var Cow._state4430260: [Cow]State;                                                                 
 var this4430260: Cow;                                                                              
 var this4430273: Cow;                                                                              
 var path4430260: int;                                                                              
 var b4430273: Cow;                                                                                 
 var mover4430260: Mover;                                                                           
 var a4430254: Cow;                                                                                 
 var tid4430254: Tid;                                                                               
 var Cow.b4430254: [Cow]Cow;                                                                        
 var Cow.b4430273: [Cow]Cow;                                                                        
 var a4430273: Cow;                                                                                 
 var tid4430273: Tid;                                                                               
 var path4430254: int;                                                                              
 var tid4430260: Tid;                                                                               
 var Cow.b4430260: [Cow]Cow;                                                                        
 var Cow._lock4430273: [Cow]Tid;                                                                    
 var this4430254: Cow;                                                                              
 var moverPath4430260: MoverPath;                                                                   
 var $recorded.state4430273: int;                                                                   
 var mover4430254: Mover;                                                                           
 var $pc4430254: Phase;                                                                             
 var $pc4430260: Phase;                                                                             
 var $pc4430273: Phase;                                                                             
 var a4430260: Cow;                                                                                 
 var Cow._state4430254: [Cow]State;                                                                 
 var Cow._lock4430260: [Cow]Tid;                                                                    
 var b4430260: Cow;                                                                                 
 var Cow.a4430273: [Cow]Cow;                                                                        
 var Cow.a4430254: [Cow]Cow;                                                                        
 var moverPath4430254: MoverPath;                                                                   
 var a: Cow;                                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: Cow a;                                                                                     
                                                                                                    
                                                                                                    
 // 8.9: a := this.a;                                                                               
                                                                                                    
                                                                                                    
 moverPath4430254 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430254 := m#moverPath(moverPath4430254);                                                     
 path4430254 := p#moverPath(moverPath4430254);                                                      
 assume Cow._state4430254 == Cow._state && Cow.a4430254 == Cow.a && Cow.b4430254 == Cow.b && Cow._lock4430254 == Cow._lock && a4430254 == a && this4430254 == this && tid4430254 == tid && $pc4430254 == $pc;
 assume $recorded.state4430254 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (8.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430254);                                                              
 assert $pc != PhaseError;                                                                                 // (8.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 9.9: Cow b;                                                                                     
                                                                                                    
                                                                                                    
 // 9.9: b := this.b;                                                                               
                                                                                                    
                                                                                                    
 moverPath4430260 := ReadEval.Cow.b(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430260 := m#moverPath(moverPath4430260);                                                     
 path4430260 := p#moverPath(moverPath4430260);                                                      
 assume Cow._state4430260 == Cow._state && Cow.a4430260 == Cow.a && Cow.b4430260 == Cow.b && Cow._lock4430260 == Cow._lock && b4430260 == b && a4430260 == a && this4430260 == this && tid4430260 == tid && $pc4430260 == $pc;
 assume $recorded.state4430260 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430260);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 b := Cow.b[this];                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (10.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[a] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.22): Reduction failure
 Cow._lock[a] := tid;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume b != Cow.null;                                                                             
 } else {                                                                                           
  assert b != Cow.null;                                                                                    // (11.26): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[b] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (11.26): Reduction failure
 Cow._lock[b] := tid;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume b != Cow.null;                                                                             
 } else {                                                                                           
  assert b != Cow.null;                                                                                    // (13.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[b] == tid;                                                                               // (13.13): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (13.13): Reduction failure
 Cow._lock[b] := Tid.null;                                                                          
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[a] == tid;                                                                               // (14.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 Cow._lock[a] := Tid.null;                                                                          
                                                                                                    
 // 7.21: // return;                                                                                
                                                                                                    
 assume Cow._state4430273 == Cow._state && Cow.a4430273 == Cow.a && Cow.b4430273 == Cow.b && Cow._lock4430273 == Cow._lock && b4430273 == b && a4430273 == a && this4430273 == this && tid4430273 == tid;
 assume $recorded.state4430273 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow.b;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (17.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (17.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                       
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                        
{                                                                                                   
 var phase4430308: Phase;                                                                           
 var Cow._lock4430308_bottom: [Cow]Tid;                                                             
 var $recorded.state4430308: int;                                                                   
 var Cow.a4430309: [Cow]Cow;                                                                        
 var Cow.b4430308_bottom: [Cow]Cow;                                                                 
 var this4430309: Cow;                                                                              
 var Cow.b4430308: [Cow]Cow;                                                                        
 var Cow._lock4430288: [Cow]Tid;                                                                    
 var Cow._lock4430308: [Cow]Tid;                                                                    
 var a4430308: Cow;                                                                                 
 var moverPath4430288: MoverPath;                                                                   
 var b: Cow;                                                                                        
 var Cow._state4430288: [Cow]State;                                                                 
 var $pc4430282: Phase;                                                                             
 var mover4430282: Mover;                                                                           
 var $recorded.state4430309: int;                                                                   
 var Cow.a4430308_bottom: [Cow]Cow;                                                                 
 var tid4430309: Tid;                                                                               
 var mover4430288: Mover;                                                                           
 var tid4430288: Tid;                                                                               
 var path4430288: int;                                                                              
 var Cow.b4430309: [Cow]Cow;                                                                        
 var Cow._lock4430282: [Cow]Tid;                                                                    
 var this4430282: Cow;                                                                              
 var a4430309: Cow;                                                                                 
 var this4430308_bottom: Cow;                                                                       
 var Cow.a4430288: [Cow]Cow;                                                                        
 var b4430309: Cow;                                                                                 
 var this4430308: Cow;                                                                              
 var $pc4430308: Phase;                                                                             
 var tid4430308_bottom: Tid;                                                                        
 var Cow.a4430282: [Cow]Cow;                                                                        
 var $recorded.state4430288: int;                                                                   
 var Cow._state4430308_bottom: [Cow]State;                                                          
 var a4430288: Cow;                                                                                 
 var Cow._state4430308: [Cow]State;                                                                 
 var Cow.b4430282: [Cow]Cow;                                                                        
 var Cow._state4430309: [Cow]State;                                                                 
 var $recorded.state4430308_bottom: int;                                                            
 var moverPath4430282: MoverPath;                                                                   
 var Cow.a4430308: [Cow]Cow;                                                                        
 var b4430308: Cow;                                                                                 
 var $pc4430288: Phase;                                                                             
 var a4430308_bottom: Cow;                                                                          
 var tid4430308: Tid;                                                                               
 var a4430282: Cow;                                                                                 
 var this4430288: Cow;                                                                              
 var path4430282: int;                                                                              
 var $pc4430308_bottom: Phase;                                                                      
 var Cow._state4430282: [Cow]State;                                                                 
 var tid4430282: Tid;                                                                               
 var b4430308_bottom: Cow;                                                                          
 var $pc4430309: Phase;                                                                             
 var Cow._lock4430309: [Cow]Tid;                                                                    
 var $recorded.state4430282: int;                                                                   
 var a: Cow;                                                                                        
 var b4430288: Cow;                                                                                 
 var Cow.b4430288: [Cow]Cow;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 18.9: Cow a;                                                                                    
                                                                                                    
                                                                                                    
 // 18.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430282 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430282 := m#moverPath(moverPath4430282);                                                     
 path4430282 := p#moverPath(moverPath4430282);                                                      
 assume Cow._state4430282 == Cow._state && Cow.a4430282 == Cow.a && Cow.b4430282 == Cow.b && Cow._lock4430282 == Cow._lock && a4430282 == a && this4430282 == this && tid4430282 == tid && $pc4430282 == $pc;
 assume $recorded.state4430282 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430282);                                                              
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 19.9: Cow b;                                                                                    
                                                                                                    
                                                                                                    
 // 19.9: b := this.b;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430288 := ReadEval.Cow.b(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430288 := m#moverPath(moverPath4430288);                                                     
 path4430288 := p#moverPath(moverPath4430288);                                                      
 assume Cow._state4430288 == Cow._state && Cow.a4430288 == Cow.a && Cow.b4430288 == Cow.b && Cow._lock4430288 == Cow._lock && b4430288 == b && a4430288 == a && this4430288 == this && tid4430288 == tid && $pc4430288 == $pc;
 assume $recorded.state4430288 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (19.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430288);                                                              
 assert $pc != PhaseError;                                                                                 // (19.9): Reduction failure
 b := Cow.b[this];                                                                                  
 assume Cow._state4430308 == Cow._state && Cow.a4430308 == Cow.a && Cow.b4430308 == Cow.b && Cow._lock4430308 == Cow._lock && b4430308 == b && a4430308 == a && this4430308 == this && tid4430308 == tid;
 assume $recorded.state4430308 == 1;                                                                
                                                                                                    
 // 20.9: while (true)   {                                                                          
                                                                                                    
 phase4430308 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (17.5): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (17.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                    
  invariant (forall _this : Cow :: Invariant.Y_Cow.a(tid : Tid, _this, Cow.a[_this] ,Cow._state4430308,Cow.a4430308,Cow.b4430308,Cow._lock4430308));       // (20.9): Loop does not preserve yields_as annotation for field a
  invariant (forall _this : Cow :: Invariant.Y_Cow.b(tid : Tid, _this, Cow.b[_this] ,Cow._state4430308,Cow.a4430308,Cow.b4430308,Cow._lock4430308));       // (20.9): Loop does not preserve yields_as annotation for field b
  invariant phase4430308 == $pc;                                                                           // (20.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (20.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume a != Cow.null;                                                                            
  } else {                                                                                          
   assert a != Cow.null;                                                                                   // (21.26): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[a] == Tid.null;                                                                  
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (21.26): Reduction failure
  Cow._lock[a] := tid;                                                                              
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (22.30): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[b] == Tid.null;                                                                  
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (22.30): Reduction failure
  Cow._lock[b] := tid;                                                                              
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (24.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[b] == tid;                                                                              // (24.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (24.17): Reduction failure
  Cow._lock[b] := Tid.null;                                                                         
  if ($pc == PreCommit) {                                                                           
   assume a != Cow.null;                                                                            
  } else {                                                                                          
   assert a != Cow.null;                                                                                   // (25.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[a] == tid;                                                                              // (25.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (25.13): Reduction failure
  Cow._lock[a] := Tid.null;                                                                         
                                                                                                    
  // 23.21: break;                                                                                  
                                                                                                    
  break;                                                                                            
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (24.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[b] == tid;                                                                              // (24.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (24.17): Reduction failure
  Cow._lock[b] := Tid.null;                                                                         
  if ($pc == PreCommit) {                                                                           
   assume a != Cow.null;                                                                            
  } else {                                                                                          
   assert a != Cow.null;                                                                                   // (25.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[a] == tid;                                                                              // (25.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (25.13): Reduction failure
  Cow._lock[a] := Tid.null;                                                                         
  assume Cow._state4430308_bottom == Cow._state && Cow.a4430308_bottom == Cow.a && Cow.b4430308_bottom == Cow.b && Cow._lock4430308_bottom == Cow._lock && b4430308_bottom == b && a4430308_bottom == a && this4430308_bottom == this && tid4430308_bottom == tid;
  assume $recorded.state4430308_bottom == 1;                                                        
  assert phase4430308 == $pc;                                                                              // (20.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 17.22: // return;                                                                               
                                                                                                    
 assume Cow._state4430309 == Cow._state && Cow.a4430309 == Cow.a && Cow.b4430309 == Cow.b && Cow._lock4430309 == Cow._lock && b4430309 == b && a4430309 == a && this4430309 == this && tid4430309 == tid;
 assume $recorded.state4430309 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow.b;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (29.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (29.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                       
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                        
{                                                                                                   
 var mover4430318: Mover;                                                                           
 var Cow._state4430318: [Cow]State;                                                                 
 var $recorded.state4430324: int;                                                                   
 var a4430338_bottom: Cow;                                                                          
 var tid4430338: Tid;                                                                               
 var b4430338_bottom: Cow;                                                                          
 var $recorded.state4430338: int;                                                                   
 var b: Cow;                                                                                        
 var this4430338: Cow;                                                                              
 var Cow.b4430338: [Cow]Cow;                                                                        
 var this4430343: Cow;                                                                              
 var tid4430343: Tid;                                                                               
 var moverPath4430324: MoverPath;                                                                   
 var b4430343: Cow;                                                                                 
 var Cow.a4430338: [Cow]Cow;                                                                        
 var a4430343: Cow;                                                                                 
 var mover4430324: Mover;                                                                           
 var a4430318: Cow;                                                                                 
 var Cow._lock4430338_bottom: [Cow]Tid;                                                             
 var Cow._lock4430338: [Cow]Tid;                                                                    
 var Cow._state4430338: [Cow]State;                                                                 
 var $pc4430338: Phase;                                                                             
 var Cow._lock4430343: [Cow]Tid;                                                                    
 var this4430318: Cow;                                                                              
 var Cow.b4430338_bottom: [Cow]Cow;                                                                 
 var $recorded.state4430343: int;                                                                   
 var path4430324: int;                                                                              
 var tid4430318: Tid;                                                                               
 var this4430338_bottom: Cow;                                                                       
 var Cow._lock4430324: [Cow]Tid;                                                                    
 var tid4430338_bottom: Tid;                                                                        
 var $pc4430318: Phase;                                                                             
 var Cow._state4430324: [Cow]State;                                                                 
 var b4430338: Cow;                                                                                 
 var phase4430338: Phase;                                                                           
 var a4430324: Cow;                                                                                 
 var moverPath4430318: MoverPath;                                                                   
 var Cow.a4430338_bottom: [Cow]Cow;                                                                 
 var path4430318: int;                                                                              
 var Cow.a4430324: [Cow]Cow;                                                                        
 var Cow._state4430338_bottom: [Cow]State;                                                          
 var $recorded.state4430318: int;                                                                   
 var Cow.a4430343: [Cow]Cow;                                                                        
 var b4430324: Cow;                                                                                 
 var $pc4430343: Phase;                                                                             
 var Cow._lock4430318: [Cow]Tid;                                                                    
 var $pc4430324: Phase;                                                                             
 var $pc4430338_bottom: Phase;                                                                      
 var Cow.b4430343: [Cow]Cow;                                                                        
 var this4430324: Cow;                                                                              
 var Cow._state4430343: [Cow]State;                                                                 
 var Cow.b4430324: [Cow]Cow;                                                                        
 var a4430338: Cow;                                                                                 
 var tid4430324: Tid;                                                                               
 var $recorded.state4430338_bottom: int;                                                            
 var a: Cow;                                                                                        
 var Cow.a4430318: [Cow]Cow;                                                                        
 var Cow.b4430318: [Cow]Cow;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 30.9: Cow a;                                                                                    
                                                                                                    
                                                                                                    
 // 30.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430318 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430318 := m#moverPath(moverPath4430318);                                                     
 path4430318 := p#moverPath(moverPath4430318);                                                      
 assume Cow._state4430318 == Cow._state && Cow.a4430318 == Cow.a && Cow.b4430318 == Cow.b && Cow._lock4430318 == Cow._lock && a4430318 == a && this4430318 == this && tid4430318 == tid && $pc4430318 == $pc;
 assume $recorded.state4430318 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (30.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430318);                                                              
 assert $pc != PhaseError;                                                                                 // (30.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 31.9: Cow b;                                                                                    
                                                                                                    
                                                                                                    
 // 31.9: b := this.b;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430324 := ReadEval.Cow.b(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430324 := m#moverPath(moverPath4430324);                                                     
 path4430324 := p#moverPath(moverPath4430324);                                                      
 assume Cow._state4430324 == Cow._state && Cow.a4430324 == Cow.a && Cow.b4430324 == Cow.b && Cow._lock4430324 == Cow._lock && b4430324 == b && a4430324 == a && this4430324 == this && tid4430324 == tid && $pc4430324 == $pc;
 assume $recorded.state4430324 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (31.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430324);                                                              
 assert $pc != PhaseError;                                                                                 // (31.9): Reduction failure
 b := Cow.b[this];                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (32.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[a] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (32.22): Reduction failure
 Cow._lock[a] := tid;                                                                               
 assume Cow._state4430338 == Cow._state && Cow.a4430338 == Cow.a && Cow.b4430338 == Cow.b && Cow._lock4430338 == Cow._lock && b4430338 == b && a4430338 == a && this4430338 == this && tid4430338 == tid;
 assume $recorded.state4430338 == 1;                                                                
                                                                                                    
 // 33.13: while (true)                                                                             
                                                                                                    
 phase4430338 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (29.5): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (29.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                    
  invariant (isAccessible(Cow._state[a], tid) && Cow._lock[a] == tid);                              
  invariant (forall _this : Cow :: Invariant.Y_Cow.a(tid : Tid, _this, Cow.a[_this] ,Cow._state4430338,Cow.a4430338,Cow.b4430338,Cow._lock4430338));       // (33.13): Loop does not preserve yields_as annotation for field a
  invariant (forall _this : Cow :: Invariant.Y_Cow.b(tid : Tid, _this, Cow.b[_this] ,Cow._state4430338,Cow.a4430338,Cow.b4430338,Cow._lock4430338));       // (33.13): Loop does not preserve yields_as annotation for field b
  invariant phase4430338 == $pc;                                                                           // (33.13): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (33.13): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (34.30): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[b] == Tid.null;                                                                  
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (34.30): Reduction failure
  Cow._lock[b] := tid;                                                                              
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (36.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[b] == tid;                                                                              // (36.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (36.17): Reduction failure
  Cow._lock[b] := Tid.null;                                                                         
                                                                                                    
  // 35.21: break;                                                                                  
                                                                                                    
  break;                                                                                            
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (36.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[b] == tid;                                                                              // (36.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (36.17): Reduction failure
  Cow._lock[b] := Tid.null;                                                                         
  assume Cow._state4430338_bottom == Cow._state && Cow.a4430338_bottom == Cow.a && Cow.b4430338_bottom == Cow.b && Cow._lock4430338_bottom == Cow._lock && b4430338_bottom == b && a4430338_bottom == a && this4430338_bottom == this && tid4430338_bottom == tid;
  assume $recorded.state4430338_bottom == 1;                                                        
  assert phase4430338 == $pc;                                                                              // (33.13): Phase must be invariant at loop head
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (38.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[a] == tid;                                                                               // (38.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (38.9): Reduction failure
 Cow._lock[a] := Tid.null;                                                                          
                                                                                                    
 // 29.22: // return;                                                                               
                                                                                                    
 assume Cow._state4430343 == Cow._state && Cow.a4430343 == Cow.a && Cow.b4430343 == Cow.b && Cow._lock4430343 == Cow._lock && b4430343 == b && a4430343 == a && this4430343 == this && tid4430343 == tid;
 assume $recorded.state4430343 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f4(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow.b;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (41.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (41.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                       
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                        
{                                                                                                   
 var tid4430352: Tid;                                                                               
 var path4430352: int;                                                                              
 var $pc4430373: Phase;                                                                             
 var moverPath4430352: MoverPath;                                                                   
 var Cow.a4430358: [Cow]Cow;                                                                        
 var Cow.b4430358: [Cow]Cow;                                                                        
 var Cow._state4430368: [Cow]State;                                                                 
 var Cow.a4430368: [Cow]Cow;                                                                        
 var Cow._state4430368_bottom: [Cow]State;                                                          
 var this4430373: Cow;                                                                              
 var b: Cow;                                                                                        
 var Cow.b4430352: [Cow]Cow;                                                                        
 var $recorded.state4430368: int;                                                                   
 var a4430373: Cow;                                                                                 
 var mover4430358: Mover;                                                                           
 var b4430373: Cow;                                                                                 
 var $recorded.state4430358: int;                                                                   
 var tid4430368_bottom: Tid;                                                                        
 var Cow._lock4430368_bottom: [Cow]Tid;                                                             
 var Cow._lock4430358: [Cow]Tid;                                                                    
 var tid4430358: Tid;                                                                               
 var $recorded.state4430368_bottom: int;                                                            
 var Cow._state4430352: [Cow]State;                                                                 
 var Cow.b4430373: [Cow]Cow;                                                                        
 var a4430358: Cow;                                                                                 
 var mover4430352: Mover;                                                                           
 var tid4430373: Tid;                                                                               
 var Cow.b4430368_bottom: [Cow]Cow;                                                                 
 var $pc4430358: Phase;                                                                             
 var this4430352: Cow;                                                                              
 var $pc4430352: Phase;                                                                             
 var $pc4430368: Phase;                                                                             
 var Cow.a4430368_bottom: [Cow]Cow;                                                                 
 var b4430358: Cow;                                                                                 
 var this4430368: Cow;                                                                              
 var Cow._lock4430373: [Cow]Tid;                                                                    
 var a4430352: Cow;                                                                                 
 var $recorded.state4430373: int;                                                                   
 var Cow._lock4430352: [Cow]Tid;                                                                    
 var Cow.a4430352: [Cow]Cow;                                                                        
 var $pc4430368_bottom: Phase;                                                                      
 var a4430368_bottom: Cow;                                                                          
 var this4430358: Cow;                                                                              
 var Cow._state4430358: [Cow]State;                                                                 
 var phase4430368: Phase;                                                                           
 var moverPath4430358: MoverPath;                                                                   
 var Cow.b4430368: [Cow]Cow;                                                                        
 var a4430368: Cow;                                                                                 
 var this4430368_bottom: Cow;                                                                       
 var Cow.a4430373: [Cow]Cow;                                                                        
 var $recorded.state4430352: int;                                                                   
 var Cow._lock4430368: [Cow]Tid;                                                                    
 var b4430368: Cow;                                                                                 
 var path4430358: int;                                                                              
 var tid4430368: Tid;                                                                               
 var b4430368_bottom: Cow;                                                                          
 var Cow._state4430373: [Cow]State;                                                                 
 var a: Cow;                                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 42.9: Cow a;                                                                                    
                                                                                                    
                                                                                                    
 // 42.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430352 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430352 := m#moverPath(moverPath4430352);                                                     
 path4430352 := p#moverPath(moverPath4430352);                                                      
 assume Cow._state4430352 == Cow._state && Cow.a4430352 == Cow.a && Cow.b4430352 == Cow.b && Cow._lock4430352 == Cow._lock && a4430352 == a && this4430352 == this && tid4430352 == tid && $pc4430352 == $pc;
 assume $recorded.state4430352 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (42.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430352);                                                              
 assert $pc != PhaseError;                                                                                 // (42.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 43.9: Cow b;                                                                                    
                                                                                                    
                                                                                                    
 // 43.9: b := this.b;                                                                              
                                                                                                    
                                                                                                    
 moverPath4430358 := ReadEval.Cow.b(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 mover4430358 := m#moverPath(moverPath4430358);                                                     
 path4430358 := p#moverPath(moverPath4430358);                                                      
 assume Cow._state4430358 == Cow._state && Cow.a4430358 == Cow.a && Cow.b4430358 == Cow.b && Cow._lock4430358 == Cow._lock && b4430358 == b && a4430358 == a && this4430358 == this && tid4430358 == tid && $pc4430358 == $pc;
 assume $recorded.state4430358 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (43.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4430358);                                                              
 assert $pc != PhaseError;                                                                                 // (43.9): Reduction failure
 b := Cow.b[this];                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (44.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[a] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (44.22): Reduction failure
 Cow._lock[a] := tid;                                                                               
 assume Cow._state4430368 == Cow._state && Cow.a4430368 == Cow.a && Cow.b4430368 == Cow.b && Cow._lock4430368 == Cow._lock && b4430368 == b && a4430368 == a && this4430368 == this && tid4430368 == tid;
 assume $recorded.state4430368 == 1;                                                                
                                                                                                    
 // 45.13: while (true)                                                                             
                                                                                                    
 phase4430368 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (41.5): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (41.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                    
  invariant (isAccessible(Cow._state[a], tid) && Cow._lock[a] == tid);                              
  invariant (forall _this : Cow :: Invariant.Y_Cow.a(tid : Tid, _this, Cow.a[_this] ,Cow._state4430368,Cow.a4430368,Cow.b4430368,Cow._lock4430368));       // (45.13): Loop does not preserve yields_as annotation for field a
  invariant (forall _this : Cow :: Invariant.Y_Cow.b(tid : Tid, _this, Cow.b[_this] ,Cow._state4430368,Cow.a4430368,Cow.b4430368,Cow._lock4430368));       // (45.13): Loop does not preserve yields_as annotation for field b
  invariant phase4430368 == $pc;                                                                           // (45.13): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (45.13): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (46.30): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Cow._lock[b] == Tid.null;                                                                  
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (46.30): Reduction failure
  Cow._lock[b] := tid;                                                                              
  if ($pc == PreCommit) {                                                                           
   assume b != Cow.null;                                                                            
  } else {                                                                                          
   assert b != Cow.null;                                                                                   // (48.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Cow._lock[b] == tid;                                                                              // (48.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (48.17): Reduction failure
  Cow._lock[b] := Tid.null;                                                                         
  assume Cow._state4430368_bottom == Cow._state && Cow.a4430368_bottom == Cow.a && Cow.b4430368_bottom == Cow.b && Cow._lock4430368_bottom == Cow._lock && b4430368_bottom == b && a4430368_bottom == a && this4430368_bottom == this && tid4430368_bottom == tid;
  assume $recorded.state4430368_bottom == 1;                                                        
  assert phase4430368 == $pc;                                                                              // (45.13): Phase must be invariant at loop head
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume a != Cow.null;                                                                             
 } else {                                                                                           
  assert a != Cow.null;                                                                                    // (50.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[a] == tid;                                                                               // (50.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (50.9): Reduction failure
 Cow._lock[a] := Tid.null;                                                                          
                                                                                                    
 // 41.22: // return;                                                                               
                                                                                                    
 assume Cow._state4430373 == Cow._state && Cow.a4430373 == Cow.a && Cow.b4430373 == Cow.b && Cow._lock4430373 == Cow._lock && b4430373 == b && a4430373 == a && this4430373 == this && tid4430373 == tid;
 assume $recorded.state4430373 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.a: [Cow]Cow,Cow.b: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.a[_i]]))) &&  
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.a[_i]], _t)))) &&
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.b[_i]]))) &&  
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.b[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Cow.a[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.b(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.b failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.b(u: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.b failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.b[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.b[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.b(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.b failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.b[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.b(u: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.b failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.b(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.b failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Cow.b[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.b[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.b(u: Tid,x: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.b failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.b[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.b[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.b(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.b(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.b.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.b.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.b[x];                                                                                  
 Cow.b[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.b[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.b.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.b[x];                                                                                  
 Cow.b[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.b[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.b.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.b.Cow.a(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.b.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.b.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.b[x];                                                                                  
 Cow.b[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.b[x] := tmpV;                                                                                  
 Cow.b[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.b.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.b_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow.a_mid: [Cow]Cow;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.b[x];                                                                                  
 Cow.b[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow.b_mid == Cow.b && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.b[x] := tmpV;                                                                                  
 Cow.b[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.b.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.b(u: Tid,y: Cow,w: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.b(t: Tid,x: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.b.Cow.b(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.b;                                                                                    
 modifies Cow.b;                                                                                    
                                                                                                    
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
 var Cow.b_pre: [Cow]Cow;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Cow;                                                                           
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Cow.a_post: [Cow]Cow;                                                                          
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.b_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.b(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.b(t: Tid,x: Cow,v: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.b[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow.b_post == Cow.b && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.b(u: Tid,y: Cow,Cow._state,Cow.a,Cow.b,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                       
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow.b;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                        
ensures Y(tid , old(Cow._state), old(Cow.a), old(Cow.b), old(Cow._lock) , Cow._state, Cow.a, Cow.b, Cow._lock);
                                                                                                    
// Cow.a:                                                                                           
                                                                                                    
function {:inline} Y_Cow.a(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)), _R)) ==> (Cow.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.a(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.a(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, Cow.a[this] , Cow._state, Cow.a, Cow.b, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Transitive(tid : Tid, this: Cow, newValue : Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Cow, Cow.b_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow.b_pre: [Cow]Cow;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Cow;                                                                            
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var Cow.a_post: [Cow]Cow;                                                                           
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.b_post: [Cow]Cow;                                                                           
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow.b, Cow._lock , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p); 
 assume Y_Cow.a(tid, this, newValue , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow.b_post == Cow.b_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                         
}                                                                                                   
// Cow.b:                                                                                           
                                                                                                    
function {:inline} Y_Cow.b(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.b(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)), _R)) ==> (Cow.b[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.b(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.b.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.b(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.b(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.b.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.b(tid, this, Cow.b[this] , Cow._state, Cow.a, Cow.b, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.b.Transitive(tid : Tid, this: Cow, newValue : Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Cow, Cow.b_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow.b_pre: [Cow]Cow;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Cow;                                                                            
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var Cow.a_post: [Cow]Cow;                                                                           
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.b_post: [Cow]Cow;                                                                           
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow.b, Cow._lock , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p); 
 assume Y_Cow.b(tid, this, newValue , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow.b_post == Cow.b_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.b(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                         
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.a,Cow.b,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow.b,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow.a_yield: [Cow]Cow;                                                                          
var Cow._state_yield: [Cow]State;                                                                   
var Cow.b_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow.b_yield == Cow.b && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.a, Cow.b, Cow._lock);              
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Cow, Cow.b_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.a, Cow.b, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.b_pre: [Cow]Cow;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Cow;                                                                            
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var Cow.a_post: [Cow]Cow;                                                                           
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.b_post: [Cow]Cow;                                                                           
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow.b_pre == Cow.b && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow.b, Cow._lock , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p); 
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.a_p, Cow.b_p, Cow._lock_p);             
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow.b_post == Cow.b_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow.b, Cow._lock);                     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Cow, Cow.b: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Cow, Cow.b_p: [Cow]Cow, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.a(tid : Tid, this, Cow.a_p[this] , Cow._state, Cow.a, Cow.b, Cow._lock))
 && (forall this: Cow :: Y_Cow.b(tid : Tid, this, Cow.b_p[this] , Cow._state, Cow.a, Cow.b, Cow._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.a, Cow.b, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 813.1-954.2: (Method:7.5)
// 821.1-821.24: (7.5): Bad tid
// 822.1-822.37: (7.5): this is not global
// 870.2-872.2: (class anchor.sink.VarDeclStmt:8.9)
// 873.2-890.19: (class anchor.sink.Read:8.9)
// 885.1-885.27: (8.9): Cannot have potential null deference in left-mover part.
// 889.1-889.27: (8.9): Reduction failure
// 891.2-893.2: (class anchor.sink.VarDeclStmt:9.9)
// 894.2-911.19: (class anchor.sink.Read:9.9)
// 906.1-906.27: (9.9): Cannot have potential null deference in left-mover part.
// 910.1-910.27: (9.9): Reduction failure
// 915.1-915.24: (10.22): Cannot have potential null deference in left-mover part.
// 919.1-919.27: (10.22): Reduction failure
// 924.1-924.24: (11.26): Cannot have potential null deference in left-mover part.
// 928.1-928.27: (11.26): Reduction failure
// 933.1-933.24: (13.13): Cannot have potential null deference in left-mover part.
// 935.1-935.29: (13.13): lock not held
// 937.1-937.27: (13.13): Reduction failure
// 942.1-942.24: (14.9): Cannot have potential null deference in left-mover part.
// 944.1-944.29: (14.9): lock not held
// 946.1-946.27: (14.9): Reduction failure
// 948.2-953.9: (class anchor.sink.Return:7.21)
// 955.1-1160.2: (Method:17.5)
// 963.1-963.24: (17.5): Bad tid
// 964.1-964.37: (17.5): this is not global
// 1033.2-1035.2: (class anchor.sink.VarDeclStmt:18.9)
// 1036.2-1053.19: (class anchor.sink.Read:18.9)
// 1048.1-1048.27: (18.9): Cannot have potential null deference in left-mover part.
// 1052.1-1052.27: (18.9): Reduction failure
// 1054.2-1056.2: (class anchor.sink.VarDeclStmt:19.9)
// 1057.2-1074.19: (class anchor.sink.Read:19.9)
// 1069.1-1069.27: (19.9): Cannot have potential null deference in left-mover part.
// 1073.1-1073.27: (19.9): Reduction failure
// 1077.2-1081.14: (class anchor.sink.While:20.9)
// 1083.1-1083.27: (17.5): Bad tid
// 1084.1-1084.40: (17.5): this is not global
// 1087.1-1087.149: (20.9): Loop does not preserve yields_as annotation for field a
// 1088.1-1088.149: (20.9): Loop does not preserve yields_as annotation for field b
// 1089.1-1089.33: (20.9): Phase must be invariant at loop head
// 1090.1-1090.30: (20.9): Potentially infinite loop cannot be in post-commit phase.
// 1095.1-1095.25: (21.26): Cannot have potential null deference in left-mover part.
// 1099.1-1099.28: (21.26): Reduction failure
// 1104.1-1104.25: (22.30): Cannot have potential null deference in left-mover part.
// 1108.1-1108.28: (22.30): Reduction failure
// 1113.1-1113.25: (24.17): Cannot have potential null deference in left-mover part.
// 1115.1-1115.30: (24.17): lock not held
// 1117.1-1117.28: (24.17): Reduction failure
// 1122.1-1122.25: (25.13): Cannot have potential null deference in left-mover part.
// 1124.1-1124.30: (25.13): lock not held
// 1126.1-1126.28: (25.13): Reduction failure
// 1128.3-1131.9: (class anchor.sink.Break:23.21)
// 1135.1-1135.25: (24.17): Cannot have potential null deference in left-mover part.
// 1137.1-1137.30: (24.17): lock not held
// 1139.1-1139.28: (24.17): Reduction failure
// 1144.1-1144.25: (25.13): Cannot have potential null deference in left-mover part.
// 1146.1-1146.30: (25.13): lock not held
// 1148.1-1148.28: (25.13): Reduction failure
// 1152.1-1152.30: (20.9): Phase must be invariant at loop head
// 1154.2-1159.9: (class anchor.sink.Return:17.22)
// 1161.1-1358.2: (Method:29.5)
// 1169.1-1169.24: (29.5): Bad tid
// 1170.1-1170.37: (29.5): this is not global
// 1239.2-1241.2: (class anchor.sink.VarDeclStmt:30.9)
// 1242.2-1259.19: (class anchor.sink.Read:30.9)
// 1254.1-1254.27: (30.9): Cannot have potential null deference in left-mover part.
// 1258.1-1258.27: (30.9): Reduction failure
// 1260.2-1262.2: (class anchor.sink.VarDeclStmt:31.9)
// 1263.2-1280.19: (class anchor.sink.Read:31.9)
// 1275.1-1275.27: (31.9): Cannot have potential null deference in left-mover part.
// 1279.1-1279.27: (31.9): Reduction failure
// 1284.1-1284.24: (32.22): Cannot have potential null deference in left-mover part.
// 1288.1-1288.27: (32.22): Reduction failure
// 1292.2-1296.14: (class anchor.sink.While:33.13)
// 1298.1-1298.27: (29.5): Bad tid
// 1299.1-1299.40: (29.5): this is not global
// 1301.65-1302.71: (33.13): invariant holds(a, tid) may not hold
// 1303.1-1303.149: (33.13): Loop does not preserve yields_as annotation for field a
// 1304.1-1304.149: (33.13): Loop does not preserve yields_as annotation for field b
// 1305.1-1305.33: (33.13): Phase must be invariant at loop head
// 1306.1-1306.30: (33.13): Potentially infinite loop cannot be in post-commit phase.
// 1311.1-1311.25: (34.30): Cannot have potential null deference in left-mover part.
// 1315.1-1315.28: (34.30): Reduction failure
// 1320.1-1320.25: (36.17): Cannot have potential null deference in left-mover part.
// 1322.1-1322.30: (36.17): lock not held
// 1324.1-1324.28: (36.17): Reduction failure
// 1326.3-1329.9: (class anchor.sink.Break:35.21)
// 1333.1-1333.25: (36.17): Cannot have potential null deference in left-mover part.
// 1335.1-1335.30: (36.17): lock not held
// 1337.1-1337.28: (36.17): Reduction failure
// 1341.1-1341.30: (33.13): Phase must be invariant at loop head
// 1346.1-1346.24: (38.9): Cannot have potential null deference in left-mover part.
// 1348.1-1348.29: (38.9): lock not held
// 1350.1-1350.27: (38.9): Reduction failure
// 1352.2-1357.9: (class anchor.sink.Return:29.22)
// 1359.1-1543.2: (Method:41.5)
// 1367.1-1367.24: (41.5): Bad tid
// 1368.1-1368.37: (41.5): this is not global
// 1437.2-1439.2: (class anchor.sink.VarDeclStmt:42.9)
// 1440.2-1457.19: (class anchor.sink.Read:42.9)
// 1452.1-1452.27: (42.9): Cannot have potential null deference in left-mover part.
// 1456.1-1456.27: (42.9): Reduction failure
// 1458.2-1460.2: (class anchor.sink.VarDeclStmt:43.9)
// 1461.2-1478.19: (class anchor.sink.Read:43.9)
// 1473.1-1473.27: (43.9): Cannot have potential null deference in left-mover part.
// 1477.1-1477.27: (43.9): Reduction failure
// 1482.1-1482.24: (44.22): Cannot have potential null deference in left-mover part.
// 1486.1-1486.27: (44.22): Reduction failure
// 1490.2-1494.14: (class anchor.sink.While:45.13)
// 1496.1-1496.27: (41.5): Bad tid
// 1497.1-1497.40: (41.5): this is not global
// 1499.65-1500.71: (45.13): invariant holds(a, tid) may not hold
// 1501.1-1501.149: (45.13): Loop does not preserve yields_as annotation for field a
// 1502.1-1502.149: (45.13): Loop does not preserve yields_as annotation for field b
// 1503.1-1503.33: (45.13): Phase must be invariant at loop head
// 1504.1-1504.30: (45.13): Potentially infinite loop cannot be in post-commit phase.
// 1509.1-1509.25: (46.30): Cannot have potential null deference in left-mover part.
// 1513.1-1513.28: (46.30): Reduction failure
// 1518.1-1518.25: (48.17): Cannot have potential null deference in left-mover part.
// 1520.1-1520.30: (48.17): lock not held
// 1522.1-1522.28: (48.17): Reduction failure
// 1526.1-1526.30: (45.13): Phase must be invariant at loop head
// 1531.1-1531.24: (50.9): Cannot have potential null deference in left-mover part.
// 1533.1-1533.29: (50.9): lock not held
// 1535.1-1535.27: (50.9): Reduction failure
// 1537.2-1542.9: (class anchor.sink.Return:41.22)
// 1623.1-1623.34: (4.5): Cow.a failed Write-Write Right-Mover Check
// 1682.1-1682.30: (4.5): Cow.a failed Write-Read Right-Mover Check
// 1745.1-1745.34: (4.5): Cow.a failed Write-Write Left-Mover Check
// 1805.1-1805.30: (4.5): Cow.a failed Write-Read Left-Mover Check
// 1862.1-1862.34: (4.5): Cow.a failed Read-Write Right-Mover Check
// 1922.1-1922.34: (4.5): Cow.a failed Read-Write Left-Mover Check
// 1981.1-1981.34: (5.5): Cow.b failed Write-Write Right-Mover Check
// 2040.1-2040.30: (5.5): Cow.b failed Write-Read Right-Mover Check
// 2103.1-2103.34: (5.5): Cow.b failed Write-Write Left-Mover Check
// 2163.1-2163.30: (5.5): Cow.b failed Write-Read Left-Mover Check
// 2220.1-2220.34: (5.5): Cow.b failed Read-Write Right-Mover Check
// 2280.1-2280.34: (5.5): Cow.b failed Read-Write Left-Mover Check
// 2351.1-2351.140: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
// 2352.1-2352.101: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
// 2353.1-2353.158: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
// 2449.1-2449.140: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
// 2550.1-2550.144: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
// 2551.1-2551.144: (4.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
// 2622.1-2622.136: (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
// 2623.1-2623.136: (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
// 2624.1-2624.146: (4.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
// 2694.1-2694.136: (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
// 2695.1-2695.136: (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
// 2696.1-2696.99: (4.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
// 2768.1-2768.140: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.1)
// 2769.1-2769.101: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.2)
// 2770.1-2770.158: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case A.3)
// 2866.1-2866.140: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case C)
// 2967.1-2967.144: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case D)
// 2968.1-2968.144: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case R)
// 3039.1-3039.136: (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case F)
// 3040.1-3040.136: (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case H)
// 3041.1-3041.146: (4.5): Cow.a is not Read-Write Stable with respect to Cow.b (case I)
// 3111.1-3111.136: (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case J)
// 3112.1-3112.136: (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case K)
// 3113.1-3113.99: (5.5): Cow.b is not Write-Read Stable with respect to Cow.a (case L)
// 3185.1-3185.140: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.1)
// 3186.1-3186.101: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.2)
// 3187.1-3187.158: (4.5): Cow.a is not Write-Write Stable with respect to Cow.b (case A.3)
// 3283.1-3283.140: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case C)
// 3384.1-3384.144: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case D)
// 3385.1-3385.144: (5.5): Cow.b is not Write-Write Stable with respect to Cow.a (case R)
// 3456.1-3456.136: (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case F)
// 3457.1-3457.136: (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case H)
// 3458.1-3458.146: (5.5): Cow.b is not Read-Write Stable with respect to Cow.a (case I)
// 3528.1-3528.136: (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case J)
// 3529.1-3529.136: (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case K)
// 3530.1-3530.99: (4.5): Cow.a is not Write-Read Stable with respect to Cow.b (case L)
// 3602.1-3602.140: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.1)
// 3603.1-3603.101: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.2)
// 3604.1-3604.158: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case A.3)
// 3700.1-3700.140: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case C)
// 3801.1-3801.144: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case D)
// 3802.1-3802.144: (5.5): Cow.b is not Write-Write Stable with respect to Cow.b (case R)
// 3873.1-3873.136: (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case F)
// 3874.1-3874.136: (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case H)
// 3875.1-3875.146: (5.5): Cow.b is not Read-Write Stable with respect to Cow.b (case I)
// 3945.1-3945.136: (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case J)
// 3946.1-3946.136: (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case K)
// 3947.1-3947.99: (5.5): Cow.b is not Write-Read Stable with respect to Cow.b (case L)
// 3979.1-3999.2: (4.5): yields_as clause for Cow.a is not valid
// 4004.1-4019.2: (4.5): yields_as clause for Cow.a is not reflexive
// 4025.1-4055.2: (4.5): yields_as clause for Cow.a is not transitive
// 4074.1-4094.2: (5.5): yields_as clause for Cow.b is not valid
// 4099.1-4114.2: (5.5): yields_as clause for Cow.b is not reflexive
// 4120.1-4150.2: (5.5): yields_as clause for Cow.b is not transitive
// 4170.1-4190.2: (7.32): yields_as clause for Cow._lock is not valid
// 4195.1-4210.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4216.1-4246.2: (7.32): yields_as clause for Cow._lock is not transitive
