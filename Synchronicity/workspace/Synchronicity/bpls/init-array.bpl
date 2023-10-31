                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/init-array.sink:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array Array = int[isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E]                                                                            
                                                                                                    
       [Cow.Array{this}] elems isLocal(this, tid)                                                   
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
      invariant  this.elems != [Cow.Array{this}].null;                                              
      invariant  forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant forall int k ::0 <= k && k < i ==> elems[k] == k;                               
          invariant isLocal(elems, tid);                                                            
          {                                                                                         
          elems[i] := i;                                                                            
          i = i + 1;                                                                                
        }                                                                                           
        this.elems := elems;                                                                        
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      int get(int i) {                                                                              
        [Cow.Array{this}] elems;                                                                    
        elems := this.elems;                                                                        
        int result;                                                                                 
        result := elems[i];                                                                         
         return result;                                                                             
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c.init()                                                                                    
        int y;                                                                                      
        y = c.get(5)                                                                                
        assert y == 5;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array Array = int[isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E]                                                                            
                                                                                                    
       [Cow.Array{this}] elems isLocal(this, tid)                                                   
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.elems != [Cow.Array{this}].null;                                              
      invariant  forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant forall int k ::0 <= k && k < i ==> elems[k] == k;                               
          invariant isLocal(elems, tid);                                                            
          {                                                                                         
          elems[i] := i;                                                                            
          i = i + 1;                                                                                
        }                                                                                           
        this.elems := elems;                                                                        
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      int get(int i) {                                                                              
        [Cow.Array{this}] elems;                                                                    
        elems := this.elems;                                                                        
        int result;                                                                                 
        result := elems[i];                                                                         
        {                                                                                           
           return result;                                                                           
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c.init()                                                                                    
        int y;                                                                                      
        y = c.get(5)                                                                                
        assert y == 5;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array Array = int[isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E]                                                                            
                                                                                                    
       [Cow.Array{this}] elems isLocal(this, tid)                                                   
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.elems != [Cow.Array{this}].null;                                              
      invariant  forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant forall int k ::0 <= k && k < i ==> elems[k] == k;                               
          invariant isLocal(elems, tid);                                                            
          {                                                                                         
          elems[i] := i;                                                                            
          i = i + 1;                                                                                
        }                                                                                           
        this.elems := elems;                                                                        
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      int get(int i) {                                                                              
        [Cow.Array{this}] elems;                                                                    
        elems := this.elems;                                                                        
        int result;                                                                                 
        result := elems[i];                                                                         
        {                                                                                           
           return result;                                                                           
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        {                                                                                           
          inlined c.init();                                                                         
          exit$199: {                                                                               
            Cow this$199;                                                                           
            this$199 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$199}] elems$199;                                                      
              elems$199 = new [Cow.Array{this$199}](16);                                            
              int i$199;                                                                            
              i$199 = 0;                                                                            
              while (i$199 < 16)                                                                    
                invariant forall int k$199 ::0 <= k$199 && k$199 < i$199 ==> elems$199[k$199] == k$199;
                invariant isLocal(elems$199, tid);                                                  
                {                                                                                   
                elems$199[i$199] := i$199;                                                          
                i$199 = i$199 + 1;                                                                  
              }                                                                                     
              this$199.elems := elems$199;                                                          
              {                                                                                     
                break exit$199;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int y;                                                                                      
        {                                                                                           
          inlined y = c.get(5);                                                                     
          exit$200: {                                                                               
            int i$200;                                                                              
            Cow this$200;                                                                           
            i$200 = 5;                                                                              
            this$200 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$200}] elems$200;                                                      
              elems$200 := this$200.elems;                                                          
              int result$200;                                                                       
              result$200 := elems$200[i$200];                                                       
              {                                                                                     
                {                                                                                   
                  y = result$200;                                                                   
                  break exit$200;                                                                   
                }                                                                                   
              }                                                                                     
              {                                                                                     
                {                                                                                   
                  y = -1;                                                                           
                  break exit$200;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        assert y == 5;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array Array = int[isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E]                                                                            
                                                                                                    
       [Cow.Array{this}] elems isLocal(this, tid)                                                   
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.elems != [Cow.Array{this}].null;                                              
      invariant  forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;             
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant forall int k ::0 <= k && k < i ==> elems[k] == k;                               
          invariant isLocal(elems, tid);                                                            
          {                                                                                         
          elems[i] := i;                                                                            
          i = i + 1;                                                                                
        }                                                                                           
        this.elems := elems;                                                                        
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      int get(int i) {                                                                              
        [Cow.Array{this}] elems;                                                                    
        elems := this.elems;                                                                        
        int result;                                                                                 
        result := elems[i];                                                                         
        {                                                                                           
           return result;                                                                           
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        {                                                                                           
          inlined c.init();                                                                         
          exit$199: {                                                                               
            Cow this$199;                                                                           
            this$199 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$199}] elems$199;                                                      
              elems$199 = new [Cow.Array{this$199}](16);                                            
              int i$199;                                                                            
              i$199 = 0;                                                                            
              while (i$199 < 16)                                                                    
                invariant forall int k$199 ::0 <= k$199 && k$199 < i$199 ==> elems$199[k$199] == k$199;
                invariant isLocal(elems$199, tid);                                                  
                {                                                                                   
                elems$199[i$199] := i$199;                                                          
                i$199 = i$199 + 1;                                                                  
              }                                                                                     
              this$199.elems := elems$199;                                                          
              {                                                                                     
                break exit$199;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int y;                                                                                      
        {                                                                                           
          inlined y = c.get(5);                                                                     
          exit$200: {                                                                               
            int i$200;                                                                              
            Cow this$200;                                                                           
            i$200 = 5;                                                                              
            this$200 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$200}] elems$200;                                                      
              elems$200 := this$200.elems;                                                          
              int result$200;                                                                       
              result$200 := elems$200[i$200];                                                       
              {                                                                                     
                {                                                                                   
                  y = result$200;                                                                   
                  break exit$200;                                                                   
                }                                                                                   
              }                                                                                     
              {                                                                                     
                {                                                                                   
                  y = -1;                                                                           
                  break exit$200;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        assert y == 5;                                                                              
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
                                                                                                    
var Cow.elems: [Cow]Array.Cow.Array;                                                                
                                                                                                    
function {:inline} ReadEval.Cow.elems(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.Cow.Array.null;                                                             
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
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
                                                                                                    
function {:inline} WriteEval.Cow.elems(tid: Tid,this : Cow,newValue: Array.Cow.Array,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
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
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} Invariant.Cow.2268191(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (Cow.elems[this]!=Array.Cow.Array.null)                                                            
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Cow.2268217(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (forall i: int ::  ((((0<=i)&&(i<Array.Cow.Array._length[Cow.elems[this]]))==>(Array.Cow.Array._elems[Cow.elems[this]][i]==i))))
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/*** Array Array.Cow.Array ***/                                                                     
                                                                                                    
type Array.Cow.Array;                                                                               
const unique Array.Cow.Array.null: Array.Cow.Array;                                                 
var Array.Cow.Array._state: [Array.Cow.Array]State;                                                 
                                                                                                    
const Array.Cow.Array._this : [Array.Cow.Array]Cow;                                                 
const Array.Cow.Array._length : [Array.Cow.Array]int;                                               
var Array.Cow.Array._elems  : [Array.Cow.Array]([int]int);                                          
                                                                                                    
axiom (forall $this : Array.Cow.Array :: Array.Cow.Array._length[$this] >= 0);                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.Array: Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.Array(tid: Tid,this : Cow,athis : Array.Cow.Array,index : int,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
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
                                                                                                    
// Array.Cow.Array: Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.Array(tid: Tid,this : Cow,athis : Array.Cow.Array,index : int,newValue: int,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Main ***/                                                                           
                                                                                                    
type Main;                                                                                          
const unique Main.null: Main;                                                                       
var Main._state: [Main]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Main._lock: [Main]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Main._lock(tid: Tid,this : Main,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Main._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Main._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Main._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Main._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Main._lock(tid: Tid,this : Main,newValue: Tid,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Main._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Main._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Main._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Main._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Main.main(tid:Tid, this : Main)                                                          
modifies Cow._state;                                                                                
modifies Cow.elems;                                                                                 
modifies Cow._lock;                                                                                 
modifies Array.Cow.Array._state;                                                                    
modifies Array.Cow.Array._elems;                                                                    
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (34.4): Bad tid
requires isShared(Main._state[this]);                                                                      // (34.4): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.4): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.4): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.4): Object invariant may not hold.
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.4): Object invariant may not hold.
{                                                                                                   
 var Cow._lock2268815: [Cow]Tid;                                                                    
 var y2268883: int;                                                                                 
 var Array.Cow.Array._elems2268781: [Array.Cow.Array]([int]int);                                    
 var Cow._lock2268818: [Cow]Tid;                                                                    
 var Cow._state2268856: [Cow]State;                                                                 
 var c2268856: Cow;                                                                                 
 var i$199: int;                                                                                    
 var Array.Cow.Array._state2268849: [Array.Cow.Array]State;                                         
 var $recorded.state2268856: int;                                                                   
 var c2268849: Cow;                                                                                 
 var Cow.elems2268781: [Cow]Array.Cow.Array;                                                        
 var $pc2268818: Phase;                                                                             
 var mover2268781: Mover;                                                                           
 var Array.Cow.Array._state2268815_bottom: [Array.Cow.Array]State;                                  
 var tid2268818: Tid;                                                                               
 var Array.Cow.Array._elems2268849: [Array.Cow.Array]([int]int);                                    
 var Array.Cow.Array._elems2268883: [Array.Cow.Array]([int]int);                                    
 var y2268849: int;                                                                                 
 var Array.Cow.Array._elems2268815: [Array.Cow.Array]([int]int);                                    
 var this2268884: Main;                                                                             
 var this2268818: Main;                                                                             
 var c2268815: Cow;                                                                                 
 var moverPath2268856: MoverPath;                                                                   
 var $recorded.state2268849: int;                                                                   
 var mover2268856: Mover;                                                                           
 var tid2268856: Tid;                                                                               
 var c2268884: Cow;                                                                                 
 var Main._state2268856: [Main]State;                                                               
 var c2268815_bottom: Cow;                                                                          
 var moverPath2268781: MoverPath;                                                                   
 var Array.Cow.Array._state2268883: [Array.Cow.Array]State;                                         
 var y2268884: int;                                                                                 
 var path2268849: int;                                                                              
 var Main._state2268849: [Main]State;                                                               
 var result$2002268856: int;                                                                        
 var $recorded.state2268815_bottom: int;                                                            
 var Cow._lock2268884: [Cow]Tid;                                                                    
 var Cow._state2268781: [Cow]State;                                                                 
 var c2268781: Cow;                                                                                 
 var result$200: int;                                                                               
 var Main._state2268815_bottom: [Main]State;                                                        
 var Cow.elems2268849: [Cow]Array.Cow.Array;                                                        
 var Cow._state2268884: [Cow]State;                                                                 
 var Cow._state2268818: [Cow]State;                                                                 
 var Main._state2268781: [Main]State;                                                               
 var i$2002268849: int;                                                                             
 var i$1992268815: int;                                                                             
 var Main._lock2268815_bottom: [Main]Tid;                                                           
 var Array.Cow.Array._length2268781: [Array.Cow.Array]int;                                          
 var Cow._state2268815_bottom: [Cow]State;                                                          
 var Cow.elems2268883: [Cow]Array.Cow.Array;                                                        
 var elems$1992268815_bottom: Array.Cow.Array;                                                      
 var Array.Cow.Array._state2268818: [Array.Cow.Array]State;                                         
 var $recorded.state2268815: int;                                                                   
 var i$200: int;                                                                                    
 var $recorded.state2268818: int;                                                                   
 var Array.Cow.Array._length2268849: [Array.Cow.Array]int;                                          
 var path2268781: int;                                                                              
 var i$1992268815_bottom: int;                                                                      
 var Cow._state2268883: [Cow]State;                                                                 
 var Array.Cow.Array._state2268884: [Array.Cow.Array]State;                                         
 var Array.Cow.Array._elems2268884: [Array.Cow.Array]([int]int);                                    
 var $recorded.state2268883: int;                                                                   
 var Array.Cow.Array._elems2268815_bottom: [Array.Cow.Array]([int]int);                             
 var this$200: Cow;                                                                                 
 var tid2268815: Tid;                                                                               
 var elems$2002268849: Array.Cow.Array;                                                             
 var Main._lock2268883: [Main]Tid;                                                                  
 var Cow._lock2268883: [Cow]Tid;                                                                    
 var phase2268815: Phase;                                                                           
 var this2268781: Main;                                                                             
 var path2268856: int;                                                                              
 var this2268815_bottom: Main;                                                                      
 var Main._lock2268884: [Main]Tid;                                                                  
 var Array.Cow.Array._length2268815_bottom: [Array.Cow.Array]int;                                   
 var this$1992268815: Cow;                                                                          
 var moverPath2268849: MoverPath;                                                                   
 var Cow._state2268815: [Cow]State;                                                                 
 var mover2268818: Mover;                                                                           
 var Array.Cow.Array._length2268815: [Array.Cow.Array]int;                                          
 var Array.Cow.Array._length2268856: [Array.Cow.Array]int;                                          
 var i$2002268856: int;                                                                             
 var $pc2268781: Phase;                                                                             
 var i$1992268818: int;                                                                             
 var this$1992268781: Cow;                                                                          
 var Main._state2268815: [Main]State;                                                               
 var $recorded.state2268781: int;                                                                   
 var y: int;                                                                                        
 var this2268883: Main;                                                                             
 var $pc2268849: Phase;                                                                             
 var Main._state2268884: [Main]State;                                                               
 var Cow.elems2268818: [Cow]Array.Cow.Array;                                                        
 var Main._lock2268815: [Main]Tid;                                                                  
 var Main._state2268883: [Main]State;                                                               
 var moverPath2268818: MoverPath;                                                                   
 var Cow._lock2268849: [Cow]Tid;                                                                    
 var Cow._lock2268815_bottom: [Cow]Tid;                                                             
 var $pc2268815: Phase;                                                                             
 var elems$199: Array.Cow.Array;                                                                    
 var Array.Cow.Array._elems2268856: [Array.Cow.Array]([int]int);                                    
 var Cow._lock2268856: [Cow]Tid;                                                                    
 var tid2268781: Tid;                                                                               
 var Array.Cow.Array._state2268781: [Array.Cow.Array]State;                                         
 var this$1992268815_bottom: Cow;                                                                   
 var this$2002268856: Cow;                                                                          
 var i$1992268781: int;                                                                             
 var elems$1992268815: Array.Cow.Array;                                                             
 var this$199: Cow;                                                                                 
 var Main._lock2268856: [Main]Tid;                                                                  
 var elems$2002268856: Array.Cow.Array;                                                             
 var Main._lock2268818: [Main]Tid;                                                                  
 var y2268856: int;                                                                                 
 var $pc2268883: Phase;                                                                             
 var tid2268884: Tid;                                                                               
 var Cow.elems2268815: [Cow]Array.Cow.Array;                                                        
 var Main._lock2268781: [Main]Tid;                                                                  
 var Main._state2268818: [Main]State;                                                               
 var this2268849: Main;                                                                             
 var mover2268849: Mover;                                                                           
 var tid2268883: Tid;                                                                               
 var this$2002268849: Cow;                                                                          
 var Main._lock2268849: [Main]Tid;                                                                  
 var path2268818: int;                                                                              
 var Cow._lock2268781: [Cow]Tid;                                                                    
 var tid2268815_bottom: Tid;                                                                        
 var Cow._state2268849: [Cow]State;                                                                 
 var Cow.elems2268856: [Cow]Array.Cow.Array;                                                        
 var Cow.elems2268815_bottom: [Cow]Array.Cow.Array;                                                 
 var this$1992268818: Cow;                                                                          
 var c2268818: Cow;                                                                                 
 var Array.Cow.Array._state2268856: [Array.Cow.Array]State;                                         
 var Array.Cow.Array._state2268815: [Array.Cow.Array]State;                                         
 var elems$200: Array.Cow.Array;                                                                    
 var Array.Cow.Array._length2268884: [Array.Cow.Array]int;                                          
 var this2268856: Main;                                                                             
 var elems$1992268781: Array.Cow.Array;                                                             
 var $pc2268884: Phase;                                                                             
 var c: Cow;                                                                                        
 var this2268815: Main;                                                                             
 var $pc2268815_bottom: Phase;                                                                      
 var Array.Cow.Array._length2268883: [Array.Cow.Array]int;                                          
 var Array.Cow.Array._length2268818: [Array.Cow.Array]int;                                          
 var tid2268849: Tid;                                                                               
 var elems$1992268818: Array.Cow.Array;                                                             
 var $recorded.state2268884: int;                                                                   
 var $pc2268856: Phase;                                                                             
 var c2268883: Cow;                                                                                 
 var Array.Cow.Array._elems2268818: [Array.Cow.Array]([int]int);                                    
 var Cow.elems2268884: [Cow]Array.Cow.Array;                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 35.8: Cow c;                                                                                    
                                                                                                    
                                                                                                    
 // 35.8: c = new Cow();                                                                            
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.elems[c]  == Array.Cow.Array.null;                                                      
 assume Cow._lock[c]  == Tid.null;                                                                  
 // inlined: c.init()}                                                                              
 exit$199_top:                                                                                      
                                                                                                    
 // 36.8: Cow this$199;                                                                             
                                                                                                    
                                                                                                    
 // 36.8: this$199 = c;                                                                             
                                                                                                    
 this$199 := c;                                                                                     
                                                                                                    
 // 13.9: [Cow.Array{this$199}] elems$199;                                                          
                                                                                                    
                                                                                                    
 // 13.9: elems$199 = new [Cow.Array{this$199}](16);                                                
                                                                                                    
 havoc elems$199;                                                                                   
 assume isFresh(Array.Cow.Array._state[elems$199]);                                                 
 assume Array.Cow.Array._length[elems$199] == 16;                                                   
 assume Array.Cow.Array._this[elems$199] == this$199;                                               
 Array.Cow.Array._state[elems$199] := LOCAL(tid);                                                   
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.Array._elems[elems$199][_i] == 0);                
                                                                                                    
 // 16.14: int i$199;                                                                               
                                                                                                    
                                                                                                    
 // 16.22: i$199 = 0;                                                                               
                                                                                                    
 i$199 := 0;                                                                                        
 assume Cow._state2268815 == Cow._state && Cow.elems2268815 == Cow.elems && Cow._lock2268815 == Cow._lock && Array.Cow.Array._state2268815 == Array.Cow.Array._state && Array.Cow.Array._elems2268815 == Array.Cow.Array._elems && Array.Cow.Array._length2268815 == Array.Cow.Array._length && Main._state2268815 == Main._state && Main._lock2268815 == Main._lock && i$1992268815 == i$199 && elems$1992268815 == elems$199 && this$1992268815 == this$199 && c2268815 == c && this2268815 == this && tid2268815 == tid;
 assume $recorded.state2268815 == 1;                                                                
                                                                                                    
 // 16.27: while (i$199 < 16)                                                                       
                                                                                                    
 phase2268815 := $pc;                                                                               
 while ((i$199<16))                                                                                 
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (34.4): Bad tid
  invariant isShared(Main._state[this]);                                                                   // (34.4): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && _this != c ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (16.27): Object invariant may not hold.
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && _this != c ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (16.27): Object invariant may not hold.
  invariant (forall k$199: int ::  ((((0<=k$199)&&(k$199<i$199))==>(Array.Cow.Array._elems[elems$199][k$199]==k$199))));
  invariant isLocal(Array.Cow.Array._state[elems$199], tid);                                        
  invariant (forall _this : Cow :: Invariant.Y_Cow.elems(tid : Tid, _this, Cow.elems[_this] ,Cow._state2268815,Cow.elems2268815,Cow._lock2268815,Array.Cow.Array._state2268815,Array.Cow.Array._elems2268815,Array.Cow.Array._length2268815,Main._state2268815,Main._lock2268815));       // (16.27): Loop does not preserve yields_as annotation for field elems
  invariant (forall _athis : Array.Cow.Array, _index : int :: Invariant.Y_Array.Cow.Array(tid : Tid, _athis, _index, Array.Cow.Array._elems[_athis][_index] ,Cow._state2268815,Cow.elems2268815,Cow._lock2268815,Array.Cow.Array._state2268815,Array.Cow.Array._elems2268815,Array.Cow.Array._length2268815,Main._state2268815,Main._lock2268815));       // (16.27): Loop does not preserve yields_as annotation for field ArrayDecl(Array,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant phase2268815 == $pc;                                                                           // (16.27): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (16.27): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 20.13: elems$199[i$199] := i$199;                                                              
                                                                                                    
                                                                                                    
  moverPath2268781 := WriteEval.Array.Cow.Array(tid: Tid,this$199: Cow,elems$199: Array.Cow.Array,i$199: int,i$199: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
  mover2268781 := m#moverPath(moverPath2268781);                                                    
  path2268781 := p#moverPath(moverPath2268781);                                                     
  assume Cow._state2268781 == Cow._state && Cow.elems2268781 == Cow.elems && Cow._lock2268781 == Cow._lock && Array.Cow.Array._state2268781 == Array.Cow.Array._state && Array.Cow.Array._elems2268781 == Array.Cow.Array._elems && Array.Cow.Array._length2268781 == Array.Cow.Array._length && Main._state2268781 == Main._state && Main._lock2268781 == Main._lock && i$1992268781 == i$199 && elems$1992268781 == elems$199 && this$1992268781 == this$199 && c2268781 == c && this2268781 == this && tid2268781 == tid && $pc2268781 == $pc;
  assume $recorded.state2268781 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume elems$199 != Array.Cow.Array.null;                                                        
  } else {                                                                                          
   assert elems$199 != Array.Cow.Array.null;                                                               // (20.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i$199;                                                                               
  } else {                                                                                          
   assert 0 <= i$199;                                                                                      // (20.13): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i$199 < Array.Cow.Array._length[elems$199];                                               
  } else {                                                                                          
   assert i$199 < Array.Cow.Array._length[elems$199];                                                      // (20.13): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2268781);                                                             
  assert $pc != PhaseError;                                                                                // (20.13): Reduction failure
  Array.Cow.Array._elems[elems$199][i$199] := i$199;                                                
                                                                                                    
  // 16.39: i$199 = i$199 + 1;                                                                      
                                                                                                    
  i$199 := (i$199+1);                                                                               
  assume Cow._state2268815_bottom == Cow._state && Cow.elems2268815_bottom == Cow.elems && Cow._lock2268815_bottom == Cow._lock && Array.Cow.Array._state2268815_bottom == Array.Cow.Array._state && Array.Cow.Array._elems2268815_bottom == Array.Cow.Array._elems && Array.Cow.Array._length2268815_bottom == Array.Cow.Array._length && Main._state2268815_bottom == Main._state && Main._lock2268815_bottom == Main._lock && i$1992268815_bottom == i$199 && elems$1992268815_bottom == elems$199 && this$1992268815_bottom == this$199 && c2268815_bottom == c && this2268815_bottom == this && tid2268815_bottom == tid;
  assume $recorded.state2268815_bottom == 1;                                                        
  assert phase2268815 == $pc;                                                                              // (16.27): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 22.9: this$199.elems := elems$199;                                                              
                                                                                                    
                                                                                                    
 moverPath2268818 := WriteEval.Cow.elems(tid: Tid,this$199: Cow,elems$199: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2268818 := m#moverPath(moverPath2268818);                                                     
 path2268818 := p#moverPath(moverPath2268818);                                                      
 assume Cow._state2268818 == Cow._state && Cow.elems2268818 == Cow.elems && Cow._lock2268818 == Cow._lock && Array.Cow.Array._state2268818 == Array.Cow.Array._state && Array.Cow.Array._elems2268818 == Array.Cow.Array._elems && Array.Cow.Array._length2268818 == Array.Cow.Array._length && Main._state2268818 == Main._state && Main._lock2268818 == Main._lock && i$1992268818 == i$199 && elems$1992268818 == elems$199 && this$1992268818 == this$199 && c2268818 == c && this2268818 == this && tid2268818 == tid && $pc2268818 == $pc;
 assume $recorded.state2268818 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$199 != Cow.null;                                                                      
 } else {                                                                                           
  assert this$199 != Cow.null;                                                                             // (22.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2268818);                                                              
 assert $pc != PhaseError;                                                                                 // (22.9): Reduction failure
 Cow.elems[this$199] := elems$199;                                                                  
 if (isLocal(Array.Cow.Array._state[elems$199], tid)) {                                             
  Array.Cow.Array._state[elems$199] := SHARED();                                                    
  if (isLocal(Cow._state[Array.Cow.Array._this[elems$199]], tid)) {                                 
   Cow._state[Array.Cow.Array._this[elems$199]] := SHARED();                                        
   assert isSharedAssignable(Array.Cow.Array._state[Cow.elems[Array.Cow.Array._this[elems$199]]]);         // (22.9): elems$199 became shared, but Array.Cow.Array._this[elems$199].elems may not be shared.
  }                                                                                                 
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 12.17: break exit$199;                                                                          
                                                                                                    
 goto exit$199_bottom;                                                                              
 exit$199_bottom:                                                                                   
                                                                                                    
 // 37.8: int y;                                                                                    
                                                                                                    
 // inlined: c.get(5)}                                                                              
 exit$200_top:                                                                                      
                                                                                                    
 // 37.8: int i$200;                                                                                
                                                                                                    
                                                                                                    
 // 37.8: Cow this$200;                                                                             
                                                                                                    
                                                                                                    
 // 37.8: i$200 = 5;                                                                                
                                                                                                    
 i$200 := 5;                                                                                        
                                                                                                    
 // 37.8: this$200 = c;                                                                             
                                                                                                    
 this$200 := c;                                                                                     
                                                                                                    
 // 26.9: [Cow.Array{this$200}] elems$200;                                                          
                                                                                                    
                                                                                                    
 // 26.9: elems$200 := this$200.elems;                                                              
                                                                                                    
                                                                                                    
 moverPath2268849 := ReadEval.Cow.elems(tid: Tid,this$200: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2268849 := m#moverPath(moverPath2268849);                                                     
 path2268849 := p#moverPath(moverPath2268849);                                                      
 assume Cow._state2268849 == Cow._state && Cow.elems2268849 == Cow.elems && Cow._lock2268849 == Cow._lock && Array.Cow.Array._state2268849 == Array.Cow.Array._state && Array.Cow.Array._elems2268849 == Array.Cow.Array._elems && Array.Cow.Array._length2268849 == Array.Cow.Array._length && Main._state2268849 == Main._state && Main._lock2268849 == Main._lock && elems$2002268849 == elems$200 && this$2002268849 == this$200 && i$2002268849 == i$200 && y2268849 == y && c2268849 == c && this2268849 == this && tid2268849 == tid && $pc2268849 == $pc;
 assume $recorded.state2268849 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$200 != Cow.null;                                                                      
 } else {                                                                                           
  assert this$200 != Cow.null;                                                                             // (26.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2268849);                                                              
 assert $pc != PhaseError;                                                                                 // (26.9): Reduction failure
 elems$200 := Cow.elems[this$200];                                                                  
                                                                                                    
 // 27.9: int result$200;                                                                           
                                                                                                    
                                                                                                    
 // 27.9: result$200 := elems$200[i$200];                                                           
                                                                                                    
                                                                                                    
 moverPath2268856 := ReadEval.Array.Cow.Array(tid: Tid,this$200: Cow,elems$200: Array.Cow.Array,i$200: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2268856 := m#moverPath(moverPath2268856);                                                     
 path2268856 := p#moverPath(moverPath2268856);                                                      
 assume Cow._state2268856 == Cow._state && Cow.elems2268856 == Cow.elems && Cow._lock2268856 == Cow._lock && Array.Cow.Array._state2268856 == Array.Cow.Array._state && Array.Cow.Array._elems2268856 == Array.Cow.Array._elems && Array.Cow.Array._length2268856 == Array.Cow.Array._length && Main._state2268856 == Main._state && Main._lock2268856 == Main._lock && result$2002268856 == result$200 && elems$2002268856 == elems$200 && this$2002268856 == this$200 && i$2002268856 == i$200 && y2268856 == y && c2268856 == c && this2268856 == this && tid2268856 == tid && $pc2268856 == $pc;
 assume $recorded.state2268856 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume elems$200 != Array.Cow.Array.null;                                                         
 } else {                                                                                           
  assert elems$200 != Array.Cow.Array.null;                                                                // (27.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= i$200;                                                                                
 } else {                                                                                           
  assert 0 <= i$200;                                                                                       // (27.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume i$200 < Array.Cow.Array._length[elems$200];                                                
 } else {                                                                                           
  assert i$200 < Array.Cow.Array._length[elems$200];                                                       // (27.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2268856);                                                              
 assert $pc != PhaseError;                                                                                 // (27.9): Reduction failure
 result$200 := Array.Cow.Array._elems[elems$200][i$200];                                            
                                                                                                    
 // 28.9: y = result$200;                                                                           
                                                                                                    
 y := result$200;                                                                                   
                                                                                                    
 // 28.9: break exit$200;                                                                           
                                                                                                    
 goto exit$200_bottom;                                                                              
                                                                                                    
 // 25.20: y = -1;                                                                                  
                                                                                                    
 y := -1;                                                                                           
                                                                                                    
 // 25.20: break exit$200;                                                                          
                                                                                                    
 goto exit$200_bottom;                                                                              
 exit$200_bottom:                                                                                   
                                                                                                    
 // 38.8: assert y == 5;                                                                            
                                                                                                    
 assume Cow._state2268883 == Cow._state && Cow.elems2268883 == Cow.elems && Cow._lock2268883 == Cow._lock && Array.Cow.Array._state2268883 == Array.Cow.Array._state && Array.Cow.Array._elems2268883 == Array.Cow.Array._elems && Array.Cow.Array._length2268883 == Array.Cow.Array._length && Main._state2268883 == Main._state && Main._lock2268883 == Main._lock && y2268883 == y && c2268883 == c && this2268883 == this && tid2268883 == tid;
 assume $recorded.state2268883 == 1;                                                                
 assert (y==5);                                                                                            // (38.8): This assertion may not hold.
                                                                                                    
 // 34.23: // return;                                                                               
                                                                                                    
 assume Cow._state2268884 == Cow._state && Cow.elems2268884 == Cow.elems && Cow._lock2268884 == Cow._lock && Array.Cow.Array._state2268884 == Array.Cow.Array._state && Array.Cow.Array._elems2268884 == Array.Cow.Array._elems && Array.Cow.Array._length2268884 == Array.Cow.Array._length && Main._state2268884 == Main._state && Main._lock2268884 == Main._lock && y2268884 == y && c2268884 == c && this2268884 == this && tid2268884 == tid;
 assume $recorded.state2268884 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.23): Object invariant may not hold.
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (34.23): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.Array  :: _i == Array.Cow.Array.null <==> isNull(Array.Cow.Array._state[_i])) &&
  (forall _i: Main  :: _i == Main.null <==> isNull(Main._state[_i])) &&                             
  (forall _t: Tid, _i: Array.Cow.Array  :: ValidTid(_t) && isAccessible(Array.Cow.Array._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.Array._this[_i]], _t)) &&
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Array.Cow.Array._state[Cow.elems[_i]]))) &&
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Array.Cow.Array._state[Cow.elems[_i]], _t)))) &&
  (forall _i: Cow :: { Cow.elems[_i] } Array.Cow.Array._this[Cow.elems[_i]] == _i) &&               
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.elems(u: Tid,x: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.elems failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.elems(u: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.5): Cow.elems failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Cow.Array;                                                                  
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.elems[x];                                                                          
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.elems[x] := havocValue;                                                                        
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.elems(u: Tid,x: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.elems failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.Cow.Array;                                                                  
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.elems[x];                                                                          
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.elems(u: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.5): Cow.elems failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.elems(u: Tid,x: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.elems failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, x: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Cow.Array;                                                                  
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.elems[x];                                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.elems[x] := havocValue;                                                                        
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.elems(u: Tid,x: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.elems failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.Array failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.Cow.Array failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Cow.Array._elems[x][i];                                                          
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.Array._elems[x][i] := havocValue;                                                        
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.Array failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Cow.Array._elems[x][i];                                                          
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.Cow.Array failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.Array failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.Array, i: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[x], u);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.Cow.Array._elems[x][i];                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.Array._elems[x][i] := havocValue;                                                        
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.Array failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.elems.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, w0: Array.Cow.Array, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.elems;                                                                                
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var v_pre: Array.Cow.Array;                                                                        
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.elems.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, w0: Array.Cow.Array, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.elems;                                                                                
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.Array;                                                                        
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var v_pre: Array.Cow.Array;                                                                        
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Array.Cow.Array;                                                                       
 var v_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.elems[x];                                                                              
 Cow.elems[x] := v;                                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.elems[x] := tmpV;                                                                              
 Cow.elems[y] := w;                                                                                 
 _writeByTPost := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.elems.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, w0: Array.Cow.Array, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.elems;                                                                                
 modifies Cow.elems;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.Array;                                                                        
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var v_pre: Array.Cow.Array;                                                                        
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Array.Cow.Array;                                                                       
 var v_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.elems[x];                                                                              
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.elems[x] := tmpV;                                                                              
 Cow.elems[y] := w;                                                                                 
 _writeByTPost := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.elems.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, w0: Array.Cow.Array, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.elems;                                                                                
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var v_pre: Array.Cow.Array;                                                                        
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[y] := w;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.elems.Cow.elems(t: Tid, u: Tid, v: Array.Cow.Array, w: Array.Cow.Array, w0: Array.Cow.Array, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.elems;                                                                                
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var v_pre: Array.Cow.Array;                                                                        
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.elems(u: Tid,y: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.elems(u: Tid,y: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: Array.Cow.Array, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Cow.elems;                                                                                
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: Array.Cow.Array, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Cow.elems;                                                                                
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.Array;                                                                        
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var v_mid: Array.Cow.Array;                                                                        
 var y_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.elems[x];                                                                              
 Cow.elems[x] := v;                                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.elems[x] := tmpV;                                                                              
 Array.Cow.Array._elems[y][j] := w;                                                                 
 _writeByTPost := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: Array.Cow.Array, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Cow.elems;                                                                                
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.Array;                                                                        
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var v_mid: Array.Cow.Array;                                                                        
 var y_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.elems[x];                                                                              
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.elems[x] := tmpV;                                                                              
 Array.Cow.Array._elems[y][j] := w;                                                                 
 _writeByTPost := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: Array.Cow.Array, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Cow.elems;                                                                                
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[y][j] := w;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.elems(t: Tid,x: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: Array.Cow.Array, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Cow.elems;                                                                                
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var v_pre: Array.Cow.Array;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v_post: Array.Cow.Array;                                                                       
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.elems(t: Tid,x: Cow,v: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.Array._elems.Cow.elems(t: Tid, u: Tid, v: int, w: Array.Cow.Array, w0: Array.Cow.Array, x_owner: Cow, x: Array.Cow.Array, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.Array._elems;                                                                   
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.Array._elems.Cow.elems(t: Tid, u: Tid, v: int, w: Array.Cow.Array, w0: Array.Cow.Array, x_owner: Cow, x: Array.Cow.Array, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.Array._elems;                                                                   
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var x_mid: Array.Cow.Array;                                                                        
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Array.Cow.Array;                                                                       
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.Array._elems[x][i];                                                              
 Array.Cow.Array._elems[x][i] := v;                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.Array._elems[x][i] := tmpV;                                                              
 Cow.elems[y] := w;                                                                                 
 _writeByTPost := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.Array._elems.Cow.elems(t: Tid, u: Tid, v: int, w: Array.Cow.Array, w0: Array.Cow.Array, x_owner: Cow, x: Array.Cow.Array, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.Array._elems;                                                                   
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var x_mid: Array.Cow.Array;                                                                        
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Array.Cow.Array;                                                                       
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.Array._elems[x][i];                                                              
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.Array._elems[x][i] := tmpV;                                                              
 Cow.elems[y] := w;                                                                                 
 _writeByTPost := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.Array._elems.Cow.elems(t: Tid, u: Tid, v: int, w: Array.Cow.Array, w0: Array.Cow.Array, x_owner: Cow, x: Array.Cow.Array, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.Array._elems;                                                                   
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.elems(u: Tid,y: Cow,w: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.elems[y] := w;                                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.Array._elems.Cow.elems(t: Tid, u: Tid, v: int, w: Array.Cow.Array, w0: Array.Cow.Array, x_owner: Cow, x: Array.Cow.Array, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.Array._elems;                                                                   
 modifies Cow.elems;                                                                                
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Array.Cow.Array;                                                                        
 var x_pre: Array.Cow.Array;                                                                        
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var w0_pre: Array.Cow.Array;                                                                       
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var w_post: Array.Cow.Array;                                                                       
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var w0_post: Array.Cow.Array;                                                                      
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.elems(u: Tid,y: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.elems(u: Tid,y: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.Array._elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.Array, i: int, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.Array._elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.Array, i: int, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var x_mid: Array.Cow.Array;                                                                        
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var y_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.Array._elems[x][i];                                                              
 Array.Cow.Array._elems[x][i] := v;                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.Array._elems[x][i] := tmpV;                                                              
 Array.Cow.Array._elems[y][j] := w;                                                                 
 _writeByTPost := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.Array._elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.Array, i: int, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var Cow.elems_mid: [Cow]Array.Cow.Array;                                                           
 var t_mid: Tid;                                                                                    
 var Array.Cow.Array._state_mid: [Array.Cow.Array]State;                                            
 var x_mid: Array.Cow.Array;                                                                        
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var y_mid: Array.Cow.Array;                                                                        
 var Array.Cow.Array._length_mid: [Array.Cow.Array]int;                                             
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Array.Cow.Array._elems_mid: [Array.Cow.Array]([int]int);                                       
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.Array._elems[x][i];                                                              
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_mid == Cow._state && Cow.elems_mid == Cow.elems && Cow._lock_mid == Cow._lock && Array.Cow.Array._state_mid == Array.Cow.Array._state && Array.Cow.Array._elems_mid == Array.Cow.Array._elems && Array.Cow.Array._length_mid == Array.Cow.Array._length && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.Array._elems[x][i] := tmpV;                                                              
 Array.Cow.Array._elems[y][j] := w;                                                                 
 _writeByTPost := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.Array._elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.Array, i: int, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,w: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[y][j] := w;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.Array._elems.Array.Cow.Array._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.Array, i: int, y_owner: Cow, y: Array.Cow.Array, j: int)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.Array._state[x], t);                                               
 requires Array.Cow.Array._this[x] == x_owner;                                                      
 requires isAccessible(Array.Cow.Array._state[y], u);                                               
 requires Array.Cow.Array._this[y] == y_owner;                                                      
 modifies Array.Cow.Array._elems;                                                                   
 modifies Array.Cow.Array._elems;                                                                   
                                                                                                    
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
 var y_pre: Array.Cow.Array;                                                                        
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var x_pre: Array.Cow.Array;                                                                        
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                       
 var Cow.elems_pre: [Cow]Array.Cow.Array;                                                           
 var Main._lock_pre: [Main]Tid;                                                                     
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                            
 var t_pre: Tid;                                                                                    
 var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                             
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.elems_post: [Cow]Array.Cow.Array;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Main._state_post: [Main]State;                                                                 
 var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                           
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var y_post: Array.Cow.Array;                                                                       
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var x_post: Array.Cow.Array;                                                                       
 var Main._lock_post: [Main]Tid;                                                                    
 var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                      
 var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.Array(t: Tid,x_owner: Cow,x: Array.Cow.Array,i: int,v: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.Array._elems[x][i] := v;                                                                 
 assume Cow._state_post == Cow._state && Cow.elems_post == Cow.elems && Cow._lock_post == Cow._lock && Array.Cow.Array._state_post == Array.Cow.Array._state && Array.Cow.Array._elems_post == Array.Cow.Array._elems && Array.Cow.Array._length_post == Array.Cow.Array._length && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.Array(u: Tid,y_owner: Cow,y: Array.Cow.Array,j: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
requires ValidTid(tid);                                                                             
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.elems;                                                                                 
modifies Cow._lock;                                                                                 
modifies Array.Cow.Array._state;                                                                    
modifies Array.Cow.Array._elems;                                                                    
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
ensures StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures Y(tid , old(Cow._state), old(Cow.elems), old(Cow._lock), old(Array.Cow.Array._state), old(Array.Cow.Array._elems), old(Array.Cow.Array._length), old(Main._state), old(Main._lock) , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow.elems:                                                                                       
                                                                                                    
function {:inline} Y_Cow.elems(tid : Tid, this: Cow, newValue: Array.Cow.Array , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.elems(tid: Tid,this: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _R)) ==> (Cow.elems[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.elems(tid : Tid, this: Cow, newValue: Array.Cow.Array , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.elems.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Array.Cow.Array , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var newValue_yield: Array.Cow.Array;                                                                
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.elems(u: Tid,this: Cow,newValue: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.elems(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow.elems.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.elems(tid, this, Cow.elems[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow.elems.Transitive(tid : Tid, this: Cow, newValue : Array.Cow.Array , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid , Cow._state_p: [Cow]State, Cow.elems_p: [Cow]Array.Cow.Array, Cow._lock_p: [Cow]Tid, Array.Cow.Array._state_p: [Array.Cow.Array]State, Array.Cow.Array._elems_p: [Array.Cow.Array]([int]int), Array.Cow.Array._length_p: [Array.Cow.Array]int, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires StateInvariant(Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (6.26): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (6.26): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var newValue_pre: Array.Cow.Array;                                                                  
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                        
var Cow.elems_pre: [Cow]Array.Cow.Array;                                                            
var Main._lock_pre: [Main]Tid;                                                                      
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                             
var this_pre: Cow;                                                                                  
var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.elems_post: [Cow]Array.Cow.Array;                                                           
var Main._state_post: [Main]State;                                                                  
var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                            
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Main._lock_post: [Main]Tid;                                                                     
var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                       
var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                             
var newValue_post: Array.Cow.Array;                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 assume Y_Cow.elems(tid, this, newValue , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
assume Cow._state_post == Cow._state_p && Cow.elems_post == Cow.elems_p && Cow._lock_post == Cow._lock_p && Array.Cow.Array._state_post == Array.Cow.Array._state_p && Array.Cow.Array._elems_post == Array.Cow.Array._elems_p && Array.Cow.Array._length_post == Array.Cow.Array._length_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.elems(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var newValue_yield: Tid;                                                                            
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid , Cow._state_p: [Cow]State, Cow.elems_p: [Cow]Array.Cow.Array, Cow._lock_p: [Cow]Tid, Array.Cow.Array._state_p: [Array.Cow.Array]State, Array.Cow.Array._elems_p: [Array.Cow.Array]([int]int), Array.Cow.Array._length_p: [Array.Cow.Array]int, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires StateInvariant(Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (2.1): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                        
var Cow.elems_pre: [Cow]Array.Cow.Array;                                                            
var Main._lock_pre: [Main]Tid;                                                                      
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                             
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.elems_post: [Cow]Array.Cow.Array;                                                           
var Main._state_post: [Main]State;                                                                  
var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                            
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Main._lock_post: [Main]Tid;                                                                     
var newValue_post: Tid;                                                                             
var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                       
var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
assume Cow._state_post == Cow._state_p && Cow.elems_post == Cow.elems_p && Cow._lock_post == Cow._lock_p && Array.Cow.Array._state_post == Array.Cow.Array._state_p && Array.Cow.Array._elems_post == Array.Cow.Array._elems_p && Array.Cow.Array._length_post == Array.Cow.Array._length_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
// Array.Cow.Array:                                                                                 
                                                                                                    
function {:inline} Y_Array.Cow.Array(tid : Tid, athis: Array.Cow.Array, index: int, newValue: int , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
(var this := Array.Cow.Array._this[athis];                                                          
 ((isAccessible(Array.Cow.Array._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.Array(tid: Tid,Array.Cow.Array._this[athis]: Cow,athis: Array.Cow.Array,index: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _R)) ==> (Array.Cow.Array._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.Array(tid : Tid, athis: Array.Cow.Array, index: int, newValue: int , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
(var this := Array.Cow.Array._this[athis];                                                          
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.Array.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.Array, index: int, newValue: int , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.Array._this[athis];                                                     
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var athis_yield: Array.Cow.Array;                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var index_yield: int;                                                                               
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.Array._state[athis], u);                                             
 assume !isError(m#moverPath(WriteEval.Array.Cow.Array(u: Tid,Array.Cow.Array._this[athis]: Cow,athis: Array.Cow.Array,index: int,newValue: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.Array(tid, athis, index, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.Array.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.Array, index: int , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.Array._this[athis];                                                     
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var athis_yield: Array.Cow.Array;                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var index_yield: int;                                                                               
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.Array._state[athis], tid);                                           
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.Array(tid, athis, index, Array.Cow.Array._elems[athis][index] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.Array.Transitive(tid : Tid, this: Cow, athis: Array.Cow.Array, index: int, newValue : int , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid , Cow._state_p: [Cow]State, Cow.elems_p: [Cow]Array.Cow.Array, Cow._lock_p: [Cow]Tid, Array.Cow.Array._state_p: [Array.Cow.Array]State, Array.Cow.Array._elems_p: [Array.Cow.Array]([int]int), Array.Cow.Array._length_p: [Array.Cow.Array]int, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires StateInvariant(Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (4.23): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (4.23): Object invariant may not hold.
                                                                                                    
 requires this == Array.Cow.Array._this[athis];                                                     
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                        
var Cow.elems_pre: [Cow]Array.Cow.Array;                                                            
var Main._lock_pre: [Main]Tid;                                                                      
var index_pre: int;                                                                                 
var athis_pre: Array.Cow.Array;                                                                     
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                             
var this_pre: Cow;                                                                                  
var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                              
                                                                                                    
var athis_post: Array.Cow.Array;                                                                    
var $recorded.state_post: int;                                                                      
var Cow.elems_post: [Cow]Array.Cow.Array;                                                           
var Main._state_post: [Main]State;                                                                  
var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                            
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
var Main._lock_post: [Main]Tid;                                                                     
var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                       
var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow.elems_post == Cow.elems_p && Cow._lock_post == Cow._lock_p && Array.Cow.Array._state_post == Array.Cow.Array._state_p && Array.Cow.Array._elems_post == Array.Cow.Array._elems_p && Array.Cow.Array._length_post == Array.Cow.Array._length_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.Array._state[athis], tid);                                           
 assume Y(tid , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 assume Y_Array.Cow.Array(tid, athis, index, newValue , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 assert Y_Array.Cow.Array(tid, athis, index, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
// Main._lock:                                                                                      
                                                                                                    
function {:inline} Y_Main._lock(tid : Tid, this: Main, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Main._state[this], tid) && leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _R)) ==> (Main._lock[this] == newValue))
 &&(((Main._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Main._lock(tid : Tid, this: Main, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Subsumes.W(tid : Tid, u : Tid, this: Main, newValue: Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var newValue_yield: Tid;                                                                            
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume isAccessible(Main._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Main._lock(u: Tid,this: Main,newValue: Tid,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Reflexive(tid : Tid, this: Main , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.elems_yield: [Cow]Array.Cow.Array;                                                          
var Array.Cow.Array._state_yield: [Array.Cow.Array]State;                                           
var Array.Cow.Array._length_yield: [Array.Cow.Array]int;                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var Array.Cow.Array._elems_yield: [Array.Cow.Array]([int]int);                                      
var Cow._state_yield: [Cow]State;                                                                   
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
assume Cow._state_yield == Cow._state && Cow.elems_yield == Cow.elems && Cow._lock_yield == Cow._lock && Array.Cow.Array._state_yield == Array.Cow.Array._state && Array.Cow.Array._elems_yield == Array.Cow.Array._elems && Array.Cow.Array._length_yield == Array.Cow.Array._length && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, Main._lock[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Transitive(tid : Tid, this: Main, newValue : Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid , Cow._state_p: [Cow]State, Cow.elems_p: [Cow]Array.Cow.Array, Cow._lock_p: [Cow]Tid, Array.Cow.Array._state_p: [Array.Cow.Array]State, Array.Cow.Array._elems_p: [Array.Cow.Array]([int]int), Array.Cow.Array._length_p: [Array.Cow.Array]int, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
 requires StateInvariant(Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268191(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (33.1): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2268217(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (33.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var this_pre: Main;                                                                                 
var Array.Cow.Array._elems_pre: [Array.Cow.Array]([int]int);                                        
var Cow.elems_pre: [Cow]Array.Cow.Array;                                                            
var Main._lock_pre: [Main]Tid;                                                                      
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var Array.Cow.Array._state_pre: [Array.Cow.Array]State;                                             
var newValue_pre: Tid;                                                                              
var Array.Cow.Array._length_pre: [Array.Cow.Array]int;                                              
                                                                                                    
var this_post: Main;                                                                                
var $recorded.state_post: int;                                                                      
var Cow.elems_post: [Cow]Array.Cow.Array;                                                           
var Main._state_post: [Main]State;                                                                  
var Array.Cow.Array._state_post: [Array.Cow.Array]State;                                            
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Main._lock_post: [Main]Tid;                                                                     
var newValue_post: Tid;                                                                             
var Array.Cow.Array._elems_post: [Array.Cow.Array]([int]int);                                       
var Array.Cow.Array._length_post: [Array.Cow.Array]int;                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.elems_pre == Cow.elems && Cow._lock_pre == Cow._lock && Array.Cow.Array._state_pre == Array.Cow.Array._state && Array.Cow.Array._elems_pre == Array.Cow.Array._elems && Array.Cow.Array._length_pre == Array.Cow.Array._length && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume Y(tid , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
 assume Y_Main._lock(tid, this, newValue , Cow._state_p, Cow.elems_p, Cow._lock_p, Array.Cow.Array._state_p, Array.Cow.Array._elems_p, Array.Cow.Array._length_p, Main._state_p, Main._lock_p);
assume Cow._state_post == Cow._state_p && Cow.elems_post == Cow.elems_p && Cow._lock_post == Cow._lock_p && Array.Cow.Array._state_post == Array.Cow.Array._state_p && Array.Cow.Array._elems_post == Array.Cow.Array._elems_p && Array.Cow.Array._length_post == Array.Cow.Array._length_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Main._lock(tid, this, newValue , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.elems: [Cow]Array.Cow.Array, Cow._lock: [Cow]Tid, Array.Cow.Array._state: [Array.Cow.Array]State, Array.Cow.Array._elems: [Array.Cow.Array]([int]int), Array.Cow.Array._length: [Array.Cow.Array]int, Main._state: [Main]State, Main._lock: [Main]Tid , Cow._state_p: [Cow]State, Cow.elems_p: [Cow]Array.Cow.Array, Cow._lock_p: [Cow]Tid, Array.Cow.Array._state_p: [Array.Cow.Array]State, Array.Cow.Array._elems_p: [Array.Cow.Array]([int]int), Array.Cow.Array._length_p: [Array.Cow.Array]int, Main._state_p: [Main]State, Main._lock_p: [Main]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.elems(tid : Tid, this, Cow.elems_p[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock))
 && (forall this: Main :: Y_Main._lock(tid : Tid, this, Main._lock_p[this] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock))
 && (forall athis: Array.Cow.Array, index: int :: Y_Array.Cow.Array(tid : Tid, athis, index, Array.Cow.Array._elems_p[athis][index] , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Main :: isShared(Main._state[_i]) ==> isShared(Main._state_p[_i]))                 
 && (forall _i : Main :: isLocal(Main._state[_i], tid) <==> isLocal(Main._state_p[_i], tid))        
 && (forall _i : Array.Cow.Array :: isShared(Array.Cow.Array._state[_i]) ==> isShared(Array.Cow.Array._state_p[_i]))
 && (forall _i : Array.Cow.Array :: Array.Cow.Array._length[_i] == Array.Cow.Array._length_p[_i])   
 && (forall _i : Array.Cow.Array :: isLocal(Array.Cow.Array._state[_i], tid) <==> isLocal(Array.Cow.Array._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 878.1-1283.2: (Method:34.4)
// 889.1-889.24: (34.4): Bad tid
// 890.1-890.38: (34.4): this is not global
// 893.1-893.275: (34.4): Object invariant may not hold.
// 894.1-894.275: (34.4): Object invariant may not hold.
// 897.1-897.274: (34.4): Object invariant may not hold.
// 898.1-898.274: (34.4): Object invariant may not hold.
// 1054.2-1056.2: (class anchor.sink.VarDeclStmt:35.8)
// 1057.2-1064.35: (class anchor.sink.Alloc:35.8)
// 1067.2-1069.2: (class anchor.sink.VarDeclStmt:36.8)
// 1070.2-1073.16: (class anchor.sink.Assign:36.8)
// 1074.2-1076.2: (class anchor.sink.VarDeclStmt:13.9)
// 1077.2-1085.85: (class anchor.sink.AAlloc:13.9)
// 1086.2-1088.2: (class anchor.sink.VarDeclStmt:16.14)
// 1089.2-1092.13: (class anchor.sink.Assign:16.22)
// 1095.2-1099.20: (class anchor.sink.While:16.27)
// 1101.1-1101.27: (34.4): Bad tid
// 1102.1-1102.41: (34.4): this is not global
// 1105.1-1105.284: (16.27): Object invariant may not hold.
// 1106.1-1106.284: (16.27): Object invariant may not hold.
// 1106.284-1107.121: (16.27): invariant forall int k$199 ::0 <= k$199 && k$199 < i$199 ==> elems$199[k$199] == k$199 may not hold
// 1107.121-1108.61: (16.27): invariant isLocal(elems$199, tid) may not hold
// 1109.1-1109.276: (16.27): Loop does not preserve yields_as annotation for field elems
// 1110.1-1110.340: (16.27): Loop does not preserve yields_as annotation for field ArrayDecl(Array,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 1111.1-1111.33: (16.27): Phase must be invariant at loop head
// 1112.1-1112.30: (16.27): Potentially infinite loop cannot be in post-commit phase.
// 1114.3-1141.53: (class anchor.sink.AWrite:20.13)
// 1126.1-1126.45: (20.13): Cannot have potential null deference in left-mover part.
// 1131.1-1131.22: (20.13): index < 0.
// 1136.1-1136.54: (20.13): index is >= length.
// 1140.1-1140.28: (20.13): Reduction failure
// 1142.3-1145.22: (class anchor.sink.Assign:16.39)
// 1148.1-1148.30: (16.27): Phase must be invariant at loop head
// 1151.2-1175.2: (class anchor.sink.Write:22.9)
// 1163.1-1163.31: (22.9): Cannot have potential null deference in left-mover part.
// 1166.1-1166.27: (22.9): Reduction failure
// 1172.1-1172.99: (22.9): elems$199 became shared, but Array.Cow.Array._this[elems$199].elems may not be shared.
// 1176.2-1179.23: (class anchor.sink.Break:12.17)
// 1181.2-1183.2: (class anchor.sink.VarDeclStmt:37.8)
// 1186.2-1188.2: (class anchor.sink.VarDeclStmt:37.8)
// 1189.2-1191.2: (class anchor.sink.VarDeclStmt:37.8)
// 1192.2-1195.13: (class anchor.sink.Assign:37.8)
// 1196.2-1199.16: (class anchor.sink.Assign:37.8)
// 1200.2-1202.2: (class anchor.sink.VarDeclStmt:26.9)
// 1203.2-1220.35: (class anchor.sink.Read:26.9)
// 1215.1-1215.31: (26.9): Cannot have potential null deference in left-mover part.
// 1219.1-1219.27: (26.9): Reduction failure
// 1221.2-1223.2: (class anchor.sink.VarDeclStmt:27.9)
// 1224.2-1251.57: (class anchor.sink.ARead:27.9)
// 1236.1-1236.44: (27.9): Cannot have potential null deference in left-mover part.
// 1241.1-1241.21: (27.9): index < 0.
// 1246.1-1246.53: (27.9): index is >= length.
// 1250.1-1250.27: (27.9): Reduction failure
// 1252.2-1255.18: (class anchor.sink.Assign:28.9)
// 1256.2-1259.23: (class anchor.sink.Break:28.9)
// 1260.2-1263.10: (class anchor.sink.Assign:25.20)
// 1264.2-1267.23: (class anchor.sink.Break:25.20)
// 1269.2-1274.16: (class anchor.sink.Assert:38.8)
// 1274.1-1274.16: (38.8): This assertion may not hold.
// 1275.2-1282.9: (class anchor.sink.Return:34.23)
// 1280.1-1280.274: (34.23): Object invariant may not hold.
// 1281.1-1281.274: (34.23): Object invariant may not hold.
// 1373.1-1373.34: (6.5): Cow.elems failed Write-Write Right-Mover Check
// 1440.1-1440.30: (6.5): Cow.elems failed Write-Read Right-Mover Check
// 1511.1-1511.34: (6.5): Cow.elems failed Write-Write Left-Mover Check
// 1579.1-1579.30: (6.5): Cow.elems failed Write-Read Left-Mover Check
// 1644.1-1644.34: (6.5): Cow.elems failed Read-Write Right-Mover Check
// 1712.1-1712.34: (6.5): Cow.elems failed Read-Write Left-Mover Check
// 1785.1-1785.34: (4.5): Array Array.Cow.Array failed Write-Write Right-Mover Check
// 1858.1-1858.30: (4.5): Array Array.Cow.Array failed Write-Read Right-Mover Check
// 1935.1-1935.34: (4.5): Array Array.Cow.Array failed Write-Write Left-Mover Check
// 2009.1-2009.30: (4.5): Array Array.Cow.Array failed Write-Read Left-Mover Check
// 2080.1-2080.34: (4.5): Array Array.Cow.Array failed Read-Write Right-Mover Check
// 2154.1-2154.34: (4.5): Array Array.Cow.Array failed Read-Write Left-Mover Check
// 2233.1-2233.140: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.1)
// 2234.1-2234.101: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.2)
// 2235.1-2235.158: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.3)
// 2343.1-2343.140: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case C)
// 2456.1-2456.144: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case D)
// 2457.1-2457.144: (6.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case R)
// 2536.1-2536.136: (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case F)
// 2537.1-2537.136: (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case H)
// 2538.1-2538.146: (6.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case I)
// 2616.1-2616.136: (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case J)
// 2617.1-2617.136: (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case K)
// 2618.1-2618.99: (6.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case L)
// 2703.1-2703.140: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.1)
// 2704.1-2704.101: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.2)
// 2705.1-2705.156: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.3)
// 2820.1-2820.140: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
// 2940.1-2940.144: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
// 2941.1-2941.144: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
// 3025.1-3025.136: (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
// 3026.1-3026.136: (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
// 3027.1-3027.144: (6.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
// 3110.1-3110.136: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case J)
// 3111.1-3111.136: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case K)
// 3112.1-3112.99: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case L)
// 3197.1-3197.140: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
// 3198.1-3198.101: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
// 3199.1-3199.156: (6.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
// 3314.1-3314.140: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case C)
// 3434.1-3434.144: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case D)
// 3435.1-3435.144: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case R)
// 3519.1-3519.136: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case F)
// 3520.1-3520.136: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case H)
// 3521.1-3521.144: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case I)
// 3604.1-3604.136: (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
// 3605.1-3605.136: (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
// 3606.1-3606.99: (6.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
// 3696.1-3696.140: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
// 3697.1-3697.101: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
// 3698.1-3698.156: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
// 3820.1-3820.140: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
// 3947.1-3947.144: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
// 3948.1-3948.144: (4.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
// 4037.1-4037.136: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
// 4038.1-4038.136: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
// 4039.1-4039.144: (4.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
// 4127.1-4127.136: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
// 4128.1-4128.136: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
// 4129.1-4129.99: (4.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
// 4136.1-4136.275: (<undefined position>): Object invariant may not hold.
// 4137.1-4137.275: (<undefined position>): Object invariant may not hold.
// 4147.1-4147.274: (<undefined position>): Object invariant may not hold.
// 4148.1-4148.274: (<undefined position>): Object invariant may not hold.
// 4168.1-4192.2: (6.5): yields_as clause for Cow.elems is not valid
// 4197.1-4216.2: (6.5): yields_as clause for Cow.elems is not reflexive
// 4222.1-4222.275: (6.26): Object invariant may not hold.
// 4223.1-4223.275: (6.26): Object invariant may not hold.
// 4224.1-4262.2: (6.5): yields_as clause for Cow.elems is not transitive
// 4282.1-4306.2: (7.32): yields_as clause for Cow._lock is not valid
// 4311.1-4330.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4336.1-4336.275: (2.1): Object invariant may not hold.
// 4337.1-4337.275: (2.1): Object invariant may not hold.
// 4338.1-4376.2: (7.32): yields_as clause for Cow._lock is not transitive
// 4394.1-4422.2: (4.5): yields_as clause for Array.Cow.Array is not valid
// 4423.1-4448.2: (4.5): yields_as clause for Array.Cow.Array is not reflexive
// 4453.1-4453.275: (4.23): Object invariant may not hold.
// 4454.1-4454.275: (4.23): Object invariant may not hold.
// 4455.1-4497.2: (4.5): yields_as clause for Array.Cow.Array is not transitive
// 4517.1-4541.2: (7.32): yields_as clause for Main._lock is not valid
// 4546.1-4565.2: (7.32): yields_as clause for Main._lock is not reflexive
// 4571.1-4571.275: (33.1): Object invariant may not hold.
// 4572.1-4572.275: (33.1): Object invariant may not hold.
// 4573.1-4611.2: (7.32): yields_as clause for Main._lock is not transitive
