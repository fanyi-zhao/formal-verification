                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/array-tid.sink:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Cow.T{this}] a isRead ? B : E                                                               
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        x = tid;                                                                                    
        a[x] := x;                                                                                  
        x = 0;                                                                                      
        a[x] := x;                                                                                  
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        yield;                                                                                      
        int y;                                                                                      
        y := a[tid];                                                                                
        assert y == x;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        int s;                                                                                      
        s = 10;                                                                                     
        b = new [Cow.T{this}](s);                                                                   
        assert a != b;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void j() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        b := this.a;                                                                                
        assert a == b;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k([Cow.T{this}] a,[Cow.T{this}] b) {                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k2([Cow.T{this}] a,[Cow.T{this}] b) {                                             
        assume a != b;                                                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Cow.T{this}] a isRead ? B : E                                                               
                                                                                                    
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
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        x = tid;                                                                                    
        a[x] := x;                                                                                  
        x = 0;                                                                                      
        a[x] := x;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        yield;                                                                                      
        int y;                                                                                      
        y := a[tid];                                                                                
        assert y == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        int s;                                                                                      
        s = 10;                                                                                     
        b = new [Cow.T{this}](s);                                                                   
        assert a != b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void j() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        b := this.a;                                                                                
        assert a == b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k([Cow.T{this}] a,[Cow.T{this}] b) {                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k2([Cow.T{this}] a,[Cow.T{this}] b) {                                             
        assume a != b;                                                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Cow.T{this}] a isRead ? B : E                                                               
                                                                                                    
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
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        x = tid;                                                                                    
        a[x] := x;                                                                                  
        x = 0;                                                                                      
        a[x] := x;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        yield;                                                                                      
        int y;                                                                                      
        y := a[tid];                                                                                
        assert y == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        int s;                                                                                      
        s = 10;                                                                                     
        b = new [Cow.T{this}](s);                                                                   
        assert a != b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void j() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        b := this.a;                                                                                
        assert a == b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k([Cow.T{this}] a,[Cow.T{this}] b) {                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k2([Cow.T{this}] a,[Cow.T{this}] b) {                                             
        assume a != b;                                                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Cow.T{this}] a isRead ? B : E                                                               
                                                                                                    
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
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        x = tid;                                                                                    
        a[x] := x;                                                                                  
        x = 0;                                                                                      
        a[x] := x;                                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        yield;                                                                                      
        assume 3 < a.length;                                                                        
        int x;                                                                                      
        x = 3;                                                                                      
        a[tid] := x;                                                                                
        yield;                                                                                      
        int y;                                                                                      
        y := a[tid];                                                                                
        assert y == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        int s;                                                                                      
        s = 10;                                                                                     
        b = new [Cow.T{this}](s);                                                                   
        assert a != b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void j() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        [Cow.T{this}] b;                                                                            
        b := this.a;                                                                                
        assert a == b;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k([Cow.T{this}] a,[Cow.T{this}] b) {                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void k2([Cow.T{this}] a,[Cow.T{this}] b) {                                             
        assume a != b;                                                                              
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 1;                                                                                      
        a[tid] := x;                                                                                
        b[tid] := y;                                                                                
        int z;                                                                                      
        z := a[tid];                                                                                
        assert z == x;                                                                              
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
                                                                                                    
var Cow.a: [Cow]Array.Cow.T;                                                                        
                                                                                                    
function {:inline} ReadEval.Cow.a(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.Cow.T.null;                                                                 
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.a(tid: Tid,this : Cow,newValue: Array.Cow.T,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Array.Cow.T._state125242: [Array.Cow.T]State;                                                  
 var Array.Cow.T._elems125243: [Array.Cow.T]([int]int);                                             
 var tid125209: Tid;                                                                                
 var Cow._state125243: [Cow]State;                                                                  
 var Array.Cow.T._elems125227: [Array.Cow.T]([int]int);                                             
 var this125234: Cow;                                                                               
 var Cow.a125234: [Cow]Array.Cow.T;                                                                 
 var mover125242: Mover;                                                                            
 var a125208: Array.Cow.T;                                                                          
 var x: int;                                                                                        
 var Array.Cow.T._state125227: [Array.Cow.T]State;                                                  
 var Array.Cow.T._elems125234: [Array.Cow.T]([int]int);                                             
 var Cow.a125242: [Cow]Array.Cow.T;                                                                 
 var tid125242: Tid;                                                                                
 var Array.Cow.T._length125209: [Array.Cow.T]int;                                                   
 var moverPath125242: MoverPath;                                                                    
 var this125208: Cow;                                                                               
 var Array.Cow.T._elems125209_post: [Array.Cow.T]([int]int);                                        
 var tid125209_post: Tid;                                                                           
 var $pc125243: Phase;                                                                              
 var $recorded.state125209: int;                                                                    
 var a125209: Array.Cow.T;                                                                          
 var Array.Cow.T._state125209: [Array.Cow.T]State;                                                  
 var $pc125208: Phase;                                                                              
 var path125242: int;                                                                               
 var Array.Cow.T._length125242: [Array.Cow.T]int;                                                   
 var $recorded.state125242: int;                                                                    
 var x125227: int;                                                                                  
 var Cow._lock125209: [Cow]Tid;                                                                     
 var a125209_post: Array.Cow.T;                                                                     
 var Array.Cow.T._state125243: [Array.Cow.T]State;                                                  
 var Cow.a125243: [Cow]Array.Cow.T;                                                                 
 var $recorded.state125208: int;                                                                    
 var Cow._state125209: [Cow]State;                                                                  
 var Cow._lock125234: [Cow]Tid;                                                                     
 var x125242: int;                                                                                  
 var a125243: Array.Cow.T;                                                                          
 var Cow._state125234: [Cow]State;                                                                  
 var this125209_post: Cow;                                                                          
 var Cow._lock125227: [Cow]Tid;                                                                     
 var Cow.a125209_post: [Cow]Array.Cow.T;                                                            
 var Array.Cow.T._elems125242: [Array.Cow.T]([int]int);                                             
 var Array.Cow.T._length125243: [Array.Cow.T]int;                                                   
 var path125208: int;                                                                               
 var $pc125209: Phase;                                                                              
 var Array.Cow.T._length125227: [Array.Cow.T]int;                                                   
 var Array.Cow.T._elems125209: [Array.Cow.T]([int]int);                                             
 var a125242: Array.Cow.T;                                                                          
 var Array.Cow.T._state125208: [Array.Cow.T]State;                                                  
 var moverPath125208: MoverPath;                                                                    
 var Array.Cow.T._length125234: [Array.Cow.T]int;                                                   
 var $pc125234: Phase;                                                                              
 var Array.Cow.T._elems125208: [Array.Cow.T]([int]int);                                             
 var moverPath125227: MoverPath;                                                                    
 var tid125227: Tid;                                                                                
 var mover125234: Mover;                                                                            
 var Array.Cow.T._length125208: [Array.Cow.T]int;                                                   
 var Cow._state125227: [Cow]State;                                                                  
 var a125227: Array.Cow.T;                                                                          
 var this125227: Cow;                                                                               
 var Array.Cow.T._state125234: [Array.Cow.T]State;                                                  
 var Cow.a125208: [Cow]Array.Cow.T;                                                                 
 var mover125227: Mover;                                                                            
 var Array.Cow.T._length125209_post: [Array.Cow.T]int;                                              
 var tid125208: Tid;                                                                                
 var x125243: int;                                                                                  
 var Cow._lock125208: [Cow]Tid;                                                                     
 var this125243: Cow;                                                                               
 var a125234: Array.Cow.T;                                                                          
 var Array.Cow.T._state125209_post: [Array.Cow.T]State;                                             
 var tid125234: Tid;                                                                                
 var Cow._lock125243: [Cow]Tid;                                                                     
 var Cow._lock125209_post: [Cow]Tid;                                                                
 var $pc125242: Phase;                                                                              
 var this125242: Cow;                                                                               
 var Cow.a125209: [Cow]Array.Cow.T;                                                                 
 var $pc125209_post: Phase;                                                                         
 var $recorded.state125227: int;                                                                    
 var Cow._state125242: [Cow]State;                                                                  
 var $recorded.state125234: int;                                                                    
 var Cow._lock125242: [Cow]Tid;                                                                     
 var tid125243: Tid;                                                                                
 var a: Array.Cow.T;                                                                                
 var Cow.a125227: [Cow]Array.Cow.T;                                                                 
 var $pc125227: Phase;                                                                              
 var path125234: int;                                                                               
 var moverPath125234: MoverPath;                                                                    
 var mover125208: Mover;                                                                            
 var Cow._state125209_post: [Cow]State;                                                             
 var path125227: int;                                                                               
 var $recorded.state125209_post: int;                                                               
 var Cow._state125208: [Cow]State;                                                                  
 var $recorded.state125243: int;                                                                    
 var this125209: Cow;                                                                               
 var x125234: int;                                                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: [Cow.T{this}] a;                                                                           
                                                                                                    
                                                                                                    
 // 8.9: a := this.a;                                                                               
                                                                                                    
                                                                                                    
 moverPath125208 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125208 := m#moverPath(moverPath125208);                                                       
 path125208 := p#moverPath(moverPath125208);                                                        
 assume Cow._state125208 == Cow._state && Cow.a125208 == Cow.a && Cow._lock125208 == Cow._lock && Array.Cow.T._state125208 == Array.Cow.T._state && Array.Cow.T._elems125208 == Array.Cow.T._elems && Array.Cow.T._length125208 == Array.Cow.T._length && a125208 == a && this125208 == this && tid125208 == tid && $pc125208 == $pc;
 assume $recorded.state125208 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (8.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125208);                                                               
 assert $pc != PhaseError;                                                                                 // (8.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 9.9: yield;                                                                                     
                                                                                                    
 assume Cow._state125209 == Cow._state && Cow.a125209 == Cow.a && Cow._lock125209 == Cow._lock && Array.Cow.T._state125209 == Array.Cow.T._state && Array.Cow.T._elems125209 == Array.Cow.T._elems && Array.Cow.T._length125209 == Array.Cow.T._length && a125209 == a && this125209 == this && tid125209 == tid;
 assume $recorded.state125209 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state125209_post == Cow._state && Cow.a125209_post == Cow.a && Cow._lock125209_post == Cow._lock && Array.Cow.T._state125209_post == Array.Cow.T._state && Array.Cow.T._elems125209_post == Array.Cow.T._elems && Array.Cow.T._length125209_post == Array.Cow.T._length && a125209_post == a && this125209_post == this && tid125209_post == tid;
 assume $recorded.state125209_post == 1;                                                            
                                                                                                    
 // 10.9: assume 3 < a.length;                                                                      
                                                                                                    
 assume (3<Array.Cow.T._length[a]);                                                                 
                                                                                                    
 // 11.9: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 11.17: x = 3;                                                                                   
                                                                                                    
 x := 3;                                                                                            
                                                                                                    
 // 12.9: a[tid] := x;                                                                              
                                                                                                    
                                                                                                    
 moverPath125227 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125227 := m#moverPath(moverPath125227);                                                       
 path125227 := p#moverPath(moverPath125227);                                                        
 assume Cow._state125227 == Cow._state && Cow.a125227 == Cow.a && Cow._lock125227 == Cow._lock && Array.Cow.T._state125227 == Array.Cow.T._state && Array.Cow.T._elems125227 == Array.Cow.T._elems && Array.Cow.T._length125227 == Array.Cow.T._length && x125227 == x && a125227 == a && this125227 == this && tid125227 == tid && $pc125227 == $pc;
 assume $recorded.state125227 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (12.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (12.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (12.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125227);                                                               
 assert $pc != PhaseError;                                                                                 // (12.9): Reduction failure
 Array.Cow.T._elems[a][tid] := x;                                                                   
                                                                                                    
 // 13.13: x = tid;                                                                                 
                                                                                                    
 x := tid;                                                                                          
                                                                                                    
 // 14.9: a[x] := x;                                                                                
                                                                                                    
                                                                                                    
 moverPath125234 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,x: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125234 := m#moverPath(moverPath125234);                                                       
 path125234 := p#moverPath(moverPath125234);                                                        
 assume Cow._state125234 == Cow._state && Cow.a125234 == Cow.a && Cow._lock125234 == Cow._lock && Array.Cow.T._state125234 == Array.Cow.T._state && Array.Cow.T._elems125234 == Array.Cow.T._elems && Array.Cow.T._length125234 == Array.Cow.T._length && x125234 == x && a125234 == a && this125234 == this && tid125234 == tid && $pc125234 == $pc;
 assume $recorded.state125234 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= x;                                                                                    
 } else {                                                                                           
  assert 0 <= x;                                                                                           // (14.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume x < Array.Cow.T._length[a];                                                                
 } else {                                                                                           
  assert x < Array.Cow.T._length[a];                                                                       // (14.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125234);                                                               
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 Array.Cow.T._elems[a][x] := x;                                                                     
                                                                                                    
 // 15.13: x = 0;                                                                                   
                                                                                                    
 x := 0;                                                                                            
                                                                                                    
 // 16.9: a[x] := x;                                                                                
                                                                                                    
                                                                                                    
 moverPath125242 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,x: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125242 := m#moverPath(moverPath125242);                                                       
 path125242 := p#moverPath(moverPath125242);                                                        
 assume Cow._state125242 == Cow._state && Cow.a125242 == Cow.a && Cow._lock125242 == Cow._lock && Array.Cow.T._state125242 == Array.Cow.T._state && Array.Cow.T._elems125242 == Array.Cow.T._elems && Array.Cow.T._length125242 == Array.Cow.T._length && x125242 == x && a125242 == a && this125242 == this && tid125242 == tid && $pc125242 == $pc;
 assume $recorded.state125242 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (16.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= x;                                                                                    
 } else {                                                                                           
  assert 0 <= x;                                                                                           // (16.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume x < Array.Cow.T._length[a];                                                                
 } else {                                                                                           
  assert x < Array.Cow.T._length[a];                                                                       // (16.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125242);                                                               
 assert $pc != PhaseError;                                                                                 // (16.9): Reduction failure
 Array.Cow.T._elems[a][x] := x;                                                                     
                                                                                                    
 // 7.21: // return;                                                                                
                                                                                                    
 assume Cow._state125243 == Cow._state && Cow.a125243 == Cow.a && Cow._lock125243 == Cow._lock && Array.Cow.T._state125243 == Array.Cow.T._state && Array.Cow.T._elems125243 == Array.Cow.T._elems && Array.Cow.T._length125243 == Array.Cow.T._length && x125243 == x && a125243 == a && this125243 == this && tid125243 == tid;
 assume $recorded.state125243 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.g(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (19.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (19.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var tid125280: Tid;                                                                                
 var Array.Cow.T._elems125254_post: [Array.Cow.T]([int]int);                                        
 var Array.Cow.T._length125254_post: [Array.Cow.T]int;                                              
 var Cow._state125280: [Cow]State;                                                                  
 var Cow._lock125253: [Cow]Tid;                                                                     
 var $pc125280: Phase;                                                                              
 var Array.Cow.T._elems125273_post: [Array.Cow.T]([int]int);                                        
 var this125273: Cow;                                                                               
 var a125254_post: Array.Cow.T;                                                                     
 var Array.Cow.T._state125254: [Array.Cow.T]State;                                                  
 var Array.Cow.T._length125254: [Array.Cow.T]int;                                                   
 var Cow.a125254: [Cow]Array.Cow.T;                                                                 
 var Cow.a125286: [Cow]Array.Cow.T;                                                                 
 var $recorded.state125254_post: int;                                                               
 var x125285: int;                                                                                  
 var x: int;                                                                                        
 var x125273_post: int;                                                                             
 var path125280: int;                                                                               
 var this125254: Cow;                                                                               
 var Array.Cow.T._elems125280: [Array.Cow.T]([int]int);                                             
 var mover125272: Mover;                                                                            
 var $pc125272: Phase;                                                                              
 var Array.Cow.T._state125272: [Array.Cow.T]State;                                                  
 var Cow.a125272: [Cow]Array.Cow.T;                                                                 
 var this125272: Cow;                                                                               
 var x125280: int;                                                                                  
 var a125273: Array.Cow.T;                                                                          
 var Cow._state125272: [Cow]State;                                                                  
 var Cow._lock125273_post: [Cow]Tid;                                                                
 var Cow._state125273_post: [Cow]State;                                                             
 var Cow.a125285: [Cow]Array.Cow.T;                                                                 
 var this125286: Cow;                                                                               
 var a125285: Array.Cow.T;                                                                          
 var Array.Cow.T._elems125286: [Array.Cow.T]([int]int);                                             
 var Cow.a125253: [Cow]Array.Cow.T;                                                                 
 var path125253: int;                                                                               
 var Array.Cow.T._length125253: [Array.Cow.T]int;                                                   
 var $recorded.state125273_post: int;                                                               
 var tid125254: Tid;                                                                                
 var $recorded.state125254: int;                                                                    
 var moverPath125253: MoverPath;                                                                    
 var tid125273: Tid;                                                                                
 var Cow._lock125254: [Cow]Tid;                                                                     
 var x125272: int;                                                                                  
 var Array.Cow.T._length125273_post: [Array.Cow.T]int;                                              
 var mover125280: Mover;                                                                            
 var $recorded.state125272: int;                                                                    
 var Cow._state125285: [Cow]State;                                                                  
 var a125253: Array.Cow.T;                                                                          
 var x125273: int;                                                                                  
 var y125285: int;                                                                                  
 var Cow.a125254_post: [Cow]Array.Cow.T;                                                            
 var mover125253: Mover;                                                                            
 var path125272: int;                                                                               
 var Array.Cow.T._state125280: [Array.Cow.T]State;                                                  
 var $pc125285: Phase;                                                                              
 var Array.Cow.T._state125273_post: [Array.Cow.T]State;                                             
 var this125280: Cow;                                                                               
 var Cow.a125273_post: [Cow]Array.Cow.T;                                                            
 var Array.Cow.T._state125285: [Array.Cow.T]State;                                                  
 var Array.Cow.T._elems125272: [Array.Cow.T]([int]int);                                             
 var Array.Cow.T._state125273: [Array.Cow.T]State;                                                  
 var moverPath125272: MoverPath;                                                                    
 var $pc125273: Phase;                                                                              
 var this125254_post: Cow;                                                                          
 var y: int;                                                                                        
 var Cow._state125253: [Cow]State;                                                                  
 var $recorded.state125286: int;                                                                    
 var $recorded.state125280: int;                                                                    
 var a125286: Array.Cow.T;                                                                          
 var tid125253: Tid;                                                                                
 var Cow._lock125273: [Cow]Tid;                                                                     
 var Array.Cow.T._length125286: [Array.Cow.T]int;                                                   
 var y125286: int;                                                                                  
 var Array.Cow.T._state125253: [Array.Cow.T]State;                                                  
 var Cow._lock125254_post: [Cow]Tid;                                                                
 var $pc125253: Phase;                                                                              
 var Array.Cow.T._elems125285: [Array.Cow.T]([int]int);                                             
 var $recorded.state125253: int;                                                                    
 var Cow.a125273: [Cow]Array.Cow.T;                                                                 
 var $pc125254_post: Phase;                                                                         
 var $pc125254: Phase;                                                                              
 var x125286: int;                                                                                  
 var Cow._state125286: [Cow]State;                                                                  
 var tid125273_post: Tid;                                                                           
 var Cow._lock125280: [Cow]Tid;                                                                     
 var $pc125286: Phase;                                                                              
 var Cow._lock125285: [Cow]Tid;                                                                     
 var moverPath125280: MoverPath;                                                                    
 var Array.Cow.T._length125273: [Array.Cow.T]int;                                                   
 var Cow._state125254_post: [Cow]State;                                                             
 var Array.Cow.T._length125272: [Array.Cow.T]int;                                                   
 var tid125286: Tid;                                                                                
 var y125280: int;                                                                                  
 var Array.Cow.T._length125280: [Array.Cow.T]int;                                                   
 var tid125285: Tid;                                                                                
 var Array.Cow.T._state125286: [Array.Cow.T]State;                                                  
 var Cow._lock125272: [Cow]Tid;                                                                     
 var this125253: Cow;                                                                               
 var Cow.a125280: [Cow]Array.Cow.T;                                                                 
 var Cow._state125273: [Cow]State;                                                                  
 var Array.Cow.T._state125254_post: [Array.Cow.T]State;                                             
 var a125273_post: Array.Cow.T;                                                                     
 var Cow._state125254: [Cow]State;                                                                  
 var Array.Cow.T._elems125254: [Array.Cow.T]([int]int);                                             
 var a: Array.Cow.T;                                                                                
 var Array.Cow.T._elems125273: [Array.Cow.T]([int]int);                                             
 var tid125272: Tid;                                                                                
 var $recorded.state125285: int;                                                                    
 var tid125254_post: Tid;                                                                           
 var a125272: Array.Cow.T;                                                                          
 var Array.Cow.T._length125285: [Array.Cow.T]int;                                                   
 var Array.Cow.T._elems125253: [Array.Cow.T]([int]int);                                             
 var a125280: Array.Cow.T;                                                                          
 var this125285: Cow;                                                                               
 var Cow._lock125286: [Cow]Tid;                                                                     
 var this125273_post: Cow;                                                                          
 var $recorded.state125273: int;                                                                    
 var $pc125273_post: Phase;                                                                         
 var a125254: Array.Cow.T;                                                                          
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 20.9: [Cow.T{this}] a;                                                                          
                                                                                                    
                                                                                                    
 // 20.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath125253 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125253 := m#moverPath(moverPath125253);                                                       
 path125253 := p#moverPath(moverPath125253);                                                        
 assume Cow._state125253 == Cow._state && Cow.a125253 == Cow.a && Cow._lock125253 == Cow._lock && Array.Cow.T._state125253 == Array.Cow.T._state && Array.Cow.T._elems125253 == Array.Cow.T._elems && Array.Cow.T._length125253 == Array.Cow.T._length && a125253 == a && this125253 == this && tid125253 == tid && $pc125253 == $pc;
 assume $recorded.state125253 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125253);                                                               
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 21.9: yield;                                                                                    
                                                                                                    
 assume Cow._state125254 == Cow._state && Cow.a125254 == Cow.a && Cow._lock125254 == Cow._lock && Array.Cow.T._state125254 == Array.Cow.T._state && Array.Cow.T._elems125254 == Array.Cow.T._elems && Array.Cow.T._length125254 == Array.Cow.T._length && a125254 == a && this125254 == this && tid125254 == tid;
 assume $recorded.state125254 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state125254_post == Cow._state && Cow.a125254_post == Cow.a && Cow._lock125254_post == Cow._lock && Array.Cow.T._state125254_post == Array.Cow.T._state && Array.Cow.T._elems125254_post == Array.Cow.T._elems && Array.Cow.T._length125254_post == Array.Cow.T._length && a125254_post == a && this125254_post == this && tid125254_post == tid;
 assume $recorded.state125254_post == 1;                                                            
                                                                                                    
 // 22.9: assume 3 < a.length;                                                                      
                                                                                                    
 assume (3<Array.Cow.T._length[a]);                                                                 
                                                                                                    
 // 23.9: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 23.17: x = 3;                                                                                   
                                                                                                    
 x := 3;                                                                                            
                                                                                                    
 // 24.9: a[tid] := x;                                                                              
                                                                                                    
                                                                                                    
 moverPath125272 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125272 := m#moverPath(moverPath125272);                                                       
 path125272 := p#moverPath(moverPath125272);                                                        
 assume Cow._state125272 == Cow._state && Cow.a125272 == Cow.a && Cow._lock125272 == Cow._lock && Array.Cow.T._state125272 == Array.Cow.T._state && Array.Cow.T._elems125272 == Array.Cow.T._elems && Array.Cow.T._length125272 == Array.Cow.T._length && x125272 == x && a125272 == a && this125272 == this && tid125272 == tid && $pc125272 == $pc;
 assume $recorded.state125272 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (24.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (24.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (24.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125272);                                                               
 assert $pc != PhaseError;                                                                                 // (24.9): Reduction failure
 Array.Cow.T._elems[a][tid] := x;                                                                   
                                                                                                    
 // 25.9: yield;                                                                                    
                                                                                                    
 assume Cow._state125273 == Cow._state && Cow.a125273 == Cow.a && Cow._lock125273 == Cow._lock && Array.Cow.T._state125273 == Array.Cow.T._state && Array.Cow.T._elems125273 == Array.Cow.T._elems && Array.Cow.T._length125273 == Array.Cow.T._length && x125273 == x && a125273 == a && this125273 == this && tid125273 == tid;
 assume $recorded.state125273 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state125273_post == Cow._state && Cow.a125273_post == Cow.a && Cow._lock125273_post == Cow._lock && Array.Cow.T._state125273_post == Array.Cow.T._state && Array.Cow.T._elems125273_post == Array.Cow.T._elems && Array.Cow.T._length125273_post == Array.Cow.T._length && x125273_post == x && a125273_post == a && this125273_post == this && tid125273_post == tid;
 assume $recorded.state125273_post == 1;                                                            
                                                                                                    
 // 26.9: int y;                                                                                    
                                                                                                    
                                                                                                    
 // 26.9: y := a[tid];                                                                              
                                                                                                    
                                                                                                    
 moverPath125280 := ReadEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125280 := m#moverPath(moverPath125280);                                                       
 path125280 := p#moverPath(moverPath125280);                                                        
 assume Cow._state125280 == Cow._state && Cow.a125280 == Cow.a && Cow._lock125280 == Cow._lock && Array.Cow.T._state125280 == Array.Cow.T._state && Array.Cow.T._elems125280 == Array.Cow.T._elems && Array.Cow.T._length125280 == Array.Cow.T._length && y125280 == y && x125280 == x && a125280 == a && this125280 == this && tid125280 == tid && $pc125280 == $pc;
 assume $recorded.state125280 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (26.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (26.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (26.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125280);                                                               
 assert $pc != PhaseError;                                                                                 // (26.9): Reduction failure
 y := Array.Cow.T._elems[a][tid];                                                                   
                                                                                                    
 // 27.9: assert y == x;                                                                            
                                                                                                    
 assume Cow._state125285 == Cow._state && Cow.a125285 == Cow.a && Cow._lock125285 == Cow._lock && Array.Cow.T._state125285 == Array.Cow.T._state && Array.Cow.T._elems125285 == Array.Cow.T._elems && Array.Cow.T._length125285 == Array.Cow.T._length && y125285 == y && x125285 == x && a125285 == a && this125285 == this && tid125285 == tid;
 assume $recorded.state125285 == 1;                                                                 
 assert (y==x);                                                                                            // (27.9): This assertion may not hold.
                                                                                                    
 // 19.21: // return;                                                                               
                                                                                                    
 assume Cow._state125286 == Cow._state && Cow.a125286 == Cow.a && Cow._lock125286 == Cow._lock && Array.Cow.T._state125286 == Array.Cow.T._state && Array.Cow.T._elems125286 == Array.Cow.T._elems && Array.Cow.T._length125286 == Array.Cow.T._length && y125286 == y && x125286 == x && a125286 == a && this125286 == this && tid125286 == tid;
 assume $recorded.state125286 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.h(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (30.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (30.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Cow._state125296: [Cow]State;                                                                  
 var Array.Cow.T._elems125296: [Array.Cow.T]([int]int);                                             
 var this125296: Cow;                                                                               
 var Cow.a125318: [Cow]Array.Cow.T;                                                                 
 var Array.Cow.T._elems125317: [Array.Cow.T]([int]int);                                             
 var this125317: Cow;                                                                               
 var a125296: Array.Cow.T;                                                                          
 var $pc125296: Phase;                                                                              
 var Array.Cow.T._length125318: [Array.Cow.T]int;                                                   
 var mover125296: Mover;                                                                            
 var Array.Cow.T._state125317: [Array.Cow.T]State;                                                  
 var a125317: Array.Cow.T;                                                                          
 var $recorded.state125296: int;                                                                    
 var b125317: Array.Cow.T;                                                                          
 var s125317: int;                                                                                  
 var Cow._state125318: [Cow]State;                                                                  
 var s: int;                                                                                        
 var moverPath125296: MoverPath;                                                                    
 var Array.Cow.T._elems125318: [Array.Cow.T]([int]int);                                             
 var a125318: Array.Cow.T;                                                                          
 var Array.Cow.T._state125296: [Array.Cow.T]State;                                                  
 var tid125318: Tid;                                                                                
 var $recorded.state125317: int;                                                                    
 var Cow._lock125296: [Cow]Tid;                                                                     
 var b: Array.Cow.T;                                                                                
 var $recorded.state125318: int;                                                                    
 var tid125317: Tid;                                                                                
 var Cow._lock125317: [Cow]Tid;                                                                     
 var Array.Cow.T._state125318: [Array.Cow.T]State;                                                  
 var s125318: int;                                                                                  
 var tid125296: Tid;                                                                                
 var Array.Cow.T._length125317: [Array.Cow.T]int;                                                   
 var path125296: int;                                                                               
 var Array.Cow.T._length125296: [Array.Cow.T]int;                                                   
 var b125318: Array.Cow.T;                                                                          
 var Cow.a125317: [Cow]Array.Cow.T;                                                                 
 var $pc125317: Phase;                                                                              
 var $pc125318: Phase;                                                                              
 var a: Array.Cow.T;                                                                                
 var Cow._lock125318: [Cow]Tid;                                                                     
 var Cow._state125317: [Cow]State;                                                                  
 var Cow.a125296: [Cow]Array.Cow.T;                                                                 
 var this125318: Cow;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 31.9: [Cow.T{this}] a;                                                                          
                                                                                                    
                                                                                                    
 // 31.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath125296 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125296 := m#moverPath(moverPath125296);                                                       
 path125296 := p#moverPath(moverPath125296);                                                        
 assume Cow._state125296 == Cow._state && Cow.a125296 == Cow.a && Cow._lock125296 == Cow._lock && Array.Cow.T._state125296 == Array.Cow.T._state && Array.Cow.T._elems125296 == Array.Cow.T._elems && Array.Cow.T._length125296 == Array.Cow.T._length && a125296 == a && this125296 == this && tid125296 == tid && $pc125296 == $pc;
 assume $recorded.state125296 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (31.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125296);                                                               
 assert $pc != PhaseError;                                                                                 // (31.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 32.9: [Cow.T{this}] b;                                                                          
                                                                                                    
                                                                                                    
 // 33.9: int s;                                                                                    
                                                                                                    
                                                                                                    
 // 33.17: s = 10;                                                                                  
                                                                                                    
 s := 10;                                                                                           
                                                                                                    
 // 34.9: b = new [Cow.T{this}](s);                                                                 
                                                                                                    
 havoc b;                                                                                           
 assume isFresh(Array.Cow.T._state[b]);                                                             
 assume Array.Cow.T._length[b] == s;                                                                
 assume Array.Cow.T._this[b] == this;                                                               
 Array.Cow.T._state[b] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T._elems[b][_i] == 0);                            
                                                                                                    
 // 35.9: assert a != b;                                                                            
                                                                                                    
 assume Cow._state125317 == Cow._state && Cow.a125317 == Cow.a && Cow._lock125317 == Cow._lock && Array.Cow.T._state125317 == Array.Cow.T._state && Array.Cow.T._elems125317 == Array.Cow.T._elems && Array.Cow.T._length125317 == Array.Cow.T._length && s125317 == s && b125317 == b && a125317 == a && this125317 == this && tid125317 == tid;
 assume $recorded.state125317 == 1;                                                                 
 assert (a!=b);                                                                                            // (35.9): This assertion may not hold.
                                                                                                    
 // 30.21: // return;                                                                               
                                                                                                    
 assume Cow._state125318 == Cow._state && Cow.a125318 == Cow.a && Cow._lock125318 == Cow._lock && Array.Cow.T._state125318 == Array.Cow.T._state && Array.Cow.T._elems125318 == Array.Cow.T._elems && Array.Cow.T._length125318 == Array.Cow.T._length && s125318 == s && b125318 == b && a125318 == a && this125318 == this && tid125318 == tid;
 assume $recorded.state125318 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.j(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (38.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (38.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Cow._state125341: [Cow]State;                                                                  
 var Array.Cow.T._length125341: [Array.Cow.T]int;                                                   
 var Cow.a125340: [Cow]Array.Cow.T;                                                                 
 var Cow._lock125328: [Cow]Tid;                                                                     
 var Cow._lock125340: [Cow]Tid;                                                                     
 var Cow._state125340: [Cow]State;                                                                  
 var b125341: Array.Cow.T;                                                                          
 var tid125328: Tid;                                                                                
 var tid125340: Tid;                                                                                
 var moverPath125328: MoverPath;                                                                    
 var Cow._state125328: [Cow]State;                                                                  
 var Array.Cow.T._state125340: [Array.Cow.T]State;                                                  
 var a125328: Array.Cow.T;                                                                          
 var path125335: int;                                                                               
 var $pc125328: Phase;                                                                              
 var Array.Cow.T._length125340: [Array.Cow.T]int;                                                   
 var this125328: Cow;                                                                               
 var Array.Cow.T._elems125340: [Array.Cow.T]([int]int);                                             
 var Cow.a125341: [Cow]Array.Cow.T;                                                                 
 var tid125341: Tid;                                                                                
 var $pc125335: Phase;                                                                              
 var Cow._state125335: [Cow]State;                                                                  
 var Array.Cow.T._state125341: [Array.Cow.T]State;                                                  
 var Array.Cow.T._elems125335: [Array.Cow.T]([int]int);                                             
 var this125340: Cow;                                                                               
 var Array.Cow.T._elems125341: [Array.Cow.T]([int]int);                                             
 var path125328: int;                                                                               
 var b: Array.Cow.T;                                                                                
 var mover125328: Mover;                                                                            
 var a125341: Array.Cow.T;                                                                          
 var a125335: Array.Cow.T;                                                                          
 var b125335: Array.Cow.T;                                                                          
 var $pc125340: Phase;                                                                              
 var Array.Cow.T._length125335: [Array.Cow.T]int;                                                   
 var moverPath125335: MoverPath;                                                                    
 var $recorded.state125340: int;                                                                    
 var mover125335: Mover;                                                                            
 var Cow.a125335: [Cow]Array.Cow.T;                                                                 
 var Array.Cow.T._state125335: [Array.Cow.T]State;                                                  
 var b125340: Array.Cow.T;                                                                          
 var Cow._lock125341: [Cow]Tid;                                                                     
 var tid125335: Tid;                                                                                
 var $recorded.state125335: int;                                                                    
 var Cow.a125328: [Cow]Array.Cow.T;                                                                 
 var this125335: Cow;                                                                               
 var $recorded.state125341: int;                                                                    
 var $recorded.state125328: int;                                                                    
 var Array.Cow.T._elems125328: [Array.Cow.T]([int]int);                                             
 var a: Array.Cow.T;                                                                                
 var Array.Cow.T._length125328: [Array.Cow.T]int;                                                   
 var this125341: Cow;                                                                               
 var $pc125341: Phase;                                                                              
 var a125340: Array.Cow.T;                                                                          
 var Array.Cow.T._state125328: [Array.Cow.T]State;                                                  
 var Cow._lock125335: [Cow]Tid;                                                                     
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 39.9: [Cow.T{this}] a;                                                                          
                                                                                                    
                                                                                                    
 // 39.9: a := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath125328 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125328 := m#moverPath(moverPath125328);                                                       
 path125328 := p#moverPath(moverPath125328);                                                        
 assume Cow._state125328 == Cow._state && Cow.a125328 == Cow.a && Cow._lock125328 == Cow._lock && Array.Cow.T._state125328 == Array.Cow.T._state && Array.Cow.T._elems125328 == Array.Cow.T._elems && Array.Cow.T._length125328 == Array.Cow.T._length && a125328 == a && this125328 == this && tid125328 == tid && $pc125328 == $pc;
 assume $recorded.state125328 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (39.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125328);                                                               
 assert $pc != PhaseError;                                                                                 // (39.9): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 40.9: [Cow.T{this}] b;                                                                          
                                                                                                    
                                                                                                    
 // 41.9: b := this.a;                                                                              
                                                                                                    
                                                                                                    
 moverPath125335 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125335 := m#moverPath(moverPath125335);                                                       
 path125335 := p#moverPath(moverPath125335);                                                        
 assume Cow._state125335 == Cow._state && Cow.a125335 == Cow.a && Cow._lock125335 == Cow._lock && Array.Cow.T._state125335 == Array.Cow.T._state && Array.Cow.T._elems125335 == Array.Cow.T._elems && Array.Cow.T._length125335 == Array.Cow.T._length && b125335 == b && a125335 == a && this125335 == this && tid125335 == tid && $pc125335 == $pc;
 assume $recorded.state125335 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (41.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125335);                                                               
 assert $pc != PhaseError;                                                                                 // (41.9): Reduction failure
 b := Cow.a[this];                                                                                  
                                                                                                    
 // 42.9: assert a == b;                                                                            
                                                                                                    
 assume Cow._state125340 == Cow._state && Cow.a125340 == Cow.a && Cow._lock125340 == Cow._lock && Array.Cow.T._state125340 == Array.Cow.T._state && Array.Cow.T._elems125340 == Array.Cow.T._elems && Array.Cow.T._length125340 == Array.Cow.T._length && b125340 == b && a125340 == a && this125340 == this && tid125340 == tid;
 assume $recorded.state125340 == 1;                                                                 
 assert (a==b);                                                                                            // (42.9): This assertion may not hold.
                                                                                                    
 // 38.21: // return;                                                                               
                                                                                                    
 assume Cow._state125341 == Cow._state && Cow.a125341 == Cow.a && Cow._lock125341 == Cow._lock && Array.Cow.T._state125341 == Array.Cow.T._state && Array.Cow.T._elems125341 == Array.Cow.T._elems && Array.Cow.T._length125341 == Array.Cow.T._length && b125341 == b && a125341 == a && this125341 == this && tid125341 == tid;
 assume $recorded.state125341 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.k(tid:Tid, this : Cow, a : Array.Cow.T, b : Array.Cow.T)                             
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (45.5): Bad tid
requires isSharedAssignable(Array.Cow.T._state[a]);                                                        // (45.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),a) is not global
requires isSharedAssignable(Array.Cow.T._state[b]);                                                        // (45.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),b) is not global
requires isShared(Cow._state[this]);                                                                       // (45.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Array.Cow.T._elems125373: [Array.Cow.T]([int]int);                                             
 var Array.Cow.T._length125379: [Array.Cow.T]int;                                                   
 var y125366: int;                                                                                  
 var moverPath125373: MoverPath;                                                                    
 var Cow.a125379: [Cow]Array.Cow.T;                                                                 
 var y125378: int;                                                                                  
 var Array.Cow.T._elems125362: [Array.Cow.T]([int]int);                                             
 var $recorded.state125378: int;                                                                    
 var Array.Cow.T._state125366: [Array.Cow.T]State;                                                  
 var Cow._state125366: [Cow]State;                                                                  
 var Array.Cow.T._state125379: [Array.Cow.T]State;                                                  
 var tid125366: Tid;                                                                                
 var b125362: Array.Cow.T;                                                                          
 var a125378: Array.Cow.T;                                                                          
 var Cow.a125366: [Cow]Array.Cow.T;                                                                 
 var a125373: Array.Cow.T;                                                                          
 var x: int;                                                                                        
 var y125362: int;                                                                                  
 var y125379: int;                                                                                  
 var $pc125373: Phase;                                                                              
 var Array.Cow.T._elems125378: [Array.Cow.T]([int]int);                                             
 var b125373: Array.Cow.T;                                                                          
 var x125366: int;                                                                                  
 var $recorded.state125362: int;                                                                    
 var tid125379: Tid;                                                                                
 var Cow._lock125378: [Cow]Tid;                                                                     
 var mover125373: Mover;                                                                            
 var $recorded.state125366: int;                                                                    
 var Array.Cow.T._state125362: [Array.Cow.T]State;                                                  
 var this125362: Cow;                                                                               
 var Array.Cow.T._length125362: [Array.Cow.T]int;                                                   
 var $pc125362: Phase;                                                                              
 var $pc125378: Phase;                                                                              
 var Cow._state125379: [Cow]State;                                                                  
 var moverPath125362: MoverPath;                                                                    
 var Array.Cow.T._state125378: [Array.Cow.T]State;                                                  
 var a125366: Array.Cow.T;                                                                          
 var this125379: Cow;                                                                               
 var x125362: int;                                                                                  
 var tid125373: Tid;                                                                                
 var path125373: int;                                                                               
 var Cow.a125378: [Cow]Array.Cow.T;                                                                 
 var Cow.a125373: [Cow]Array.Cow.T;                                                                 
 var Array.Cow.T._length125373: [Array.Cow.T]int;                                                   
 var Cow._lock125366: [Cow]Tid;                                                                     
 var b125379: Array.Cow.T;                                                                          
 var b125378: Array.Cow.T;                                                                          
 var z: int;                                                                                        
 var Cow._state125373: [Cow]State;                                                                  
 var Cow._lock125373: [Cow]Tid;                                                                     
 var $recorded.state125373: int;                                                                    
 var Array.Cow.T._elems125379: [Array.Cow.T]([int]int);                                             
 var y: int;                                                                                        
 var moverPath125366: MoverPath;                                                                    
 var z125379: int;                                                                                  
 var this125366: Cow;                                                                               
 var z125378: int;                                                                                  
 var path125366: int;                                                                               
 var mover125362: Mover;                                                                            
 var this125378: Cow;                                                                               
 var $recorded.state125379: int;                                                                    
 var path125362: int;                                                                               
 var mover125366: Mover;                                                                            
 var Cow._lock125379: [Cow]Tid;                                                                     
 var Array.Cow.T._length125378: [Array.Cow.T]int;                                                   
 var Array.Cow.T._elems125366: [Array.Cow.T]([int]int);                                             
 var $pc125366: Phase;                                                                              
 var $pc125379: Phase;                                                                              
 var b125366: Array.Cow.T;                                                                          
 var a125379: Array.Cow.T;                                                                          
 var x125378: int;                                                                                  
 var Cow._state125378: [Cow]State;                                                                  
 var Array.Cow.T._length125366: [Array.Cow.T]int;                                                   
 var y125373: int;                                                                                  
 var tid125362: Tid;                                                                                
 var Cow.a125362: [Cow]Array.Cow.T;                                                                 
 var Array.Cow.T._state125373: [Array.Cow.T]State;                                                  
 var this125373: Cow;                                                                               
 var x125379: int;                                                                                  
 var Cow._lock125362: [Cow]Tid;                                                                     
 var Cow._state125362: [Cow]State;                                                                  
 var z125373: int;                                                                                  
 var tid125378: Tid;                                                                                
 var x125373: int;                                                                                  
 var a125362: Array.Cow.T;                                                                          
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 46.9: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 46.17: x = 0;                                                                                   
                                                                                                    
 x := 0;                                                                                            
                                                                                                    
 // 47.9: int y;                                                                                    
                                                                                                    
                                                                                                    
 // 47.17: y = 1;                                                                                   
                                                                                                    
 y := 1;                                                                                            
                                                                                                    
 // 48.9: a[tid] := x;                                                                              
                                                                                                    
                                                                                                    
 moverPath125362 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125362 := m#moverPath(moverPath125362);                                                       
 path125362 := p#moverPath(moverPath125362);                                                        
 assume Cow._state125362 == Cow._state && Cow.a125362 == Cow.a && Cow._lock125362 == Cow._lock && Array.Cow.T._state125362 == Array.Cow.T._state && Array.Cow.T._elems125362 == Array.Cow.T._elems && Array.Cow.T._length125362 == Array.Cow.T._length && y125362 == y && x125362 == x && a125362 == a && b125362 == b && this125362 == this && tid125362 == tid && $pc125362 == $pc;
 assume $recorded.state125362 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (48.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (48.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (48.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125362);                                                               
 assert $pc != PhaseError;                                                                                 // (48.9): Reduction failure
 Array.Cow.T._elems[a][tid] := x;                                                                   
                                                                                                    
 // 49.9: b[tid] := y;                                                                              
                                                                                                    
                                                                                                    
 moverPath125366 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,b: Array.Cow.T,tid: int,y: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125366 := m#moverPath(moverPath125366);                                                       
 path125366 := p#moverPath(moverPath125366);                                                        
 assume Cow._state125366 == Cow._state && Cow.a125366 == Cow.a && Cow._lock125366 == Cow._lock && Array.Cow.T._state125366 == Array.Cow.T._state && Array.Cow.T._elems125366 == Array.Cow.T._elems && Array.Cow.T._length125366 == Array.Cow.T._length && y125366 == y && x125366 == x && a125366 == a && b125366 == b && this125366 == this && tid125366 == tid && $pc125366 == $pc;
 assume $recorded.state125366 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume b != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert b != Array.Cow.T.null;                                                                            // (49.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (49.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[b];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[b];                                                                     // (49.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125366);                                                               
 assert $pc != PhaseError;                                                                                 // (49.9): Reduction failure
 Array.Cow.T._elems[b][tid] := y;                                                                   
                                                                                                    
 // 50.9: int z;                                                                                    
                                                                                                    
                                                                                                    
 // 50.9: z := a[tid];                                                                              
                                                                                                    
                                                                                                    
 moverPath125373 := ReadEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125373 := m#moverPath(moverPath125373);                                                       
 path125373 := p#moverPath(moverPath125373);                                                        
 assume Cow._state125373 == Cow._state && Cow.a125373 == Cow.a && Cow._lock125373 == Cow._lock && Array.Cow.T._state125373 == Array.Cow.T._state && Array.Cow.T._elems125373 == Array.Cow.T._elems && Array.Cow.T._length125373 == Array.Cow.T._length && z125373 == z && y125373 == y && x125373 == x && a125373 == a && b125373 == b && this125373 == this && tid125373 == tid && $pc125373 == $pc;
 assume $recorded.state125373 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (50.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (50.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (50.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125373);                                                               
 assert $pc != PhaseError;                                                                                 // (50.9): Reduction failure
 z := Array.Cow.T._elems[a][tid];                                                                   
                                                                                                    
 // 51.9: assert z == x;                                                                            
                                                                                                    
 assume Cow._state125378 == Cow._state && Cow.a125378 == Cow.a && Cow._lock125378 == Cow._lock && Array.Cow.T._state125378 == Array.Cow.T._state && Array.Cow.T._elems125378 == Array.Cow.T._elems && Array.Cow.T._length125378 == Array.Cow.T._length && z125378 == z && y125378 == y && x125378 == x && a125378 == a && b125378 == b && this125378 == this && tid125378 == tid;
 assume $recorded.state125378 == 1;                                                                 
 assert (z==x);                                                                                            // (51.9): This assertion may not hold.
                                                                                                    
 // 45.33: // return;                                                                               
                                                                                                    
 assume Cow._state125379 == Cow._state && Cow.a125379 == Cow.a && Cow._lock125379 == Cow._lock && Array.Cow.T._state125379 == Array.Cow.T._state && Array.Cow.T._elems125379 == Array.Cow.T._elems && Array.Cow.T._length125379 == Array.Cow.T._length && z125379 == z && y125379 == y && x125379 == x && a125379 == a && b125379 == b && this125379 == this && tid125379 == tid;
 assume $recorded.state125379 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.k2(tid:Tid, this : Cow, a : Array.Cow.T, b : Array.Cow.T)                            
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (54.5): Bad tid
requires isSharedAssignable(Array.Cow.T._state[a]);                                                        // (54.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),a) is not global
requires isSharedAssignable(Array.Cow.T._state[b]);                                                        // (54.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),b) is not global
requires isShared(Cow._state[this]);                                                                       // (54.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Cow._state125421: [Cow]State;                                                                  
 var Cow._state125405: [Cow]State;                                                                  
 var Array.Cow.T._state125421: [Array.Cow.T]State;                                                  
 var moverPath125405: MoverPath;                                                                    
 var $recorded.state125405: int;                                                                    
 var Array.Cow.T._length125405: [Array.Cow.T]int;                                                   
 var Cow.a125421: [Cow]Array.Cow.T;                                                                 
 var x125416: int;                                                                                  
 var y125416: int;                                                                                  
 var y125405: int;                                                                                  
 var this125416: Cow;                                                                               
 var this125422: Cow;                                                                               
 var Array.Cow.T._state125405: [Array.Cow.T]State;                                                  
 var y125409: int;                                                                                  
 var $recorded.state125409: int;                                                                    
 var Array.Cow.T._state125422: [Array.Cow.T]State;                                                  
 var Cow._lock125405: [Cow]Tid;                                                                     
 var b125422: Array.Cow.T;                                                                          
 var x: int;                                                                                        
 var tid125422: Tid;                                                                                
 var a125409: Array.Cow.T;                                                                          
 var Array.Cow.T._length125409: [Array.Cow.T]int;                                                   
 var x125422: int;                                                                                  
 var Cow._lock125422: [Cow]Tid;                                                                     
 var moverPath125409: MoverPath;                                                                    
 var Cow.a125405: [Cow]Array.Cow.T;                                                                 
 var a125416: Array.Cow.T;                                                                          
 var tid125416: Tid;                                                                                
 var $pc125422: Phase;                                                                              
 var Cow._state125422: [Cow]State;                                                                  
 var Cow._lock125421: [Cow]Tid;                                                                     
 var mover125416: Mover;                                                                            
 var a125422: Array.Cow.T;                                                                          
 var this125409: Cow;                                                                               
 var moverPath125416: MoverPath;                                                                    
 var Cow.a125416: [Cow]Array.Cow.T;                                                                 
 var Cow._lock125416: [Cow]Tid;                                                                     
 var Array.Cow.T._state125416: [Array.Cow.T]State;                                                  
 var a125421: Array.Cow.T;                                                                          
 var Cow._state125416: [Cow]State;                                                                  
 var $pc125409: Phase;                                                                              
 var path125405: int;                                                                               
 var z: int;                                                                                        
 var Array.Cow.T._length125416: [Array.Cow.T]int;                                                   
 var Cow.a125422: [Cow]Array.Cow.T;                                                                 
 var Cow._state125409: [Cow]State;                                                                  
 var $recorded.state125421: int;                                                                    
 var y: int;                                                                                        
 var $pc125405: Phase;                                                                              
 var tid125405: Tid;                                                                                
 var Array.Cow.T._length125421: [Array.Cow.T]int;                                                   
 var Array.Cow.T._elems125422: [Array.Cow.T]([int]int);                                             
 var $recorded.state125422: int;                                                                    
 var x125409: int;                                                                                  
 var b125421: Array.Cow.T;                                                                          
 var x125405: int;                                                                                  
 var Array.Cow.T._elems125416: [Array.Cow.T]([int]int);                                             
 var tid125409: Tid;                                                                                
 var path125416: int;                                                                               
 var z125422: int;                                                                                  
 var y125421: int;                                                                                  
 var x125421: int;                                                                                  
 var a125405: Array.Cow.T;                                                                          
 var z125416: int;                                                                                  
 var Array.Cow.T._elems125421: [Array.Cow.T]([int]int);                                             
 var $recorded.state125416: int;                                                                    
 var $pc125421: Phase;                                                                              
 var z125421: int;                                                                                  
 var b125416: Array.Cow.T;                                                                          
 var Array.Cow.T._state125409: [Array.Cow.T]State;                                                  
 var path125409: int;                                                                               
 var b125405: Array.Cow.T;                                                                          
 var y125422: int;                                                                                  
 var this125405: Cow;                                                                               
 var Cow._lock125409: [Cow]Tid;                                                                     
 var Array.Cow.T._elems125409: [Array.Cow.T]([int]int);                                             
 var mover125405: Mover;                                                                            
 var tid125421: Tid;                                                                                
 var this125421: Cow;                                                                               
 var mover125409: Mover;                                                                            
 var Array.Cow.T._elems125405: [Array.Cow.T]([int]int);                                             
 var b125409: Array.Cow.T;                                                                          
 var $pc125416: Phase;                                                                              
 var Array.Cow.T._length125422: [Array.Cow.T]int;                                                   
 var Cow.a125409: [Cow]Array.Cow.T;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 55.8: assume a != b;                                                                            
                                                                                                    
 assume (a!=b);                                                                                     
                                                                                                    
 // 56.9: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 56.17: x = 0;                                                                                   
                                                                                                    
 x := 0;                                                                                            
                                                                                                    
 // 57.9: int y;                                                                                    
                                                                                                    
                                                                                                    
 // 57.17: y = 1;                                                                                   
                                                                                                    
 y := 1;                                                                                            
                                                                                                    
 // 58.9: a[tid] := x;                                                                              
                                                                                                    
                                                                                                    
 moverPath125405 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,x: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125405 := m#moverPath(moverPath125405);                                                       
 path125405 := p#moverPath(moverPath125405);                                                        
 assume Cow._state125405 == Cow._state && Cow.a125405 == Cow.a && Cow._lock125405 == Cow._lock && Array.Cow.T._state125405 == Array.Cow.T._state && Array.Cow.T._elems125405 == Array.Cow.T._elems && Array.Cow.T._length125405 == Array.Cow.T._length && y125405 == y && x125405 == x && a125405 == a && b125405 == b && this125405 == this && tid125405 == tid && $pc125405 == $pc;
 assume $recorded.state125405 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (58.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (58.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (58.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125405);                                                               
 assert $pc != PhaseError;                                                                                 // (58.9): Reduction failure
 Array.Cow.T._elems[a][tid] := x;                                                                   
                                                                                                    
 // 59.9: b[tid] := y;                                                                              
                                                                                                    
                                                                                                    
 moverPath125409 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,b: Array.Cow.T,tid: int,y: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125409 := m#moverPath(moverPath125409);                                                       
 path125409 := p#moverPath(moverPath125409);                                                        
 assume Cow._state125409 == Cow._state && Cow.a125409 == Cow.a && Cow._lock125409 == Cow._lock && Array.Cow.T._state125409 == Array.Cow.T._state && Array.Cow.T._elems125409 == Array.Cow.T._elems && Array.Cow.T._length125409 == Array.Cow.T._length && y125409 == y && x125409 == x && a125409 == a && b125409 == b && this125409 == this && tid125409 == tid && $pc125409 == $pc;
 assume $recorded.state125409 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume b != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert b != Array.Cow.T.null;                                                                            // (59.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (59.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[b];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[b];                                                                     // (59.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125409);                                                               
 assert $pc != PhaseError;                                                                                 // (59.9): Reduction failure
 Array.Cow.T._elems[b][tid] := y;                                                                   
                                                                                                    
 // 60.9: int z;                                                                                    
                                                                                                    
                                                                                                    
 // 60.9: z := a[tid];                                                                              
                                                                                                    
                                                                                                    
 moverPath125416 := ReadEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tid: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover125416 := m#moverPath(moverPath125416);                                                       
 path125416 := p#moverPath(moverPath125416);                                                        
 assume Cow._state125416 == Cow._state && Cow.a125416 == Cow.a && Cow._lock125416 == Cow._lock && Array.Cow.T._state125416 == Array.Cow.T._state && Array.Cow.T._elems125416 == Array.Cow.T._elems && Array.Cow.T._length125416 == Array.Cow.T._length && z125416 == z && y125416 == y && x125416 == x && a125416 == a && b125416 == b && this125416 == this && tid125416 == tid && $pc125416 == $pc;
 assume $recorded.state125416 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (60.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tid;                                                                                  
 } else {                                                                                           
  assert 0 <= tid;                                                                                         // (60.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tid < Array.Cow.T._length[a];                                                              
 } else {                                                                                           
  assert tid < Array.Cow.T._length[a];                                                                     // (60.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover125416);                                                               
 assert $pc != PhaseError;                                                                                 // (60.9): Reduction failure
 z := Array.Cow.T._elems[a][tid];                                                                   
                                                                                                    
 // 61.9: assert z == x;                                                                            
                                                                                                    
 assume Cow._state125421 == Cow._state && Cow.a125421 == Cow.a && Cow._lock125421 == Cow._lock && Array.Cow.T._state125421 == Array.Cow.T._state && Array.Cow.T._elems125421 == Array.Cow.T._elems && Array.Cow.T._length125421 == Array.Cow.T._length && z125421 == z && y125421 == y && x125421 == x && a125421 == a && b125421 == b && this125421 == this && tid125421 == tid;
 assume $recorded.state125421 == 1;                                                                 
 assert (z==x);                                                                                            // (61.9): This assertion may not hold.
                                                                                                    
 // 54.34: // return;                                                                               
                                                                                                    
 assume Cow._state125422 == Cow._state && Cow.a125422 == Cow.a && Cow._lock125422 == Cow._lock && Array.Cow.T._state125422 == Array.Cow.T._state && Array.Cow.T._elems125422 == Array.Cow.T._elems && Array.Cow.T._length125422 == Array.Cow.T._length && z125422 == z && y125422 == y && x125422 == x && a125422 == a && b125422 == b && this125422 == this && tid125422 == tid;
 assume $recorded.state125422 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.T ***/                                                                         
                                                                                                    
type Array.Cow.T;                                                                                   
const unique Array.Cow.T.null: Array.Cow.T;                                                         
var Array.Cow.T._state: [Array.Cow.T]State;                                                         
                                                                                                    
const Array.Cow.T._this : [Array.Cow.T]Cow;                                                         
const Array.Cow.T._length : [Array.Cow.T]int;                                                       
var Array.Cow.T._elems  : [Array.Cow.T]([int]int);                                                  
                                                                                                    
axiom (forall $this : Array.Cow.T :: Array.Cow.T._length[$this] >= 0);                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((index==tid)) then                                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,newValue: int,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((index==tid)) then                                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.T  :: _i == Array.Cow.T.null <==> isNull(Array.Cow.T._state[_i])) &&        
  (forall _t: Tid, _i: Array.Cow.T  :: ValidTid(_t) && isAccessible(Array.Cow.T._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T._this[_i]], _t)) &&
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Array.Cow.T._state[Cow.a[_i]]))) &&
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Array.Cow.T._state[Cow.a[_i]], _t)))) &&
  (forall _i: Cow :: { Cow.a[_i] } Array.Cow.T._this[Cow.a[_i]] == _i) &&                           
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow) 
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow) 
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)  
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)       
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume w == Cow.a[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.Cow.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.Cow.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
ensures Y(tid , old(Cow._state), old(Cow.a), old(Cow._lock), old(Array.Cow.T._state), old(Array.Cow.T._elems), old(Array.Cow.T._length) , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
// Cow.a:                                                                                           
                                                                                                    
function {:inline} Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var newValue_yield: Array.Cow.T;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.a(u: Tid,this: Cow,newValue: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, Cow.a[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Transitive(tid : Tid, this: Cow, newValue : Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var newValue_pre: Array.Cow.T;                                                                      
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Array.Cow.T;                                                                     
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Cow.a(tid, this, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _N);
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var newValue_pre: Tid;                                                                              
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Array.Cow.T:                                                                                     
                                                                                                    
function {:inline} Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
 ((isAccessible(Array.Cow.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T(tid: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Array.Cow.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.T(u: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,newValue: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, Array.Cow.T._elems[athis][index] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue : int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
                                                                                                    
 requires this == Array.Cow.T._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var athis_pre: Array.Cow.T;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var athis_post: Array.Cow.T;                                                                        
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Array.Cow.T(tid, athis, index, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.a(tid : Tid, this, Cow.a_p[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall athis: Array.Cow.T, index: int :: Y_Array.Cow.T(tid : Tid, athis, index, Array.Cow.T._elems_p[athis][index] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Array.Cow.T :: isShared(Array.Cow.T._state[_i]) ==> isShared(Array.Cow.T._state_p[_i]))
 && (forall _i : Array.Cow.T :: Array.Cow.T._length[_i] == Array.Cow.T._length_p[_i])               
 && (forall _i : Array.Cow.T :: isLocal(Array.Cow.T._state[_i], tid) <==> isLocal(Array.Cow.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 798.1-1053.2: (Method:7.5)
// 807.1-807.24: (7.5): Bad tid
// 808.1-808.37: (7.5): this is not global
// 914.2-916.2: (class anchor.sink.VarDeclStmt:8.9)
// 917.2-934.19: (class anchor.sink.Read:8.9)
// 929.1-929.27: (8.9): Cannot have potential null deference in left-mover part.
// 933.1-933.27: (8.9): Reduction failure
// 935.2-943.41: (class anchor.sink.Yield:9.9)
// 944.2-947.36: (class anchor.sink.Assume:10.9)
// 948.2-950.2: (class anchor.sink.VarDeclStmt:11.9)
// 951.2-954.9: (class anchor.sink.Assign:11.17)
// 955.2-982.34: (class anchor.sink.AWrite:12.9)
// 967.1-967.32: (12.9): Cannot have potential null deference in left-mover part.
// 972.1-972.19: (12.9): index < 0.
// 977.1-977.39: (12.9): index is >= length.
// 981.1-981.27: (12.9): Reduction failure
// 983.2-986.11: (class anchor.sink.Assign:13.13)
// 987.2-1014.32: (class anchor.sink.AWrite:14.9)
// 999.1-999.32: (14.9): Cannot have potential null deference in left-mover part.
// 1004.1-1004.17: (14.9): index < 0.
// 1009.1-1009.37: (14.9): index is >= length.
// 1013.1-1013.27: (14.9): Reduction failure
// 1015.2-1018.9: (class anchor.sink.Assign:15.13)
// 1019.2-1046.32: (class anchor.sink.AWrite:16.9)
// 1031.1-1031.32: (16.9): Cannot have potential null deference in left-mover part.
// 1036.1-1036.17: (16.9): index < 0.
// 1041.1-1041.37: (16.9): index is >= length.
// 1045.1-1045.27: (16.9): Reduction failure
// 1047.2-1052.9: (class anchor.sink.Return:7.21)
// 1054.1-1316.2: (Method:19.5)
// 1063.1-1063.24: (19.5): Bad tid
// 1064.1-1064.37: (19.5): this is not global
// 1195.2-1197.2: (class anchor.sink.VarDeclStmt:20.9)
// 1198.2-1215.19: (class anchor.sink.Read:20.9)
// 1210.1-1210.27: (20.9): Cannot have potential null deference in left-mover part.
// 1214.1-1214.27: (20.9): Reduction failure
// 1216.2-1224.41: (class anchor.sink.Yield:21.9)
// 1225.2-1228.36: (class anchor.sink.Assume:22.9)
// 1229.2-1231.2: (class anchor.sink.VarDeclStmt:23.9)
// 1232.2-1235.9: (class anchor.sink.Assign:23.17)
// 1236.2-1263.34: (class anchor.sink.AWrite:24.9)
// 1248.1-1248.32: (24.9): Cannot have potential null deference in left-mover part.
// 1253.1-1253.19: (24.9): index < 0.
// 1258.1-1258.39: (24.9): index is >= length.
// 1262.1-1262.27: (24.9): Reduction failure
// 1264.2-1272.41: (class anchor.sink.Yield:25.9)
// 1273.2-1275.2: (class anchor.sink.VarDeclStmt:26.9)
// 1276.2-1303.34: (class anchor.sink.ARead:26.9)
// 1288.1-1288.32: (26.9): Cannot have potential null deference in left-mover part.
// 1293.1-1293.19: (26.9): index < 0.
// 1298.1-1298.39: (26.9): index is >= length.
// 1302.1-1302.27: (26.9): Reduction failure
// 1304.2-1309.16: (class anchor.sink.Assert:27.9)
// 1309.1-1309.16: (27.9): This assertion may not hold.
// 1310.2-1315.9: (class anchor.sink.Return:19.21)
// 1317.1-1433.2: (Method:30.5)
// 1326.1-1326.24: (30.5): Bad tid
// 1327.1-1327.37: (30.5): this is not global
// 1381.2-1383.2: (class anchor.sink.VarDeclStmt:31.9)
// 1384.2-1401.19: (class anchor.sink.Read:31.9)
// 1396.1-1396.27: (31.9): Cannot have potential null deference in left-mover part.
// 1400.1-1400.27: (31.9): Reduction failure
// 1402.2-1404.2: (class anchor.sink.VarDeclStmt:32.9)
// 1405.2-1407.2: (class anchor.sink.VarDeclStmt:33.9)
// 1408.2-1411.10: (class anchor.sink.Assign:33.17)
// 1412.2-1420.73: (class anchor.sink.AAlloc:34.9)
// 1421.2-1426.16: (class anchor.sink.Assert:35.9)
// 1426.1-1426.16: (35.9): This assertion may not hold.
// 1427.2-1432.9: (class anchor.sink.Return:30.21)
// 1434.1-1564.2: (Method:38.5)
// 1443.1-1443.24: (38.5): Bad tid
// 1444.1-1444.37: (38.5): this is not global
// 1510.2-1512.2: (class anchor.sink.VarDeclStmt:39.9)
// 1513.2-1530.19: (class anchor.sink.Read:39.9)
// 1525.1-1525.27: (39.9): Cannot have potential null deference in left-mover part.
// 1529.1-1529.27: (39.9): Reduction failure
// 1531.2-1533.2: (class anchor.sink.VarDeclStmt:40.9)
// 1534.2-1551.19: (class anchor.sink.Read:41.9)
// 1546.1-1546.27: (41.9): Cannot have potential null deference in left-mover part.
// 1550.1-1550.27: (41.9): Reduction failure
// 1552.2-1557.16: (class anchor.sink.Assert:42.9)
// 1557.1-1557.16: (42.9): This assertion may not hold.
// 1558.2-1563.9: (class anchor.sink.Return:38.21)
// 1565.1-1786.2: (Method:45.5)
// 1574.1-1574.24: (45.5): Bad tid
// 1575.1-1575.52: (45.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),a) is not global
// 1576.1-1576.52: (45.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),b) is not global
// 1577.1-1577.37: (45.5): this is not global
// 1673.2-1675.2: (class anchor.sink.VarDeclStmt:46.9)
// 1676.2-1679.9: (class anchor.sink.Assign:46.17)
// 1680.2-1682.2: (class anchor.sink.VarDeclStmt:47.9)
// 1683.2-1686.9: (class anchor.sink.Assign:47.17)
// 1687.2-1714.34: (class anchor.sink.AWrite:48.9)
// 1699.1-1699.32: (48.9): Cannot have potential null deference in left-mover part.
// 1704.1-1704.19: (48.9): index < 0.
// 1709.1-1709.39: (48.9): index is >= length.
// 1713.1-1713.27: (48.9): Reduction failure
// 1715.2-1742.34: (class anchor.sink.AWrite:49.9)
// 1727.1-1727.32: (49.9): Cannot have potential null deference in left-mover part.
// 1732.1-1732.19: (49.9): index < 0.
// 1737.1-1737.39: (49.9): index is >= length.
// 1741.1-1741.27: (49.9): Reduction failure
// 1743.2-1745.2: (class anchor.sink.VarDeclStmt:50.9)
// 1746.2-1773.34: (class anchor.sink.ARead:50.9)
// 1758.1-1758.32: (50.9): Cannot have potential null deference in left-mover part.
// 1763.1-1763.19: (50.9): index < 0.
// 1768.1-1768.39: (50.9): index is >= length.
// 1772.1-1772.27: (50.9): Reduction failure
// 1774.2-1779.16: (class anchor.sink.Assert:51.9)
// 1779.1-1779.16: (51.9): This assertion may not hold.
// 1780.2-1785.9: (class anchor.sink.Return:45.33)
// 1787.1-2012.2: (Method:54.5)
// 1796.1-1796.24: (54.5): Bad tid
// 1797.1-1797.52: (54.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),a) is not global
// 1798.1-1798.52: (54.5): Parameter VarDecl(ArrayType(Cow,T,VarAccess(this)),b) is not global
// 1799.1-1799.37: (54.5): this is not global
// 1895.2-1898.16: (class anchor.sink.Assume:55.8)
// 1899.2-1901.2: (class anchor.sink.VarDeclStmt:56.9)
// 1902.2-1905.9: (class anchor.sink.Assign:56.17)
// 1906.2-1908.2: (class anchor.sink.VarDeclStmt:57.9)
// 1909.2-1912.9: (class anchor.sink.Assign:57.17)
// 1913.2-1940.34: (class anchor.sink.AWrite:58.9)
// 1925.1-1925.32: (58.9): Cannot have potential null deference in left-mover part.
// 1930.1-1930.19: (58.9): index < 0.
// 1935.1-1935.39: (58.9): index is >= length.
// 1939.1-1939.27: (58.9): Reduction failure
// 1941.2-1968.34: (class anchor.sink.AWrite:59.9)
// 1953.1-1953.32: (59.9): Cannot have potential null deference in left-mover part.
// 1958.1-1958.19: (59.9): index < 0.
// 1963.1-1963.39: (59.9): index is >= length.
// 1967.1-1967.27: (59.9): Reduction failure
// 1969.2-1971.2: (class anchor.sink.VarDeclStmt:60.9)
// 1972.2-1999.34: (class anchor.sink.ARead:60.9)
// 1984.1-1984.32: (60.9): Cannot have potential null deference in left-mover part.
// 1989.1-1989.19: (60.9): index < 0.
// 1994.1-1994.39: (60.9): index is >= length.
// 1998.1-1998.27: (60.9): Reduction failure
// 2000.2-2005.16: (class anchor.sink.Assert:61.9)
// 2005.1-2005.16: (61.9): This assertion may not hold.
// 2006.2-2011.9: (class anchor.sink.Return:54.34)
// 2138.1-2138.34: (5.5): Cow.a failed Write-Write Right-Mover Check
// 2201.1-2201.30: (5.5): Cow.a failed Write-Read Right-Mover Check
// 2268.1-2268.34: (5.5): Cow.a failed Write-Write Left-Mover Check
// 2332.1-2332.30: (5.5): Cow.a failed Write-Read Left-Mover Check
// 2393.1-2393.34: (5.5): Cow.a failed Read-Write Right-Mover Check
// 2457.1-2457.34: (5.5): Cow.a failed Read-Write Left-Mover Check
// 2526.1-2526.34: (3.5): Array Array.Cow.T failed Write-Write Right-Mover Check
// 2595.1-2595.30: (3.5): Array Array.Cow.T failed Write-Read Right-Mover Check
// 2668.1-2668.34: (3.5): Array Array.Cow.T failed Write-Write Left-Mover Check
// 2738.1-2738.30: (3.5): Array Array.Cow.T failed Write-Read Left-Mover Check
// 2805.1-2805.34: (3.5): Array Array.Cow.T failed Read-Write Right-Mover Check
// 2875.1-2875.34: (3.5): Array Array.Cow.T failed Read-Write Left-Mover Check
// 2950.1-2950.140: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
// 2951.1-2951.101: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
// 2952.1-2952.158: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
// 3054.1-3054.140: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
// 3161.1-3161.144: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
// 3162.1-3162.144: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
// 3237.1-3237.136: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
// 3238.1-3238.136: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
// 3239.1-3239.146: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
// 3313.1-3313.136: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
// 3314.1-3314.136: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
// 3315.1-3315.99: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
// 3396.1-3396.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
// 3397.1-3397.101: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
// 3398.1-3398.156: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
// 3507.1-3507.140: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 3621.1-3621.144: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 3622.1-3622.144: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 3702.1-3702.136: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 3703.1-3703.136: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 3704.1-3704.144: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 3783.1-3783.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
// 3784.1-3784.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
// 3785.1-3785.99: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
// 3866.1-3866.140: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 3867.1-3867.101: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 3868.1-3868.156: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 3977.1-3977.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
// 4091.1-4091.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
// 4092.1-4092.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
// 4172.1-4172.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
// 4173.1-4173.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
// 4174.1-4174.144: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
// 4253.1-4253.136: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 4254.1-4254.136: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 4255.1-4255.99: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 4341.1-4341.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 4342.1-4342.101: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 4343.1-4343.156: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 4459.1-4459.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 4580.1-4580.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 4581.1-4581.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 4666.1-4666.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 4667.1-4667.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 4668.1-4668.144: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 4752.1-4752.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 4753.1-4753.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 4754.1-4754.99: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 4787.1-4809.2: (5.5): yields_as clause for Cow.a is not valid
// 4814.1-4831.2: (5.5): yields_as clause for Cow.a is not reflexive
// 4837.1-4871.2: (5.5): yields_as clause for Cow.a is not transitive
// 4891.1-4913.2: (7.32): yields_as clause for Cow._lock is not valid
// 4918.1-4935.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4941.1-4975.2: (7.32): yields_as clause for Cow._lock is not transitive
// 4993.1-5019.2: (3.5): yields_as clause for Array.Cow.T is not valid
// 5020.1-5043.2: (3.5): yields_as clause for Array.Cow.T is not reflexive
// 5048.1-5086.2: (3.5): yields_as clause for Array.Cow.T is not transitive
